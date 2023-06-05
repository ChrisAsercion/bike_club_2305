require 'rspec'
require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe 'Bike_Club' do
  it 'exists' do
    club1 = Bike_Club.new("Spokes for Folks")
    expect(club1.name).to eq("Spokes for Folks")
    expect(club1.bikers).to eq([])
  end

  it 'can add bikers to the club' do
    club1 = Bike_Club.new("Spokes for Folks")
    biker = Biker.new("Kenny", 30)
    expect(club1.bikers.length).to eq(0)
    club1.add_biker(biker)
    expect(club1.bikers.length).to eq(1)
  end

  it 'can show the most number of rides by one biker in the club' do
    club1 = Bike_Club.new("Spokes for Folks")
    biker = Biker.new("Kenny", 30)
    biker.learn_terrain!(:hills)
    biker2 = Biker.new("Athena", 15)
    biker2.learn_terrain!(:gravel)
    club1.add_biker(biker)
    club1.add_biker(biker2)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7,
    loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9,
    loop: true, terrain: :gravel})
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker2.log_ride(ride2, 65.0)
    club1.ride_counter
    expect(club1.top_rider.name).to eq("Kenny")
  end 
  #top_rider is the variable name for the rider with the most logged rides in a club

  it 'can tell the rider if the ride is doable' do
    club1 = Bike_Club.new("Spokes for Folks")
    biker = Biker.new("Kuzan", 30)
    biker.learn_terrain!(:hills)
    club1.add_biker(biker)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7,
    loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9,
    loop: true, terrain: :gravel})
    expect(club1.ride_eligibility(biker, ride1)).to eq("This is a doable ride. The terrain is acceptable, and the total distance is within reason")
    biker2 = Biker.new("Athena", 15)
    club1.add_biker(biker2)
    biker2.learn_terrain!(:hills)
    expect(club1.ride_eligibility(biker2, ride1)).to eq("This ride maybe to long for you at this moment")
    ride3 = Ride.new({name: "Punk Hazard", distance: 15,
    loop: true, terrain: :ice})
    expect(club1.ride_eligibility(biker, ride3)).to eq("Your bike may not be suited for this terrain")
  end
end