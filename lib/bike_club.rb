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

  def ride_eligibility(biker, ride)
    if biker.acceptable_terrain.include?(ride.terrain) && biker.max_distance > ride.total_distance
      p "This is a doable ride. The terrain is acceptable, and the total distance is within reason"
    elsif biker.acceptable_terrain.include?(ride.terrain) == false
      p "Your bike may not be suited for this terrain"
    else biker.max_distance < ride.total_distance
      p "This ride maybe to long for you at this moment"
    end
  end


end