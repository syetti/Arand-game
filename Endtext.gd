extends RichTextLabel

var text = ["Woah woah", "You've did it", "The games done", "For now"]
var category = 0

func _ready():
	Timer.new()
	set_text(text[category])
	set_visible_characters(0)
	
	pass
