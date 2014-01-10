require 'minitest/autorun'
require_relative '../6wk/2e_mp3_file'

describe 'mp3 file' do
  before :each do
    song_file = 'test_songs/song.mp3'
    faulty_file = '1wk/2c_convert.rb'
    @tag_actual = File.open(song_file, 'r').readlines.join.byteslice(-128..-1)
    @tag_faulty = File.open(faulty_file, 'r').readlines.join.byteslice(-128..-1)
  end

  it 'must recognize a valid id3 tag' do
    tag_defined?(@tag_actual).must_equal(true)
    tag_defined?(@tag_faulty).wont_equal(true)
  end

  it 'must raise an error when tag is faulty' do
    expected = -> { song_info(@tag_faulty) }
    expected.must_raise(UnreadableSongError)
  end

  it 'must create a hash containing song information' do
    expected = { title: 'Dancing Shoes',
                 artist: 'Cliff Richard and The Shadows',
                 album: '(SUMMER HOLIDAY  1963)',
                 year: '2000',
                 comment: "#100%-Free-MP3s(Dalnet) Anni\x00\r",
                 genre: 24
               }
    song_info(@tag_actual).must_equal(expected)
  end

  it 'must select the corrext genre' do
    genre_id = song_info(@tag_actual)[:genre]
    get_genre(genre_id).must_equal('Soundtrack')
  end
end
