extends CharacterBody2D

var speed = 200
var gravity = 980
var jum_power = -800
var stars_collected = 0

@onready var animation_player = $AnimatedSprite2D
 
func _physics_process(delta):
	velocity.y += gravity * delta
	
	var direction = Vector2.ZERO
	
	# Movimiento horizontal (derecha - izquierda)
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		animation_player.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		animation_player.flip_h = false
		
	if is_on_floor() and Input.is_action_just_pressed("salto"):
		velocity.y = jum_power
		
	velocity.x = direction.x * speed
	
	#cambiar la animación según el estado actual
	update_animation()
	
	#Mover el presonaje
	move_and_slide()
	
func update_animation():
	if not is_on_floor():
		if velocity.y < 0:
			animation_player.play("jump")
		else:
			animation_player.play("fall")
	elif velocity.x != 0:
		animation_player.play("run")
	else:
		animation_player.play("idle")
			
			
	
