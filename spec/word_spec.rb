require('rspec')
require('word')
require('definition')

describe(Word) do

  describe('.all') do
    it('returns the word array empty') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('clears words array of entries') do
      new_word = Word.new({:word => 'JFK', :definition => 'political leader'})
      new_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a word based on its id') do
      new_word = Word.new({:word => 'harmony', :definition => 'peace'})
      new_word.save()
      new_word = Word.new({:word => 'buddha', :definition => 'religious leader'})
      new_word2.save()
      expect(Word.find(2)).to(eq(new_word2))
    end
  end

  describe('#word') do
    it('returns a word for the user') do
      new_word = Word.new({:word => 'jesus', :definition => 'christian leader'})
      expect(new_word.word()).to(eq('autonomous'))
    end
  end

  describe('#save') do
    it('saves a word to the word array') do
      new_word = Word.new({:word => 'god', :definition => 'diety for religion'})
      new_word.save()
      expect(Word.all()).to(eq([new_word]))
    end
  end

  describe('#add_definition') do
    it('adds a definition to a word') do
      new_word = Word.new({:word => 'muhammad', :definition => 'islam leader'})
      new_word.save()
      expect(new_word.add_definition('islam leader')).to(eq(['islam leader']))
    end
  end

end
