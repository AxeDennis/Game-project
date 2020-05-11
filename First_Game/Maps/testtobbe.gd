extends Navigation2D
onready var monster = get_node("../Characters/Monsters/Monster")
onready var player = get_node("../Characters/Player")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(get_simple_path(monster.global_position, player.global_position))
#	pass
