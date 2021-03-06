
extends Label

var target
var remaining
var speed
var gravSpeed = Vector2(0, -200)

func _ready():
	pass

func showHeal (damage, dir, nature):
	set_process(true)
	dir = dir.rotated(PI/9 - (randi()%40)*(PI/180.0))
	speed = 250
	target = dir.normalized() * (80.0*damage/(600.0+damage)+60.0)
	remaining = target
	if nature == 0 :
		self.set_text(str(int(damage)))
		self.add_color_override("font_color", Color(0.0/255, 188.0/255, 212.0/255, 0.8))
	elif nature == 0.5 :
		self.set_text(str(int(damage)))
		self.add_color_override("font_color", Color(0.0/255, 150.0/255, 136.0/255, 0.8))
	self.add_font_override("font", load("res://font32.fnt"))
	self.set_scale(Vector2(damage/(700.0+damage)+0.4, damage/(700.0+damage)+0.4))

func showDamage (damage, dir, nature):
	set_process(true)
	dir = dir.rotated(PI/9 - (randi()%40)*(PI/180.0))
	#speed = 50000/(150+damage)
	speed = 250
	target = dir.normalized() * (80.0*damage/(600.0+damage)+60.0)
	remaining = target
	if nature == 0 :
		self.set_text(str(int(damage)))
		self.add_color_override("font_color", Color(33.0/255, 33.0/255, 33.0/255, 0.8))
	elif nature == 1 :
		self.set_text(str(int(damage)))
		self.add_color_override("font_color", Color(183.0/255, 28.0/255, 28.0/255, 0.8))
	elif nature == 1.5 :
		self.set_text(str(int(damage))+ "!")
		self.add_color_override("font_color", Color(183.0/255, 28.0/255, 28.0/255, 0.8))
	elif nature == 2 :
		self.set_text(str(int(damage)))
		self.add_color_override("font_color", Color(98.0/255, 0.0/255, 234.0/255, 0.8))
	self.add_font_override("font", load("res://font32.fnt"))
	self.set_scale(Vector2(damage/(700.0+damage)+0.4, damage/(700.0+damage)+0.4))

func _process(delta):
	var ds
	remaining = remaining - target.normalized()*speed*delta
	gravSpeed += Vector2(0, delta*1250)
	if (target - remaining).length() < target.length():
		ds = (target.normalized()*speed + gravSpeed)*delta
		set_pos(ds+self.get_pos())
	else :
		self.queue_free()
