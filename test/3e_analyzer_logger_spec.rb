require 'minitest/autorun'
require_relative '../6wk/3e_analyzer_logger'

# 3e_analyzer_logger uses a modified version of the original analyzer program.
# I have therefore included tests in this file to test each function of the
# analyzer.

describe Symbol do
  it 'must titleize a symbol' do
    s = :lower_case_symbol
    s.titleize.must_equal('Lower Case Symbol')
  end
end

describe Hash do
  it 'must display results of symbol Hash in k: v format' do
    h = {color: 'red', number: 2, animal: 'cat'}
    h.display.must_equal("Color: red\nNumber: 2\nAnimal: cat\n")
  end
end

describe 'analyzer' do
  before :each do
    @s = "Hello friend!\nYou're looking well. Working out much?\nHow'd I know."
  end

  it 'must count lines' do
    analyze(@s)[:lines].must_equal(3)
  end

  it 'must count all characters including line endings' do
    analyze(@s)[:characters].must_equal(66)
  end

  it 'must count all characters minus spaces and new lines' do
    analyze(@s)[:characters_ex_spaces].must_equal(56)
  end

  it 'must count all words' do
    analyze(@s)[:words].must_equal(11)
  end

  it 'must count all sentences' do
    analyze(@s)[:sentences].must_equal(4)
  end

  it 'must count all paragraphs' do
    analyze(@s)[:paragraphs].must_equal(1)
  end

  it 'must calculate words per sentence' do
    analyze(@s)[:words_per_sentence].must_equal(2.75)
  end

  it 'must calculate sentences per paragraph' do
    analyze(@s)[:sentences_per_paragraph].must_equal(4)
  end
end
