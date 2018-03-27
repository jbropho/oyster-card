class OysterCard
  attr_reader :balance, :in_journey
  MAX_CAPACITY = 90
  MIN_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def touch_in
    raise 'You are already touched in' if touched_in?
    raise 'You do not have enough money' if below_min?
    @in_journey = true
  end

  def touch_out
    raise 'You are already touched out' unless touched_in?
    deduct(MIN_FARE)
    @in_journey = false
  end

  def touched_in?
    in_journey
  end

  def below_min?
    balance < MIN_FARE
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
    balance + amount > MAX_CAPACITY
  end
end