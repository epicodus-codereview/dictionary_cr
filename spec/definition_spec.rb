require('rspec')
require('definition')
require('word')

describe(Definition) do
  describe('#definition') do
    it('returns definition of word') do
      new_definition = Definition.new({:definition => 'Independent in government having the right or power of self government'})
      expect(new_definition.definition()).to(eq('Independent in government having the right or power of self government'))
    end
  end

end
