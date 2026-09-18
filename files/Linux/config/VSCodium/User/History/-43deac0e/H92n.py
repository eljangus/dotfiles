while True:
	for i in range(get_world_size()):
		for n in range(get_world_size()):
			if can_harvest():
				harvest()
				plant(Entities.Bush)
				move(South)
				print(f"vertical position: {n}")
			print(f"horizontal position: {n}")
		move(East)
		