class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6 

  def initialize(entry_station = false, exit_station = false)
    @entry_station = entry_station
    @exit_station = exit_station
  end 

  def fare 
    return calculate_price if valid_journey?
    PENALTY_FARE
  end
  
  private 
  def calculate_price
    (entry_station.zone - exit_station.zone).abs + 1 
  end

  def valid_journey?
    entry_station && exit_station
  end
  
  attr_reader :entry_station, :exit_station
end 
