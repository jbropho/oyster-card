class OysterCard
  attr_reader :balance, :in_journey, :entry_station
  MAX_CAPACITY = 90
  MIN_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def touch_in(station)
    raise 'You are already touched in' if touched_in?
    raise 'You do not have enough money' if below_min?
    set_entry_station(station)
  end

  def touch_out
    raise 'You are already touched out' unless touched_in?
    deduct(MIN_FARE)
    set_entry_station(nil)
  end

  def touched_in?
    !!entry_station 
  end

  def below_min?
    balance < MIN_FARE
  end

  def top_up(amount)
    raise "Max balance of #{MAX_CAPACITY} exceeded" if exceed_limit?(amount)
    @balance += amount
  end

  def set_entry_station(station = false)
    @entry_station = station || nil 
  end 

  private  
  def deduct(amount)
    @balance -= amount
  end
  
  def exceed_limit?(amount)
    balance + amount > MAX_CAPACITY
  end
end