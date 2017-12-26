function menu_load()
	play_button = love.graphics.newImage("images/play-button.png")
	play_button_pressed = love.graphics.newImage("images/play-button_pressed.png")
	help_button = love.graphics.newImage("images/help-button.png")
	help_button_pressed = love.graphics.newImage("images/help-button_pressed.png")
	exit_button = love.graphics.newImage("images/exit-button.png")
	exit_button_pressed = love.graphics.newImage("images/exit-button_pressed.png")

	pressed = false

	x_play_button=(width/2) - 100
	y_play_button=(height/2) +100
	play_pressed= false

	x_help_button=(width/2) - 100
	y_help_button=y_play_button + 70
	help_pressed= false

	x_exit_button=(width/2)-100
	y_exit_button=y_help_button + 70
	exit_pressed= false
end

function menu_update(dt)
	--[[if love.keyboard.isDown("escape") then
		love.window.close( )
	end--]]
	x_mouse, y_mouse = love.mouse.getPosition( )
	if stage == 0 then
		function love.mousereleased(x, y, button)
			if stage == 0 then
				if button == 1 and (checaToqueRectangle(x_mouse,y_mouse, x_play_button, y_play_button, 200, 50) or checaToqueRectangle(x_mouse,y_mouse, x_help_button, y_help_button, 200, 50) or checaToqueRectangle(x_mouse,y_mouse, x_exit_button, y_exit_button, 200, 50) ) then
					pressed = true
					else pressed = false
				end
			end
		end
		--botao play
		if checaToqueRectangle(x_mouse,y_mouse, x_play_button, y_play_button, 200, 50) then
			play_pressed = true
			if pressed then
				stage = 1
				pressed= false
			end
			else play_pressed = false
		end
		--botao ajuda menu
		if checaToqueRectangle(x_mouse,y_mouse, x_help_button, y_help_button, 200, 50) then
			help_pressed = true
			if pressed then
				stage = 1
				pressed= false
			end
			else help_pressed = false
		end
		--botao sair
		if checaToqueRectangle(x_mouse,y_mouse, x_exit_button, y_exit_button, 200, 50) then
			exit_pressed = true
			if pressed then
				love.window.close( )
				pressed= false
			end
			else exit_pressed = false
		end
	end
end

function menu_draw()
	if stage == 0 then
		if not play_pressed then
			love.graphics.draw(play_button, x_play_button, y_play_button)
		else love.graphics.draw(play_button_pressed, x_play_button, y_play_button)
		end
		if not help_pressed then
			love.graphics.draw(help_button, x_help_button, y_help_button)
		else love.graphics.draw(help_button_pressed, x_help_button, y_help_button)
		end
		if not exit_pressed then
			love.graphics.draw(exit_button, x_exit_button, y_exit_button)
		else love.graphics.draw(exit_button_pressed, x_exit_button, y_exit_button)
		end
	end
end