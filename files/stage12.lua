function stage12_load()
	stage_12_play = false
	nextMenu_load()
	x_button_menu = (width/3 - 75) + 50
	y_button_menu = (height/10) + (height*7/10)
	score_menu_pressed = false
end
function stage12_update(dt)
	if checaToqueRectangle(x_mouse,y_mouse, x_button_menu, y_button_menu, 200, 50) then
		score_menu_pressed = true
		if love.mouse.isDown(1) then
			love.audio.play( click )
			menu_load()
		end
		else score_menu_pressed = false
	end	
end
function stage12_draw()
	
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle( "fill", (width/3 - 75), (height/10) , 700 , (height*8/10))
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle( "line", (width/3- 75), (height/10) , 700 , (height*8/10))
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("PONTUAÇÕES", (width/3 - 75) + 190, (height/10) + 30)
	scores_update(dt)
	scores_draw()
	love.graphics.setFont(font)
	---------------------------------------------------------------------------------
	love.graphics.setColor(255, 255, 255)
	if not score_menu_pressed then
		love.graphics.draw(button_menu, x_button_menu, y_button_menu)
	else love.graphics.draw(button_menu_pressed, x_button_menu, y_button_menu)
	end
end
