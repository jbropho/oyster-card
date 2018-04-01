require 'journey_log'
require 'journey'

describe JourneyLog do
  describe '.store_journey' do 
    it 'saves a journey' do
      journey = double()
      subject.stub(:journey) { double(:example_journey) }
      expect{ subject.send(:store_journey) }.to change{ subject.history.size }.from(0).to(1)
    end 
  end
  describe '.create_journey' do 
    it 'initialises a journey' do
       expect(subject).to receive(:new_journey)
       subject.create_journey(false, false)
    end 
  end
end
