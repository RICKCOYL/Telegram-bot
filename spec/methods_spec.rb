require_relative '../lib/methods'

describe Methods do
  describe '#rand_string' do
    it 'return a random element' do
      arr = [1, 2, 3]
      expect(Methods.rand_string(arr)).to be_an Integer
    end
  end
end
