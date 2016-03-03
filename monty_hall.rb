class MontyHall
  def self.simulate(ndoors, switch = nil)
	prng = Random.new
	winning_door = prng.rand(1..ndoors) 
	choice = prng.rand(1..ndoors)
	doors = (1..ndoors).to_a

	while doors.size > 2
   	  door_to_open_index = prng.rand(0..doors.size - 1)
	  door_to_open = doors[door_to_open_index]
	  unless door_to_open == winning_door or door_to_open == choice
		doors.delete_at(door_to_open_index)
	  end
	end

	if switch
	  choice = (doors[0] == choice ? doors[1] : doors[0])
	end

	# returns true if users wins
	return choice == winning_door
  end
end

p MontyHall.simulate(3, true)
