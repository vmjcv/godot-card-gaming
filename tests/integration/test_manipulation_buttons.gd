extends "res://tests/UTcommon.gd"

var cards := []

func before_each():
	setup_board()
	cards = draw_test_cards(5)
	yield(yield_for(1), YIELD)

func test_manipulation_buttons_not_messing_hand_focus():
	var card = cards[0]
	yield(move_mouse(card.global_position), 'completed')
	yield(move_mouse(card.global_position - Vector2(0,100)), 'completed')
	yield(yield_for(0.2), YIELD)
	yield(move_mouse(card.global_position), 'completed')
	yield(move_mouse(card.global_position - Vector2(0,100)), 'completed')
	yield(yield_for(0.2), YIELD)
	yield(move_mouse(card.global_position), 'completed')
	yield(yield_to(cards[0].get_node('Tween'), "tween_all_completed", 1), YIELD)
	assert_almost_eq(Vector2(104, -271.5),cards[0].position,Vector2(2,2),
			"Card dragged in correct global position")
	assert_almost_eq(Vector2(1.5, 1.5),cards[0].scale,Vector2(0.1,0.1),
			"Card has correct scale")
