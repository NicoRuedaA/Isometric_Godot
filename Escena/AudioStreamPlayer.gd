extends AudioStreamPlayer

func _ready():
	self.play()

func _process(delta):
	if self.playing == false:
		self.play()
