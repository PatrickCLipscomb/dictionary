require('rspec')
require('definitions')

describe('Definition') do
  describe('#definition') do
    it('returns the definition') do
      test_definition = Definition.new({:definition => 'used to describe something hip', :example => 'those cowboy boots are deck'})
      expect(test_definition.definition()).to(eq('used to describe something hip'))
    end
  end
  describe('#example') do
    it('returns the example of a definition') do
      test_definition = Definition.new({:definition => 'used to describe something hip', :example => 'those cowboy boots are deck'})
      expect(test_definition.example()).to(eq('those cowboy boots are deck'))
    end
  end
end
