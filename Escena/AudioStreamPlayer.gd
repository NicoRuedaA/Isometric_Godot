extends AudioStreamPlayer

func _ready():
	self.play()

func _process(_delta):
	if self.playing == false:
		self.play()
