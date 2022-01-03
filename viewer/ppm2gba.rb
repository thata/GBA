# ppmファイルをGBA用のバイナリ形式画像に変換
# usage: ruby ppm2gba.rb shuttle_240x160.ppm > shuttle.gba

data = File.read(ARGV.shift).split
image_data = (data[4..-1]).map(&:to_i)
image_data.each_slice(3) do |r256, g256, b256|
  # 8bitカラーを5bitカラーに変換
  r32 = r256 >> 3
  g32 = g256 >> 3
  b32 = b256 >> 3
  # RGBの5bitカラーを以下の形式で2バイトに詰め込む
  # [0bbb_bbgg, gggr_rrrr]
  byte0 = b32 << 2 | g32 >> 3
  byte1 = g32 << 5 | r32
  print [byte1, byte0].pack("C*")
end
