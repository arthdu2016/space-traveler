
extends KinematicBody2D

var movem
var camera
var bar
var skillPath = ["res://scenes/bullets/Skill1.xscn", "res://scenes/bullets/Skill12.xscn", "res://scenes/bullets/Skill12.xscn"]
var skillCharges = [0, 0, 0]
var basicAttack = "res://scenes/bullets/Bullet.scn"


func _init():
	set_process(true)
	camera = get_node("Camera2D")

func _ready():
	movem = self.get_child(0)
	var barScene = load("res://scenes/HealthBar.scn")
	bar = barScene.instance()
	bar.initBar(500.0)
	add_child(bar)


func Rotate (pos):
	self.get_child(1).set_rot(atan2(pos.x, pos.y)+PI)

func _process(delta):
	pass