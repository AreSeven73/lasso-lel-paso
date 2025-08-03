extends StaticBody3D




func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		$"../../Ground2".position.x = $"..".position.x-20
		$"../../Ground3".position.x = $"..".position.x+20
		$"../../Ground4".position.x = $"..".position.x
		$"../../Ground5".position.x = $"..".position.x-20
		$"../../Ground6".position.x = $"..".position.x+20
		$"../../Ground7".position.x = $"..".position.x
		$"../../Ground8".position.x = $"..".position.x-20
		$"../../Ground9".position.x = $"..".position.x+20
		
		$"../../Ground2".position.z = $"..".position.z
		$"../../Ground3".position.z = $"..".position.z
		$"../../Ground4".position.z = $"..".position.z-20
		$"../../Ground5".position.z = $"..".position.z-20
		$"../../Ground6".position.z = $"..".position.z-20
		$"../../Ground7".position.z = $"..".position.z+20
		$"../../Ground8".position.z = $"..".position.z+20
		$"../../Ground9".position.z = $"..".position.z+20
