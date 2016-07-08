require('rspec')
require('words')

describe('Word') do
  before() do
    Word.clear()
  end
  describe('#save') do
    it('adds the object to the words array') do
      test_word = Word.new(:word => 'arcane', :pronunciation => 'ahr-keyn', :alternative_spelling => nil, :origin => 'mid 16th centurn Latin')
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end
  describe('.clear') do
    it('clears objects from the words array') do
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
  describe('.find') do
    it('returns an object based on its id') do
      test_word = Word.new(:word => 'arcane', :pronunciation => 'ahr-keyn', :alternative_spelling => nil, :origin => 'mid 16th centurny Latin')
      test_word.save()
      test_word2 = Word.new(:word => 'gratuitous', :pronunciation => 'gruh-too-i-tuh s', :alternative_spelling => nil, :origin => '17th century Latin')
      test_word2.save()
      expect(Word.find(2)).to(eq(test_word2))
    end
  end
  describe('#pronunciation') do
    it('returns the word\'s pronunciation') do
      test_word = Word.new(:word => 'gratuitous', :pronunciation => 'gruh-too-i-tuh s', :alternative_spelling => nil, :origin => '17th century Latin')
      expect(test_word.pronunciation()).to(eq('gruh-too-i-tuh s'))
    end
  end
  describe('#alternative_spelling') do
    it('returns the word\'s alternative_spelling') do
      test_word = Word.new(:word => 'gratuitous', :pronunciation => 'gruh-too-i-tuh s', :alternative_spelling => nil, :origin => '17th century Latin')
      expect(test_word.alternative_spelling()).to(eq(nil))
    end
  end
end
