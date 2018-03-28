require 'station'

describe Station do 
  let(:aldgate_east) { described_class.new('aldgate east', 1) }

  describe '.new' do 
    it 'initializes with a name' do
      expect(aldgate_east.name).to eq('aldgate east') 
    end 
    it 'initializes with a zone' do
      expect(aldgate_east.zone).to eq(1)
    end 
  end 
end 