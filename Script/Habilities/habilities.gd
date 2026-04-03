extends Node2D



export var m_habilities : = []


func _ready():
	for i in self.get_children():
		m_habilities.append(i)


