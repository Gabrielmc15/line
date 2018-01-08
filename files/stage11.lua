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
		if limit < 8 and (t == "a" or t == "b" or t =="c"or t == "d"or t == "e"or t == "f"or t == "g"or t == "h"or t =="i"or t =="j"or t == "k"or t == "l"or t == "m"or t =="n"or t =="o"or t =="p"or t =="q"or t =="r"or t =="s"or t =="t"or t =="u"or t =="v"or t =="w"or t =="x"or t =="y"or t =="z" or t == "A" or t == "B" or t == "C" or t =="D" or t =="E" or t =="F" or t == "G" or t == "H" or t =="I" or t == "J" or t =="K" or t =="L" or t =="M" or t == "N" or t == "O" or t =="P" or t =="Q" or t =="R" or t =="S" or t =="T" or t == "U" or t == "V" or t =="W" or t =="X" or t =="Y" or t =="Z" or t =="0"or t =="1"or t =="2"or t =="3"or t =="4"or t =="5"or t =="6"or t =="7"or t =="8"or t =="9" ) then
	    	text = text .. t 
	    	limit = limit +1
		end	    
	end
	function love.keypressed(key)
   		if key == "backspace" then
   		    stage_11_play = true
   		end
	end

	if love.keyboard.isDown( "return") and limit >=3 then 
		love.audio.play( click )
		scores_load()
		scores_update(dt)
		stage = 12
	end
	---------------------------------------------------------------------------------------
	if checaToqueRectangle(x_mouse,y_mouse, x_gravar_button, y_gravar_button, 200, 50) then
		gravar_pressed=true
		if love.mouse.isDown(1) and limit >=3 then
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
	love.graphics.printf(text,  (width/3- 75) + 250, height/2+100, width)
	-----------------------------------------------------------------------------------
	love.graphics.setColor(255, 255, 255)
	if not gravar_pressed then
		love.graphics.draw(gravar_button, x_gravar_button, y_gravar_button)
	else love.graphics.draw(gravar_button_pressed, x_gravar_button, y_gravar_button)
	end
end
