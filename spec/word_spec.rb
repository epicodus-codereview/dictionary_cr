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
      new_word = Word.new({:word => 'justice'})
      new_contact.save()
      Contacts.clear()
      expect(Contacts.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a word based on its id') do
      new_word = Word.new({:word => 'harmony'})
      new_word.save()
      new_word2 = Word.new(:word => 'buddha')
      new_word2.save()
      expect(Contacts.find(2)).to(eq(new_word2))
    end
  end

  describe('#word') do
    it('returns a word for the user') do
      new_word = Word.new({:word => 'autonomous'})
      expect(new_word.word()).to(eq('autonomous'))
    end
  end

  describe('#save') do
    it('saves a word to the word array') do
      new_word = Word.new({:word => 'josue'})
      new_word.save()
      expect(Word.all()).to(eq([new_word]))
    end
  end

end
