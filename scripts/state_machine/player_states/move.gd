extends State
class_name MoveState

@export var idle_state: State
@export var jump_state: State
@export var fall_state: State

@export var move_speed: int

@onready var screen_size = DisplayServer.window_get_size()

func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	if movement_component.wants_jump() and parent.is_on_floor():
		return jump_state

	parent.velocity.y += gravity * delta
	var movement = movement_component.get_move_direction() * move_speed
	if movement == 0:
		return idle_state

	animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()

	if !parent.is_on_floor():
		return fall_state

	return null
