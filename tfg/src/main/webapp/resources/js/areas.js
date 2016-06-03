



function dibujarAreas(){

	for(i=0;i<areas.length;i++){
		//rect=svg.insert("rect",":first-child")
		rect=svg.append("rect")
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
		
		
		var div = d3.select("body").append("div")	
				    .attr("class", "tooltipLector")				
				    .style("opacity", 0);
		
		
		rect=svg.append("rect")
		.attr("width",width)
		.attr("height", height)
		.attr("x",lectores[i].coord_x)
		.attr("y",lectores[i].coord_y)
		.attr("stroke","#000000")
		.attr("stroke-width","0.84172118")
		.attr("stroke-opacity", "1")
		.attr("fill", "#ffffff")
		.on('mouseover',function(d) {		
            div.transition()		
            	.duration(200)		
            	.style("opacity", .9);
            div	.html("<strong>Tipo: </strong><span>"+lectores[i].tipo+ "</span><br/>"+
            		"<strong>Modelo: </strong><span>"+lectores[i].modelo+ "</span>")	
            	.style("left", (d3.event.pageX) + "px")		
            	.style("top", (d3.event.pageY - 28) + "px");})
		.on('mouseout',function(d) {		
            div.transition()		
            	.duration(500)		
            	.style("opacity", 0);});
		
		
		
	}
	
}

function dibujarLugares(){
	
	for(i=0;i<escaleras.length;i++){
		
		var div = d3.select("body").append("div")	
	    .attr("class", "tooltipLugar")				
	    .style("opacity", 0);
		
		var escalera= svg.append("text")
						.attr("x",escaleras[i].coord_x)
						.attr("y",escaleras[i].coord_y)
						.attr("font-family","FontAwesome")
						.attr("font-size","20px")
						.attr("tipo","escalera")
						.text(function(d){return "\uf0dc"})
						.attr("cursor","pointer")
						.on('mouseover',function(d) {		
				            div.transition()		
			            	.duration(200)		
			            	.style("opacity", .9);
				            div	.html("<strong><span>Escalera</span></strong>")	
			            		.style("left", (d3.event.pageX) + "px")		
			            		.style("top", (d3.event.pageY - 28) + "px");})
						.on('mouseout',function(d) {		
				            div.transition()		
			            		.duration(500)		
			            		.style("opacity", 0);});
		
	}
	
	for(i=0;i<ascensores.length;i++){
		
		var div = d3.select("body").append("div")	
				    .attr("class", "tooltipLugar")				
				    .style("opacity", 0);
		
		var ascensor= svg.append("text")
						.attr("x",ascensores[i].coord_x)
						.attr("y",ascensores[i].coord_y)
						.attr("font-family","FontAwesome")
						.attr("font-size","20px")
						.attr("tipo","ascensor")
						.attr("cursor","pointer")
						.text(function(d){return "\uf151"})
						.on('mouseover',function(d) {		
				            div.transition()		
			            	.duration(200)		
			            	.style("opacity", .9);
				            div	.html("<strong><span>Ascensor</span></strong>")	
			            		.style("left", (d3.event.pageX) + "px")		
			            		.style("top", (d3.event.pageY - 28) + "px");})
						.on('mouseout',function(d) {		
				            div.transition()		
			            		.duration(500)		
			            		.style("opacity", 0);});
		
	}
	
	for(i=0;i<banos.length;i++){
		
		var div = d3.select("body").append("div")	
	    .attr("class", "tooltipLugar")				
	    .style("opacity", 0);
		
		var bano= svg.append("text")
						.attr("x",banos[i].coord_x)
						.attr("y",banos[i].coord_y)
						.attr("font-family","FontAwesome")
						.attr("font-size","20px")
						.attr("tipo","bano")
						.attr("cursor","pointer")
						.text(function(d){return "\uf182"})
						.on('mouseover',function(d) {		
				            div.transition()		
			            	.duration(200)		
			            	.style("opacity", .9);
				            div	.html("<strong><span>Baño</span></strong>")	
			            		.style("left", (d3.event.pageX) + "px")		
			            		.style("top", (d3.event.pageY - 28) + "px");})
						.on('mouseout',function(d) {		
				            div.transition()		
			            		.duration(500)		
			            		.style("opacity", 0);});
		
	}
	
	for(i=0;i<despachos.length;i++){
		
		var div = d3.select("body").append("div")	
				    .attr("class", "tooltipLugar")				
				    .style("opacity", 0);
		
		var despacho= svg.append("text")
						.attr("x",despachos[i].coord_x)
						.attr("y",despachos[i].coord_y)
						.attr("font-family","FontAwesome")
						.attr("font-size","20px")
						.attr("tipo","despacho")
						.attr("cursor","pointer")
						.text(function(d){return "\uf108"})
						.on('mouseover',function(d) {		
				            div.transition()		
			            	.duration(200)		
			            	.style("opacity", .9);
				            div	.html("<strong><span>Despacho</span></strong>")	
			            		.style("left", (d3.event.pageX) + "px")		
			            		.style("top", (d3.event.pageY - 28) + "px");})
						.on('mouseout',function(d) {		
				            div.transition()		
			            		.duration(500)		
			            		.style("opacity", 0);});
		
	}
	
}

$(document).ready(function(){
	dibujarAreas();
	dibujarLectores();
	dibujarLugares();
});