require 'journey'

describe Journey do 
  subject(:aldgate_east) { 'Aldgate East' }
  subject(:whitechapel) { 'WhiteChapel' }
  subject(:journey) { described_class.new(aldgate_east, whitechapel) }
  subject(:invalid_journey) { described_class.new(aldgate_east)}

  describe '.fare' do 
    context 'when journey is valid' do 
      it 'returns minimum fare' do 
        expect(journey.fare).to eq(1)
      end 
    end 
    context 'when journey is invalid' do 
      it 'returns a penalty fair' do 
       expect(invalid_journey.fare).to eq(6)
      end 
    end 
  end
end 