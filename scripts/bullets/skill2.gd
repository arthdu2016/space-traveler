
extends Node2D

var index
var charges = 1
var initTime = 0.0
var endTime = 2.0
var oldAS = 0.0
var oldArmor = 0.0
var oldShield = 0.0
var oldSpeed = 0.0
var shouldDraw = 0

func _init():
	pass

func _ready():
	pass

func preSetup (i) :
	index = i
	get_parent().player.skillCoolDown[i][2] = 1
	get_parent().player.skillCoolDown[i][1] = - 2.5
	get_parent().player.skillCoolDown[i][0] = 2.5
	get_parent().skills[i].append(self.get_path())
	get_parent().player.bar.takeBuff(20, 4, -4)
	get_parent().player.bar.luck += 30
	get_parent().player.bar.takeBuff(30, 1, -4)
	get_parent().player.bar.takeBuff(30, 2, -4)

func setup (i):
	set_fixed_process(true)
	shouldDraw = 1
	self.get_child(0).queue_free()
	index = i
	endTime = 2.0
	get_parent().player.skillCoolDown[index][2] = 0
	get_parent().player.bar.takeBuff(40, 1, endTime)
	get_parent().player.bar.takeBuff(40, 2, endTime)
	#get_parent().player.bar.takeBuff(1.5, 4.5, endTime)
	get_parent().player.bar.takeBuff(2, 0.5, endTime)
	get_parent().player.bar.takeHeal(1.0*(get_parent().player.bar.maxHp - get_parent().player.bar.curHp), 0, Vector2(0, 1))
	get_parent().player.bar.takeHeal(0.1*(get_parent().player.bar.maxHp - get_parent().player.bar.curHp), 0.5, Vector2(0, 1))
	
	initTime = OS.get_ticks_msec()/1000.0
	endTime += initTime

func _fixed_process(delta):
	if (OS.get_ticks_msec()/1000.0 > endTime):
		get_parent().player.skillCoolDown[index][2] = 1
		get_parent().player.skillCoolDown[index][1] = OS.get_ticks_msec()/1000.0
		self.queue_free()
	else :
		self.set_pos(get_parent().player.get_pos())
		update()

func _draw():
	if (shouldDraw):
		draw_circle(Vector2(0, 0), 55.0, Color(255.0/255, 160.0/255, 0.0/255, 0.1))

func setPosition(pos, dir):
	pass