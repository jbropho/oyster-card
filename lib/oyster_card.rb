class OysterCard
  attr_reader :balance
  MAX_CAPACITY = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise StandardError unless @balance + amount <= 90
    @balance += amount
  end



end
