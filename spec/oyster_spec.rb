require 'oyster_card'

describe OysterCard do
  subject(:oyster_card) { OysterCard.new }

  it 'responds to balance' do 
    expect(oyster_card).to respond_to(:balance)
  end 

  it 'responds with a balance of 0' do 
    expect(oyster_card.balance).to eq 0
  end 
end 