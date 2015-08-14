require('rspec')
require('word')
require('definition')

describe(Word) do

  describe('.all') do
    it('returns the word array empty') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#word') do
    it('returns a word for the user') do
      new_word = Word.new({:word => 'autonomous'})
      expect(new_word.word()).to(eq('autonomous'))
    end
  end


end
