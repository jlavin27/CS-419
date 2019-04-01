extends Node2D

onready var TL = preload("res://MapScenes/TopLeft.tscn")
onready var TC = preload("res://MapScenes/TopCenter.tscn")
onready var TR = preload("res://MapScenes/TopRight.tscn")
onready var CL = preload("res://MapScenes/LeftCenter.tscn")
onready var CC = preload("res://MapScenes/Center.tscn")
onready var CR = preload("res://MapScenes/RightCenter.tscn")
onready var BL = preload("res://MapScenes/BottomLeft.tscn")
onready var BC = preload("res://MapScenes/BottomCenter.tscn")
onready var BR = preload("res://MapScenes/BottomRight.tscn")

onready var V = preload("res://MapScenes/Vertical.tscn")
onready var H = preload("res://MapScenes/Horizontal.tscn")

onready var LE = preload("res://MapScenes/LeftEndcap.tscn")
onready var RE = preload("res://MapScenes/RightEndcap.tscn")
onready var TE = preload("res://MapScenes/TopEndcap.tscn")
onready var BE = preload("res://MapScenes/BottomEndcap.tscn")

onready var Room = preload("res://Room.tscn")

onready var player = preload("res://Player.tscn")

const N = 0x1
const E = 0x2
const S = 0x4
const W = 0x8

var cell_walls = {Vector2(0,-1): N, Vector2(1,0):E, 
				Vector2(0,1): S, Vector2(-1,0): W}

var tile_size = 16
var room_size = 224
var width = 10
var height = 10

onready var Map = $TileMap

func _ready():
	randomize()
	tile_size = Map.cell_size
	make_maze()
	draw_map()
	var temp = player.instance()
	#temp.position(0,0)
	add_child(temp)

func check_neighbors(cell, unvisited):
	var list = []
	for n in cell_walls.keys():
		if cell + n in unvisited:
			list.append(cell + n)
	return list

func make_maze():
	var unvisited = []
	var stack = []
	
	Map.clear()
	for y in range(width):
		for x in range(height):
			unvisited.append(Vector2(x,y))
			Map.set_cellv(Vector2(x,y), N|E|S|W)
	var current = Vector2(0,0)
	unvisited.erase(current)
	
	while unvisited:
		var neighbors = check_neighbors(current, unvisited)
		if neighbors.size()>0:
			var next = neighbors[randi() % neighbors.size()]
			stack.append(current)
			
			var dir = next - current
			var current_walls = Map.get_cellv(current) - cell_walls[dir]
			var next_walls = Map.get_cellv(next) - cell_walls[-dir]
			Map.set_cellv(current, current_walls)
			Map.set_cellv(next,next_walls)
			current = next
			unvisited.erase(current)
		elif stack:
			current = stack.pop_back()

func draw_map():
	for y in range(width):
		for x in range(height):
			var id = Map.get_cell(x,y)
			var room = Room.instance()
			var instance = CC.instance()
			if id == 0:
				instance = CC.instance()
			elif id == 1:
				instance = TC.instance()
			elif id == 2:
				instance = CR.instance()
			elif id == 3:
				instance = TR.instance()
			elif id == 4:
				instance = BC.instance()
			elif id == 5:
				instance = H.instance()
			elif id == 6:
				instance = BR.instance()
			elif id == 7:
				instance = RE.instance()
			elif id == 8:
				instance = CL.instance()
			elif id == 9:
				instance = TL.instance()
			elif id == 10:
				instance = V.instance()
			elif id == 11:
				instance = TE.instance()
			elif id == 12:
				instance = BL.instance()
			elif id == 13:
				instance = LE.instance()
			elif id == 14:
				instance = BE.instance()
			if instance != null:
				room.translate(Vector2(x*room_size,y*room_size))
				room.add_child(instance)
				add_child(room)


