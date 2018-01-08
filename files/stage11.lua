function stage11_load()
	stage_11_play = false
	nextMenu_load()

	x_gravar_button = (width/3 - 75) + 450
	y_gravar_button = (height/10) + (height*7/10)
	gravar_pressed = false
	
	text = ""
	limit = 0
    love.keyboard.setKeyRepeat(true)

    players ={}
	scores = {}

	i=1
	j=1
end

function stage11_update(dt)
	nextMenu_load()
	function love.textinput(t)
		if limit < 8 and (not love.keyboard.isDown( "space", ";", ":", ".", "-", "_", "/", "]", "[", "´", ",", "|","~", "`")) then
	    	text = text .. t
		end
	    limit = limit +1
	end
	function love.keypressed(key)
   		if key == "backspace" then
   		    stage_11_play = true
   		end
	end

	if love.keyboard.isDown( "return") then 
		love.audio.play( click )
		scores_load()
		scores_update(dt)
		stage = 12
	end
	---------------------------------------------------------------------------------------
	if checaToqueRectangle(x_mouse,y_mouse, x_gravar_button, y_gravar_button, 200, 50) then
		gravar_pressed=true
		if love.mouse.isDown(1) and text ~= "" then
			love.audio.play( click )
			scores_load()
			scores_update(dt)
			stage = 12
		end
		else gravar_pressed= false
	end
end


function stage11_draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle( "fill", (width/3 - 75), (height/10) , 700 , (height*8/10))
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle( "line", (width/3- 75), (height/10) , 700 , (height*8/10))
	love.graphics.setColor(0, 0, 0)
	love.graphics.setFont(font)
	love.graphics.print("PARABÉNS", (width/3 - 75) + 225, (height/10) + 40)
	love.graphics.print("Você completou todas as fases!", (width/3 - 75) + 40, (height/10) + 90)
	love.graphics.print("Sua pontuação foi: " .. total_score , (width/3 - 75) + 100, (height/10) + 250)
	love.graphics.print("Digite seu nome para gravar :", (width/3 - 75) + 40, (height/10) + 350)
	love.graphics.printf(text,  (width/3- 75) + 250, height/2+100, width/6)
	-----------------------------------------------------------------------------------
	love.graphics.setColor(255, 255, 255)
	if not gravar_pressed then
		love.graphics.draw(gravar_button, x_gravar_button, y_gravar_button)
	else love.graphics.draw(gravar_button_pressed, x_gravar_button, y_gravar_button)
	end
end
