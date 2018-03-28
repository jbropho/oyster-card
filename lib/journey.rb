class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6 

  def initialize(entry_station = false, exit_station = false)
    @entry_station = entry_station
    @exit_station = exit_station
  end 

  def fare 
    return MIN_FARE if valid_journey?
    PENALTY_FARE
  end

  private 
  def valid_journey?
    entry_station && exit_station
  end
  
  attr_reader :entry_station, :exit_station
end 
