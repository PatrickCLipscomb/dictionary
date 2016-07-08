class Word
  @@words = []
  attr_reader(:word, :pronunciation, :alternative_spelling, :origin)
  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @pronunciation = attributes.fetch(:pronunciation)
    @alternative_spelling = attributes.fetch(:alternative_spelling)
    @origin = attributes.fetch(:origin)
    @id = @@words.length + 1
    @definitions = []
  end
  define_method(:id) do
    @id
  end
  define_method(:definitions) do
    @definitions
  end
  define_method(:save) do
    @@words.push(self)
  end
  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
  define_singleton_method(:all) do
    @@words
  end
  define_singleton_method(:clear) do
    @@words = []
  end
  define_singleton_method(:find) do |identification|
    lost_word = nil
    @@words.each() do |word|
      if word.id().eql?(identification.to_i())
        lost_word = word
      end
    end
    lost_word
  end
end
