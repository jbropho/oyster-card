require_relative 'journey'

class OysterCard
  attr_reader :balance, :entry_station
  attr_reader :journey_history, :exit_station, :previous_journey
  MAX_CAPACITY = 90
  MIN_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @journey_history = Array.new
  end
  
  def create_journey
    @previous_journey = Journey.new(@entry_station, @exit_station)
  end 
  
  def manage_journey 
    create_journey
    deduct
    append_journey
    reset_data
  end 

  def reset_data
    @previous_journey = false 
    @entry_station = false 
    @exit_station = false
  end 

  def touch_in(station)
    manage_journey if touched_in?
    raise 'You do not have enough money' if below_min?
    set_entry_station(station)
  end

  def touch_out(station)
    set_exit_station(station)
    manage_journey
  end
  
  def append_journey 
    journey_history << previous_journey
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
  def deduct
    @balance -= previous_journey.fare
  end
  
  def exceed_limit?(amount)
    balance + amount > MAX_CAPACITY
  end
end