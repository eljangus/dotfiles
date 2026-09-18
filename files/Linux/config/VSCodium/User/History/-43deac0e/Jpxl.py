while True:
	for horizontal_position in range(get_world_size()):
		for vertical_position in range(get_world_size()):
			if can_harvest():
				harvest()
				move(North)
			if horizontal_position == 0:
				till()
				plant(Entities.carrot)
			
		move(East)
		