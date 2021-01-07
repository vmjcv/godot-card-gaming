extends Spatial
onready var _flip_tween = $FlipTween

func flip_card(_face_up)->void:
	var target_rotation = 0
	if _face_up:
		target_rotation=0
	else:
		target_rotation = 180
	_flip_tween.interpolate_property(self,'rotation_degrees:z',
			rotation_degrees.z,
			target_rotation, 0.4,
			Tween.TRANS_QUAD, Tween.EASE_IN)
	_flip_tween.start()

func face_up(_face_up,instant := false):
	if instant:
		if _face_up:
			rotation_degrees.z = 0
		else:
			rotation_degrees.z = 180
	else:
		flip_card(_face_up)

