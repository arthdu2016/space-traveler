
extends Node2D

var charges = 1
var finished = 0
var index
var didUseSkill = 0

func _init():
	pass

func _ready():
	pass

func preSetup (i) :
	index = i
	get_parent().player.skillCoolDown[i][2] = 1
	get_parent().player.skillCoolDown[i][1] = - 1.0
	get_parent().player.skillCoolDown[i][0] = 1.0
	get_parent().skills[i].append(self.get_path())
	get_parent().player.bar.takeBuff(20, 4, -1)
	get_parent().player.bar.takeBuff(20, 3, -1)
	get_parent().player.bar.vampirism += 0.25

func setup (i) :
	set_process(true)
	self.get_child(0).queue_free()
	index = i
	get_parent().player.skillCoolDown[i][2] = 0
	get_parent().setBullet(i, "res://scenes/bullets/BulletBa2.xscn")
	finished = 1

func _process(delta):
	if (finished == 1):
		self.queue_free()
