class_name ActionParser
	
func load_file() -> Action:
	var file = FileAccess.open("res://src/action_lib/basic_action.csv", FileAccess.READ)
	
	# This is the header line - we don't want it
	file.get_csv_line()
	
	var hitboxes: Array[FrameBox] = []
	var hurtboxes: Array[FrameBox] = []
	var max_end := 0
	
	while(!file.eof_reached()):
		var content = Array(file.get_csv_line())
		#obnoxious that it doesn't seem to handle the ACTUAL EOF well or blank lines
		if content.is_empty() || content[0] == "":
			break
		var type = content[0]
		var start_frame = int(content[1])
		var end_frame = int(content[2])
		var offset = Vector2(float(content[3]), -float(content[4]))
		var area = Vector2(float(content[5]), -float(content[6]))
		var box = FrameBox.new(start_frame, end_frame, offset, area)
		
		if end_frame > max_end:
			max_end = end_frame
		
		match type.to_upper():
			"HIT":
				hitboxes.append(box)
			"HURT":
				hurtboxes.append(box)
			_:
				print("Received a type we could not parse into an action (%s)" % type)
				pass
				
	var result = Action.new(max_end, hitboxes, hurtboxes)
	print("%d hitboxes" % result.hitboxes.size())
	print("%d hurtboxes" % result.hurtboxes.size())
	
	return result
