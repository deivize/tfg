



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


function dibujarLectores(){
	
	var width = 14.932404, height = 10.009442;
	
	for(i=0;i<lectores.length;i++){
		
		var tip = d3
		.tip()
		.attr('class','d3-tip')
		.offset([-10,0])
		.html(function() {
				return "<strong>Tipo: </strong><span>"+lectores[i].tipo+ "</span><br/>" +
						"<strong>Modelo: </strong><span>"+lectores[i].modelo+ "</span>";
						});
		svg.call(tip);
		
		
		rect=svg.append("rect")
		.attr("width",width)
		.attr("height", height)
		.attr("x",lectores[i].coord_x)
		.attr("y",lectores[i].coord_y)
		.attr("stroke","#000000")
		.attr("stroke-width","0.84172118")
		.attr("stroke-opacity", "1")
		.attr("fill", "#ffffff")
		.on('mouseover',tip.show)
		.on('mouseout',tip.hide);
		
		
		
	}
	
}

$(document).ready(function(){
	dibujarLectores();
	dibujarAreas();
});