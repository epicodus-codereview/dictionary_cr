class Word

  @@words = []
  @@id_count = 0

  attr_reader :word, :id

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@id_count + 1
    @@id_count += 1
    @definitions = []

  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
    @@id_count = 0
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each do |word|
      if word.id() == id
        found_word = word
      end
    end
    found_word
  end

#Something is wrong with this, but I don't know what is causing the error message.
#Why is it not getting an argument?
  define_method(:add_definition) do |word_definition|
    @definitions.push(word_definition)
  end

end
