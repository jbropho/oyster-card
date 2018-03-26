class OysterCard
  attr_reader :balance
  MAX_CAPACITY = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def touch_in
    @in_journey = true
  end 

  def touch_out
    @in_journey = false
  end 

  def top_up(amount)
    raise "Max balance of #{MAX_CAPACITY} exceeded" if exceed_limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  private

  def exceed_limit?(amount)
    @balance + amount > MAX_CAPACITY
  end
end
