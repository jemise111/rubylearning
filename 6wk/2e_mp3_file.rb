# 2e_mp3_file.rb
# Write a program that analyzes an mp3 file according to the specifications
require_relative 'genre_codes'

class UnreadableSongError < RuntimeError
end

def song_info(id3_tag)
  fail UnreadableSongError unless tag_defined?(id3_tag)
  encoded_information = id3_tag[3..-1].unpack('A30' * 3+'A4A30U1')
  song_info_keys = [:title, :artist, :album, :year, :comment, :genre]
  Hash[song_info_keys.zip encoded_information]
end

def tag_defined?(id3_tag)
  id3_tag[0, 3] == 'TAG'
end

if __FILE__ == $PROGRAM_NAME
  begin
    id3_tag = IO.read(ARGV[0]).byteslice(-128..-1)
    song_info(id3_tag).each do |k, v|
      puts "#{k.to_s.capitalize}: #{k == :genre ? get_genre(v) : v}"
    end
  rescue UnreadableSongError
    puts 'Song file in unreadable format'
  rescue Exception # if no file given or other problems
    puts 'usage: 2e_mp3_file.rb <song_file>'
  end
end
