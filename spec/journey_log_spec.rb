require 'journey_log'
require 'journey'

describe JourneyLog do
  describe 'store_journey' do 
    it 'saves a journey' do
      journey = double()
      subject.stub(:journey) { double(:example_journey) }
      expect{ subject.store_journey }.to change{ subject.history.size }.from(0).to(1)
    end 
  end 
end
