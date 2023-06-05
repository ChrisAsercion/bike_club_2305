class Biker

  attr_reader :name, :max_distance, :rides, :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
    #@rides[:ride] = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, minutes)
    if self.max_distance > ride.total_distance
      self.acceptable_terrain.find do |terrain| 
        if terrain == ride.terrain
          if @rides[ride] == nil
            @rides[ride] = []
            @rides[ride] << minutes
          else
            @rides[ride] << minutes
          end
        end 
      end
    end
  end

  def personal_record(ride)
    if @rides[ride] == nil
      false
    else 
      @rides[ride].min
    end
    
  end
end