require 'oyster_card'


describe OysterCard do
  subject(:oyster_card) { OysterCard.new }
  subject(:aldgate_east) { 'Aldgate East' }
  subject(:whitechapel) { 'WhiteChapel' }
  
  describe '.new' do 
    it 'responds with a balance of 0' do
      expect(oyster_card.balance).to eq 0
    end  

    it 'has an empty journey history' do 
      expect(oyster_card.journey_history.length).to be(0)
    end
  end 

  describe '.top_up' do
    it 'increases balance by specified amount' do
      oyster_card.top_up(10)
      expect(oyster_card.balance).to eq 10
    end
  end

  describe '.exceed_limit?' do

    context 'when trying to top up more than max amount' do 
      it 'returns true' do
        expect(oyster_card.send(:exceed_limit?, 91)).to eq(true)
      end 
    end
    
    context 'when current balance + top up > max amount' do
      it 'returns true' do
        oyster_card.stub(:balance) { 50 }
        expect(oyster_card.send(:exceed_limit?, 41)).to eq(true)
      end
    end
  end

    context 'when current balance + top up < max amount' do
      it 'returns false' do
        oyster_card.stub(:balance) { 50 }
        expect(oyster_card.send(:exceed_limit?, 40)).to eq(false)
      end
    end

  describe '.deduct' do
    subject(:oyster_card) { OysterCard.new(10) }

    it 'deducts specified amount' do
      oyster_card.stub(:previous_journey) { double(:fare => 1)  }
      oyster_card.send(:deduct)
      expect(oyster_card.balance).to eq 9
    end
  end

  describe '.touch_in' do
    let(:station) { double(:station_name => 'Aldgate East') }
    
    it 'starts a journey' do
      oyster_card.stub(:balance) { 2 }
      expect(oyster_card.touch_in(station)).to eq(station)
    end

    context 'when already touched in' do
      it 'calls manage_journey' do
        oyster_card.stub(:balance) { 2 }
        oyster_card.stub(:touched_in?) { true }
        expect(oyster_card).to receive(:manage_journey)
        oyster_card.touch_in(:station)
      end
    end
  end

  describe '.touch_out' do
    context 'when already touched in' do 
      it 'calls manage_journey' do
        oyster_card.stub(:touched_in?) { true }
        expect(oyster_card).to receive(:manage_journey)
        oyster_card.touch_out(aldgate_east)
      end
    end

    context 'when already touched out' do
      it 'calss manage_journey' do
        expect(oyster_card).to receive(:manage_journey)
        oyster_card.touch_out(aldgate_east)
      end
    end
  end

  describe '.touched_in?' do
    it 'returns true when touched in' do
      oyster_card.stub(:entry_station) { 'aldgate east' }
      expect(oyster_card.touched_in?).to eq true
    end

    it 'returns false when not touched in' do
      oyster_card.stub(:in_journey) { false }
      expect(oyster_card.touched_in?).to eq false
    end
  end

  describe '.below_min?' do 
    context 'when balance is below min threshold' do 
      it 'returns true' do 
        oyster_card.stub(:balance) { 0.4 }
        expect(oyster_card.below_min?).to eq true
      end 
    end 
  end

  describe '.set_entry_station' do
    let(:station) { double(:name => 'Aldgate East') }
    
    context 'when passed a station' do
      it 'sets @entry_station' do 
        oyster_card.set_entry_station(station)
        station = oyster_card.entry_station
        expect(station.name).to eq('Aldgate East')
      end
    end
    
    context 'when not passed a station' do
      it 'overrides @entry_station to nil' do 
        oyster_card.set_entry_station(station)
        oyster_card.set_entry_station()
        station = oyster_card.entry_station
        expect(station).to eq(false)
      end 
    end 
  end 

  describe '.set_exit_station' do 
    let(:station) { double(:name => 'Aldgate East') }

    context 'when passed a station' do 
      it 'sets @exit_station' do 
        oyster_card.set_exit_station(station)
        station = oyster_card.exit_station
        expect(station.name).to eq('Aldgate East')
      end 
    end 

    context 'when not passed a station' do
      it 'overrides @entry_station to nil' do 
        oyster_card.set_exit_station(station)
        oyster_card.set_exit_station()
        station = oyster_card.exit_station
        expect(station).to eq(false)
      end 
    end 
  end 

  describe '.append_journey' do 
    it 'adds a journey to journey history' do 
      oyster_card.stub(:previous_journey) { 'journey object' }
      expect{ oyster_card.append_journey }.to \
       change{oyster_card.journey_history.size}.from(0).to(1)
    end 
  end 
  
  #feature tests  
  describe 'touching in then out' do 
    it 'creates a journey' do 
      oyster_card.stub(:balance) { 2 }
      oyster_card.touch_in(aldgate_east)
      oyster_card.touch_out(whitechapel)
      expect(oyster_card.journey_history.size).to be(1)
    end
  end
end
