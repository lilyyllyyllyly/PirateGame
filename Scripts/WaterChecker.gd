class_name WaterChecker extends Area2D

signal left_water

func on_area_exited():
	if !has_overlapping_areas(): left_water.emit()

