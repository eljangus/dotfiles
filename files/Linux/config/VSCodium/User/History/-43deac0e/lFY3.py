while True:
	for horizontal_position in range(get_world_size()):
		for vertical_position in range(get_world_size()):
			if can_harvest():
				harvest()
				move(North)
				if horizontal_position == -1:
					till()
					plant(Entities.carrot)
				elif horizontal_position == 0:
					plant(Entities.grass)
				elif horizontal_position ==1:
					plant(Entities.bush)
		move(East)
		