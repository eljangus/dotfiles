while True:
	for horizontal_position in range(get_world_size()):
		for vertical_position in range(get_world_size()):
			if can_harvest():
				harvest()
				if horizontal_position == 0:
					till()
					plant(Entities.carrot)
				elif horizontal_position == 1:
					plant(Entities.grass)
				elif horizontal_position == 2:
					plant(Entities.bush)
				move(North)
			print(horizontal_position)
		move(East)
		