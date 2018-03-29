class OysterCard
  attr_reader :balance, :entry_station
  attr_reader :journey_history, :exit_station
  MAX_CAPACITY = 90
  MIN_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @journey_history = Array.new
  end

  def touch_in(station)
    raise 'You are already touched in' if touched_in?
    raise 'You do not have enough money' if below_min?
    set_entry_station(station)
  end

  def touch_out(station)
    raise 'You are already touched out' unless touched_in?
    deduct(MIN_FARE)
    set_exit_station(nil)
    append_journey
  end
  
  def append_journey 
    journey_history << { entry: entry_station, exit: exit_station }
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

  def set_exit_station(station = false)
    @exit_station = station
  end 

  def set_entry_station(station = false)
    @entry_station = station
  end 

  private  
  def deduct(amount)
    @balance -= amount
  end
  
  def exceed_limit?(amount)
    balance + amount > MAX_CAPACITY
  end
end