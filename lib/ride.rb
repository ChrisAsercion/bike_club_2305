class Ride

  attr_reader :name, :distance, :terrain

  def initialize(ride) 
    @name = ride[:name] 
    @distance = ride[:distance]
    @terrain = ride[:terrain]
    @loop = ride[:loop]
  end
  
  def loop?
    @loop
  end

  def total_distance
    if @loop 
      total_distance = @distance 
    else
      total_distance = @distance * 2
    end
  end

end 