class Word

  @@words = []
  @@id_count = 0

  attr_reader :word, :definition, :id

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
  end

  define_method(:save) do
    @@words.push(self)
  end

end
