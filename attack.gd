extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D


signal player_died
const SPEED=100
var direction =-1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	position.x+=direction*SPEED*delta


func _on_timer_timeout() -> void:
	direction*=-1
	sprite_2d.flip_h=!sprite_2d.flip_h
	
func gameover():
	get_tree().reload_current_scene()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("player_died")
		gameover()
		
