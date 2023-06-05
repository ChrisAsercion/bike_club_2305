class Bike_Club

  attr_reader :name, :bikers, :top_rider

  def initialize(name)
    @name = name
    @bikers = []
    @top_rider = nil
  end

  def add_biker(biker)
    @bikers << biker
  end

  def ride_counter
    num_rides = {}
    bikers.each do |biker|
      rides = biker.rides.values.flatten.length
      num_rides[biker] = rides
    end
    bikers.each do |biker|
      if num_rides[biker] == num_rides.values.max
        @top_rider = biker
      end
    @top_rider
    end 
  end


end