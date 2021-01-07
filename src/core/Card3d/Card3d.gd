class_name Card3d
extends TextureRect


const _CARD_SCENE_FILE = CFConst.PATH_CARD_3D + "card_template.tscn"
const _CARD_SCENE = preload(_CARD_SCENE_FILE)

export var viewport_2d_size = Vector2(470,740) # 因为3d卡牌算上厚度在部分角度会超过尺寸
export var viewport_3d_size = Vector2(450,720)

export var cost = 1 # 费用
export var card_name = "精卫鸟" # 卡牌名字
export var attack = 1 # 攻击力
export var special = 1 # 特殊效果数值
export var blood = 1 # 血量
export var shield = 1 # 盾量
export var introduction = "追击" # 卡牌介绍card_obj
export var sect = "截" # 教派
export var rarity = 1 # 稀有度
export var race = "妖" # 种族

export var card_front_type = 1 # 卡面
export var card_center_type = 1 # 卡中
export var card_back_type = 1 # 卡背

func _ready():
	var card_scene = _CARD_SCENE.instance()
	card_scene.card_front_type = card_front_type
	card_scene.card_center_type = card_center_type
	card_scene.card_back_type = card_back_type
	card_scene.cost = cost
	card_scene.card_name = card_name
	card_scene.attack = attack
	card_scene.special = special
	card_scene.blood = blood
	card_scene.shield = shield
	card_scene.introduction = introduction
	card_scene.sect = sect
	card_scene.rarity = rarity
	card_scene.race = race
	$"Viewport".size = viewport_2d_size
	$"Viewport".add_child(card_scene)
	card_scene.viewport_size = viewport_3d_size
	texture = $Viewport.get_texture()

func face_up(_face_up,instant := false):
	$Viewport/Card.face_up(_face_up,instant)
	
	
	
	
