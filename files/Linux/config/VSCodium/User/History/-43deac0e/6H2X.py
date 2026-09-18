while True:
	for i in range(get_world_size()):
		for n in range(get_world_size()):
			if can_harvest():
				harvest()
				plant(Entities.Bush)
				move(South)
		move(East)
		