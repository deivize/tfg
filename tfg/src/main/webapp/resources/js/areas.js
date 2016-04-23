 

function dibujarAreas(){

	for(i=0;i<areas.length;i++){
		rect=svg.insert("rect",":first-child")
		.attr({
			rx      : 6,
			ry      : 6,
			class   : "selection",
			x       : areas[i].coord_x,
			y       : areas[i].coord_y,
			width   : areas[i].width,
			height  : areas[i].height
		})

	}

}

$(document).ready(function(){
	dibujarAreas();
});