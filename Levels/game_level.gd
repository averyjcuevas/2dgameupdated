extends Node2D

@onready var heartsContainer = $CanvasLayer/HeartsContainer
@onready var player = $BaseGround/Player

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func _ready():
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)

func _on_inventory_gui_closed():
	get_tree().paused = false


func _on_inventory_gui_opened():
	get_tree().paused = true
	

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
