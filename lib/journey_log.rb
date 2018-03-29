require_relative 'journey'

class JourneyLog 
  attr_reader :history, :journey
  def initialize
    @history = Array.new 
  end 

  def create_journey(start_station, end_station)
     new_journey(start_station, end_station)
     store_journey 
  end 

  def new_journey(start_station, end_station)
    @journey = Journey.new(start_station, end_station)
  end
  
  def store_journey
    @history << journey
  end 
end
