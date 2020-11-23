#region Поиск следующей пары вершин
#region Поиск первой вершины
vertex_1 = vertex_2;

for (var i = vertex_2_ind; i < ds_list_size(mass); i++) {
	if mass[|i] >= vertex_1 {
		vertex_1 = mass[|i];
		vertex_1_ind = i;
		show_debug_message("Поиск первой вершины  vertex_1_ind = " + string(vertex_1_ind))
	} else {
		break;	
	}
}
#endregion
#region Поиск второй вершины
vertex_2_ind = vertex_1_ind + 1;
show_debug_message("Поиск второй вершины  vertex_2_ind = " + string(vertex_2_ind))
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
		show_debug_message("Поиск  vertex_2_ind" + string(vertex_2_ind))
		break;
	} 
}
if vertex_2_ind == vertex_1_ind + 1 {
	vertex_2 = _max;
	vertex_2_ind = max_ind;
	show_debug_message("Поиск MAX  vertex_2_ind" + string(vertex_2_ind))
}
#endregion
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

show_debug_message("Количество осадков = " + string(instance_number(o_water)))