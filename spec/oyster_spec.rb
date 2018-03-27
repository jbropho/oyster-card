require 'oyster_card'

describe OysterCard do
  subject(:oyster_card) { OysterCard.new }

  it 'responds with a balance of 0' do
    expect(oyster_card.balance).to eq 0
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

    context 'when current balance + top up  < max amount' do
      it 'returns false' do
        oyster_card.stub(:balance) { 50 }
        expect(oyster_card.send(:exceed_limit?, 40)).to eq(false)
      end
    end

  describe '.deduct' do
    subject(:oyster_card) { OysterCard.new(10) }
    it 'deducts specified amount' do
      oyster_card.deduct(5)
      expect(oyster_card.balance).to eq 5
    end
  end

  describe '.touch_in' do
    it 'starts a journey' do
      oyster_card.stub(:balance) { 2 }
      expect(oyster_card.touch_in).to eq(true)
    end

    context 'when already touched in' do
      it 'raises an error' do
        oyster_card.stub(:touched_in?) { true }
        expect{ oyster_card.touch_in }.to raise_error 'You are already touched in'
      end
    end
  end

  describe '.touch_out' do
    context 'when alread touched in' do 
      it 'it ends a journey' do
        oyster_card.stub(:touched_in?) { true }
        expect(oyster_card.touch_out).to eq(false)
      end

      it 'charges a fare' do 
        oyster_card.top_up(10)
        oyster_card.stub(:touched_in?) { true }
        expect{ oyster_card.touch_out }.to change{ oyster_card.balance }.by(-1)
      end
    end

    context 'when already touched out' do
      it 'raises an error' do
        oyster_card.stub(:touched_in?) { false }
        expect{ oyster_card.touch_out }.to raise_error 'You are already touched out'
      end
    end
  end

  describe '.touched_in?' do
    it 'returns true when touched in' do
      oyster_card.stub(:in_journey) { true }
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

end
