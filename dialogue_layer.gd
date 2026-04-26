extends CanvasLayer

@onready var dialogue_label = $Panel/DialogueLabel
@onready var name_label = $Panel/NameLabel
@onready var portrait = $Panel/TextureRect

signal answered_correctly()
var dialogue_lines = []
var current_line = 0

func start_dialogue(lines: Array, speaker:String, portrait_texture: Texture2D):
	dialogue_lines = lines
	current_line = 0
	portrait.texture = portrait_texture
	name_label.text = speaker
	dialogue_label.text = dialogue_lines[current_line]

#func _process(_delta):
	#if Input.is_action_just_pressed("correctanswer"):
		#answered_correctly.emit()
		#print("correct button pressed")



func _input(event):
	if event.is_action_pressed("ui_text_newline"):
		current_line += 1
		if current_line >= dialogue_lines.size():
			queue_free()
			return
		else:
			dialogue_label.text = dialogue_lines[current_line]
	if event.is_action_pressed("correctanswer1"):
		answered_correctly.emit()
		print("dskfjkldsfjds")
		
