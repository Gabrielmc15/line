function checaToqueRectangle(x_rectangle,y_rectangle, x, y, width, height)
	return (x_rectangle > x and x_rectangle < x+width and y_rectangle > y and y_rectangle < y+height)
end

function checarToqueCircle(posxT, posyT, posxR, posyR, r )
	return ((posxR - posxT)^2 + (posyR - posyT)^2 < r^2)
end