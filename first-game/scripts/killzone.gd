extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("you died!")
	Engine.time_scale = 0.5 #slowdown time speed of the game upon death
	body.get_node("CollisionShape2D").queue_free() #remove player's collision node so they fall off the map
	timer.start()


func _on_timer_timeout() -> void: #runs when the timer ends
	Engine.time_scale = 1
	get_tree().reload_current_scene()
