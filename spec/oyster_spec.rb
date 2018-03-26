require 'oyster_card'

describe OysterCard do
  subject(:oyster_card) { OysterCard.new }

  it 'responds to balance' do
    expect(oyster_card).to respond_to(:balance)
  end

  it 'responds with a balance of 0' do
    expect(oyster_card.balance).to eq 0
  end

  describe '.top_up' do
    it 'increases balance by specified amount' do
      oyster_card.top_up(10)
      expect(oyster_card.balance).to eq 10
    end

    context 'when attempting to exceed top_up limit' do
      it 'raises an error' do
        oyster_card.top_up(OysterCard::MAX_CAPACITY)
        expect{ oyster_card.top_up(1) }.to raise_error StandardError
      end
    end
  end

  # describe '.exceed_limit?' do
  #   allow(oyster_card).to receive(:balance).and_return 90
  #   expect
  #
  # end



end
