require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

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
      new_word2 = Word.new({:word => 'buddha', :definition => 'religious leader'})
      new_word2.save()
      expect(Word.find(2)).to(eq(new_word2))
    end
  end

  describe('#word') do
    it('returns a word for the user') do
      new_word = Word.new({:word => 'jesus', :definition => 'christian leader'})
      expect(new_word.word()).to(eq('jesus'))
    end
  end

  describe('#save') do
    it('saves a word to the word array') do
      Word.clear()
      new_word = Word.new({:word => 'god', :definition => 'diety for religion'})
      new_word.save()
      expect(Word.all()).to(eq([new_word]))
    end
  end

  # you want to add a definition object to the word object, not a string
  # also you want to check that the word has correctly stored the new definition rather than simply checking the return value of the add_definition method
  describe('#add_definition') do
    it('adds a definition to a word') do
      new_word = Word.new({:word => 'muhammad', :definition => 'islam leader'})
      new_word.save()
      new_definition = Definition.new(:definition => 'islam leader')
      new_word.add_definition(new_definition)
      expect(new_word.definitions()).to(eq([new_definition]))
    end
  end

end
