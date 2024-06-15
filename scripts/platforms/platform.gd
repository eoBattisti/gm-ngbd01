extends Node2D
class_name Platform


@export var movable: bool = false # Determines if a platform can move or not
@export var offset: Vector2 = Vector2(0, -320)
@export var duration: float = 5.0

@onready var animatable_body_2d: AnimatableBody2D = $AnimatableBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if movable:
		_start_tween()


func _start_tween() -> void:
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(animatable_body_2d, "position", offset, duration / 2)
	tween.tween_property(animatable_body_2d, "position", Vector2.ZERO, duration / 2)
	
	