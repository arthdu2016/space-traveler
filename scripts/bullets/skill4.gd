
extends Node2D

var charges = 1
var finished = 0
var index

func _init():
	pass

func _ready():
	pass

func preSetup (i) :
	index = i
	get_parent().player.skillCoolDown[i][2] = 1
	get_parent().player.skillCoolDown[i][1] = - 3.0
	get_parent().player.skillCoolDown[i][0] = 3.0
	get_parent().skills[i].append(self.get_path())
	get_parent().player.bar.takeBuff(30, 4, -2)
	get_parent().player.bar.vampirism += 0.1
	get_parent().player.bar.luck += 30
	#self.queue_free()

func setup (i) :
	set_fixed_process(true)
	index = i
	get_parent().player.skillCoolDown[index][2] = 0
	get_parent().setBullet(i, "res://scenes/bullets/SetupSk4.xscn")
	finished = 1
	self.get_child(0).queue_free()

func _process(delta):
	if (finished == 1):
		self.queue_free()
