function stage4_load()
	stage_4_play = false
	nextMenu_load()
	sideMenu_load()
	win_sound_playable = true
	world_4 = love.physics.newWorld(0, 7*64, true)
	objects = {}
	---------------------------------platforms--------------------------------------------
	objects.platform_ball = {}
	objects.platform_ball.body = love.physics.newBody(world_4, width/2,(height*4/5)-19)
	objects.platform_ball.shape = love.physics.newRectangleShape(150, 15)
	objects.platform_ball.fixture = love.physics.newFixture(objects.platform_ball.body, objects.platform_ball.shape)

	--------------------------------ball--------------------------------------------------
	objects.ball = {}
	objects.ball.body = love.physics.newBody(world_4, width/2 ,(height*4/5)-47, "dynamic")
	objects.ball.shape = love.physics.newCircleShape(21)
	objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape)
	objects.ball.body:setActive( false )
	x_ball, y_ball = objects.ball.body:getX(), objects.ball.body:getY()
	rotation = math.pi

	--------------------------------side bar--------------------------------------------------
	x_stage_play_button= 15
	y_stage_play_button= 50

	x_stage_replay_button = x_stage_play_button 
	y_stage_replay_button = height - 150

	x_stage_help_button =  x_stage_play_button 
	y_stage_help_button = height - 75

	x_arrow_right =  x_ball + 40
	y_arrow_right =  y_ball - 35
	arrow_right_active = true

	x_arrow_left =  x_ball - 104
	y_arrow_left =  y_ball - 35
	arrow_left_active = true

	stage_play = true --controle
	stage_replay=true -- controle
	stage_help = true
	help = false
	-------------------------line---------------------------------------------------------
	mouse_positions = {}
	size = 4,5
	width_line = -100
	height_line = -100
	draw= true
	--line
	objects.line={}
	objects.line.body = love.physics.newBody(world_4, width_line, height_line)
	objects.line.shape = love.physics.newCircleShape(size)
	objects.line.fixture = love.physics.newFixture(objects.line.body, objects.line.shape)
	-----------------------flag---------------------------------------------------------
	x_flag=150
	y_flag=height/50
	passou= false
	fail=false

	------------------------platform 2-------------------------------------------------
	objects.platform_left = {}
	objects.platform_left.body = love.physics.newBody(world_4, 0, y_flag + 150)
	objects.platform_left.shape = love.physics.newRectangleShape(width*4/3, 15)
	objects.platform_left.fixture = love.physics.newFixture(objects.platform_left.body, objects.platform_left.shape)
	------------------------------speed booster------------------------------------
	x_booster= width/2 + 107
	y_booster= y_flag + 100

	---------------------------------fan---------------------------------------------
	x_fan= width*4/5 -75
	y_fan = height*9/10

	x_wind_1= x_fan + 20
	y_wind_1= y_fan-70

	x_wind_2= x_fan + 20
	y_wind_2= y_fan-166

	x_wind_3= x_fan + 20
	y_wind_3= y_fan-262

	---------------------------------fan 2---------------------------------------------
	x_fan2= 125
	y_fan2 = height*9/10

	x_wind2_1= x_fan2 + 20
	y_wind2_1= y_fan2-70

	x_wind2_2= x_fan2 + 20
	y_wind2_2= y_fan2-166

	x_wind2_3= x_fan2 + 20
	y_wind2_3= y_fan2-262
	------------------------stars------------------------------------------------------
	score= 0
	x_star1= 175
	y_star1= (height*3/5)-75
	star_1_collision = false

	x_star2= width/2
	y_star2= height/2 + 75
	star_2_collision = false

	x_star3= width*7/10
	y_star3= 80
	star_3_collision = false
	stars={}
	for i=1,4 do
		stars[i]=0
	end
	--para o efeito da pontuacao
	x_score_1=x_star1
	y_score_1=y_star1
	x_score_2=x_star2
	y_score_2=y_star2
	x_score_3=x_star3
	y_score_3=y_star3
	opacity1 = 255
	opacity2 = 255
	opacity3 = 255
end

function stage4_update(dt)
	world_4:update(dt)
	sideMenu_update(dt)
	x_mouse, y_mouse = love.mouse.getPosition( )
	x, y = love.mouse.getPosition( )
	velocX_bola, velocY_bola = objects.ball.body:getLinearVelocity( )
	x_ball, y_ball = objects.ball.body:getX(), objects.ball.body:getY()

	------------------------line-----------------------------------------

	if draw then
		love.mouse.setVisible( false )
	end
	if checaToqueRectangle(x_mouse,y_mouse, x_stage_play_button, y_stage_play_button, 64, 64) then
		love.mouse.setVisible( true )
	end
	color_black = {0, 0, 0}
	down = love.mouse.isDown(1)

	if down and draw then
		mouse_positions[#mouse_positions + 1] = {color_black, x, y, size}
		width_line = x
		height_line = y
		objects.line={}
		objects.line.body = love.physics.newBody(world_4, width_line, height_line)
		objects.line.shape = love.physics.newCircleShape(size)
		objects.line.fixture = love.physics.newFixture(objects.line.body, objects.line.shape)
	end

	------------------------ball--------------------------------------------
	if  not((passou and  fail) and  next_menu_active) then
		if not passou then
			rotation=rotation+velocX_bola/1000
		end
		if checaToqueRectangle(x_mouse, y_mouse, -10, -10 , 100 , height+10 ) then 
			love.mouse.setVisible( true )
			draw = false
		end
		if stage_play then 
			draw = true
		end
	end
	-----------------------------booster---------------------------------------
	if checaToqueRectangle(x_ball, y_ball, x_booster-32, y_booster-32, 64, 64)) then
		objects.ball.body:applyForce(-1500, 0)
		love.audio.play( booster_sound )
	end
	-------------------------fan----------------------------------------------
	if checaToqueRectangle(objects.ball.body:getX(),objects.ball.body:getY(), x_wind_3, y_wind_3, 96, 96*3) or checaToqueRectangle(objects.ball.body:getX(),objects.ball.body:getY(), x_wind2_3, y_wind2_3, 96, 96*3) then
		objects.ball.body:applyForce(0,-750)
		love.audio.play( fan_sound )
	end
end

function stage4_draw()
   	love.graphics.setFont(font_low)
   	------------------------------fan-----------------------------------------
	love.graphics.setColor(255, 255, 255)
	local spriteNum = math.floor(fan.currentTime / fan.duration * #fan.quads) + 1
    love.graphics.draw(fan.spriteSheet, fan.quads[spriteNum], x_fan, y_fan, 0, 1)
    love.graphics.draw(fan.spriteSheet, fan.quads[spriteNum], x_fan2, y_fan2, 0, 1)

	------------------------------ball--------------------------------------
	love.graphics.setColor(0, 0, 0)
	love.graphics.polygon("fill", objects.platform_ball.body:getWorldPoints(objects.platform_ball.shape:getPoints()))
	love.graphics.polygon("fill", objects.platform_left.body:getWorldPoints(objects.platform_left.shape:getPoints()))
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(ball, objects.ball.body:getX(), objects.ball.body:getY(),rotation, 1, 1, 21, 21)
	if stage_play then
		if arrow_right_active then
			love.graphics.draw( arrow_right, x_arrow_right, y_arrow_right)
		elseif arrow_left_active then
			love.graphics.draw( arrow_left, x_arrow_left, y_arrow_left)
		end
	end
	---------------------------booster-----------------------------------
	love.graphics.draw( booster, x_booster, y_booster,  math.rad(180),1,1,32,32)

	-----------------------------stars----------------------------------------
	love.graphics.setFont(font_low)
	love.graphics.setColor(255, 255, 255)
	local spriteNum = math.floor(star.currentTime / star.duration * #star.quads) + 1
  	if not star_1_collision then
  		love.graphics.setColor(255, 255, 255)
  		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], x_star1, y_star1, 0, 1)
  	else love.graphics.setColor(0, 0, 0,opacity1)
  		love.graphics.print( score, x_score_1, y_score_1)
  	end
  	if not star_2_collision then
  		love.graphics.setColor(255, 255, 255)
  		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], x_star2, y_star2, 0, 1)
  	else love.graphics.setColor(0, 0, 0,opacity2)
  		love.graphics.print( score, x_score_2, y_score_2)
  	end
  	if not star_3_collision then
  		love.graphics.setColor(255, 255, 255)
  		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], x_star3, y_star3, 0, 1)
  	else love.graphics.setColor(0, 0, 0,opacity3)
  		love.graphics.print( score, x_score_3, y_score_3)
  	end
  	love.graphics.setColor(255, 255, 255)
  	---------------------------------fan 2---------------------------------------------
    local spriteNum = math.floor(wind.currentTime / wind.duration * #wind.quads) + 1
    love.graphics.draw(wind.spriteSheet, wind.quads[spriteNum], x_wind_1, y_wind_1, 0, 1)
    love.graphics.draw(wind.spriteSheet, wind.quads[spriteNum], x_wind2_1, y_wind2_1, 0, 1)
    love.graphics.setColor(255, 255, 255,255*3/4)
    love.graphics.draw(wind.spriteSheet, wind.quads[spriteNum],x_wind_2, y_wind_2 , 0, 1)
    love.graphics.draw(wind.spriteSheet, wind.quads[spriteNum],x_wind2_2, y_wind2_2 , 0, 1)
    love.graphics.setColor(255, 255, 255,255*1/2)
    love.graphics.draw(wind.spriteSheet, wind.quads[spriteNum], x_wind_3, y_wind_3 , 0, 1)
    love.graphics.draw(wind.spriteSheet, wind.quads[spriteNum], x_wind2_3, y_wind2_3 , 0, 1)

  	--------------------------help-----------------------------------------
  	if help then
  		local spriteNum = math.floor(star.currentTime / star.duration * #star.quads) + 1
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle( "fill", (width/3 - 75), (height/10) , 700 , (height*5/10))
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle( "line", (width/3- 75), (height/10) , 700 , (height*5/10))
		love.graphics.print( "* O objetivo é fazer com que a bola toque na bandeira",(width/3- 75) + 15 , (height/10) + 25)
		love.graphics.print( "  O booster dá um impulso de velocidade para a bola", (width/3- 75) + 40 , (height/10) + 100)
		love.graphics.print( " para cada estrela você ganha 100 pontos e para cada ", (width/3- 75) + 40, (height/10) + 50)
		love.graphics.print( "  estrela extra você ganha + 50 pontos ", (width/3- 75) + 15 , (height/10) + 75)
		love.graphics.print( 'O ventilador impulsiona a bola na direção do vento', (width/3- 75) + 85 , (height/10) + 130)
		love.graphics.print( 'O botão "seta" muda a direção em que a bola irá sair', (width/3- 75) + 50 , (height/10) + 175)
		love.graphics.print( " No decorrer do jogo novos objetos e novas interações irão", (width/3- 75) + 50 , (height/10) + 225)
		love.graphics.print( 'aparecer, então quando precisar de ajuda clique no botão "help"', (width/3- 75) + 15 , (height/10) + 250)
		love.graphics.print( '"esc" para sair do menu de ajuda', 350 + (width/3 - 75) , (height/10)+ (height*4/10))
		love.graphics.setColor(255, 255, 255)
		love.graphics.draw( booster, (width/3- 75) + 15 , (height/10) + 100, 0, 1/2, 1/2)
		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], (width/3- 75) + 15 , (height/10) + 50, 0, 1)
		local spriteNum = math.floor(fan.currentTime / fan.duration * #fan.quads) + 1
    	love.graphics.draw(fan.spriteSheet, fan.quads[spriteNum],  (width/3- 75) + 10 , (height/10) + 130, 0, 1/2, 1/2)
		love.graphics.draw( stage_help_button, (width/3- 75) + 15 , (height/10) + 220, 0, 1/2, 1/2)
		love.graphics.draw(stage_arrow_button, (width/3- 75) + 15 , (height/10) + 170, 0, 1/2, 1/2)
	end
	-------------------------side menu--------------------------------------
	sideMenu_draw()
end

