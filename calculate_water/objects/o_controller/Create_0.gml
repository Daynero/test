randomize();
#region Создание массива 
mass = ds_list_create();

for (var i = 0; i < 30; i++) {
	ds_list_add(mass, irandom_range(1,10));
}
#endregion
#region Отрисовка
for (var i = 0; i < ds_list_size(mass); i++) {
	for (var j = 0; j < mass[|i]; j++) {
		with instance_create_depth(90 + i * 60, room_height - 40 - 20 * j, -20, o_solid) {
			image_speed = 0;
		}
	}
}
#endregion
#region Поиск первой вершины
vertex_1 = mass[|0];

for (var i = 0; i < ds_list_size(mass); i++) {
	if mass[|i] >= vertex_1 {
		vertex_1 = mass[|i];
		vertex_1_ind = i;
	} else {
		break;	
	}
}
#endregion
#region Поиск второй вершины
vertex_2_ind = 0;
_max = 0;
max_ind = 0;

for (var i = vertex_1_ind + 1; i < ds_list_size(mass); i++) {
	if mass[|i] > _max {
		_max = mass[|i];
		max_ind = i;
	}
	if mass[|i] >= vertex_1 {
		vertex_2 = mass[|i];
		vertex_2_ind = i;
		break;
	} 
}
if vertex_2_ind == 0 {
	vertex_2 = _max;
	vertex_2_ind = max_ind;
}
#endregion
#region Заполнение водой
for (var i = vertex_1_ind; i < vertex_2_ind; i++) {
	for (var j = 0; j < mass[|i]; j++) {
		var count = mass[|i];
		while (count < vertex_1) && (count < vertex_2) {
			instance_create_depth(90 + (i) * 60, room_height - 40 - 20 * count, -20, o_water);
			count += 1;	
		}
	}
}
#endregion
repeat (ds_list_size(mass)) {

}

