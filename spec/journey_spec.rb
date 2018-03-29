require 'journey'

describe Journey do 


  describe '.fare' do 
    context 'when passed an invalid journey' do
      it 'returns a penalty fare' do 
         entry_station = double(:zone => 1)
         exit_station = double(:zone => 3)
         journey = described_class.new(entry_station, exit_station)
         expect(journey.fare).to eq(3)
      end
    end 
  end 
end 