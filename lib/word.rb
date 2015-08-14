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

#why is the argument error method pointing here? is this not getting an argument? or somewhere else in process?
  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
#testing to see if a different method can be seen
  define_method(:show_word_definition) do
    @definitions
  end
  
end
