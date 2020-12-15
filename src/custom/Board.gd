# Code for a sample playspace, you're expected to provide your own ;)
extends Board

var allCards := [] # A pseudo-deck array to hold the card objects we want to pull


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# We're assigning our positions programmatically,
	# instead of defining them on the scene.
	# This way any they will work with any size of viewport in a game.
	# Discard pile goes bottom right
	$Debug.pressed = cfc._debug
	# Fill up the deck for demo purposes
	if not get_tree().get_root().has_node('Gut'):
		load_test_cards()



func reshuffle_all_in_pile(pile = cfc.NMAP.deck):
	for c in get_tree().get_nodes_in_group("cards"):
		if c.get_parent() != pile:
			c.move_to(pile)
			yield(get_tree().create_timer(0.1), "timeout")
	# Last card in, is the top card of the pile
	var last_card : Card = pile.get_top_card()
	if last_card._tween.is_active():
		yield(last_card._tween, "tween_all_completed")
	yield(get_tree().create_timer(0.2), "timeout")
	pile.shuffle_cards()


func _on_Debug_toggled(button_pressed: bool) -> void:
	cfc._debug = button_pressed

# Loads a sample set of cards to use for testing
func load_test_cards(extras := 11) -> void:
	var test_cards := []
	for ckey in cfc.card_definitions.keys():
		test_cards.append(ckey)
	var test_card_array := []
	for _i in range(extras):
		var random_card_name = \
				test_cards[CFUtils.randi() % len(test_cards)]
		test_card_array.append(cfc.instance_card(random_card_name))
	# 11 is the cards GUT expects. It's the testing standard
	if extras == 11:
	# I ensure there's of each test card, for use in GUT
		for card_name in test_cards:
			test_card_array.append(cfc.instance_card(card_name))
	for card in test_card_array:
		$Deck.add_child(card)
		# warning-ignore:return_value_discarded
		card.set_is_faceup(false,true)
		card._determine_idle_state()
		allCards.append(card) # Just keeping track of all the instanced card objects for demo purposes
		#card.modulate.a = 0 # We use this for a nice transition effect
#	$Deck.reorganize_stack()
#	var test_card_array2 := []
#	if extras == 11:
#	# I ensure there's of each test card, for use in GUT
#		for card_name in test_cards:
#			test_card_array2.append(cfc.instance_card(card_name))
#	for card in test_card_array2:
#		$Deck2.add_child(card)
#		# warning-ignore:return_value_discarded
#		card.set_is_faceup(false,true)
#		card._determine_idle_state()
#		allCards.append(card) # Just keeping track of all the instanced card objects for demo purposes
#		#card.modulate.a = 0 # We use this for a nice transition effect
#	$Deck2.reorganize_stack()
