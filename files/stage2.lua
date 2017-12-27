function stage2_load()
	world_2 = love.physics.newWorld(0, 5*64, true)
	objects = {}
	--platforms
	objects.platform_right = {}
	objects.platform_right.body = love.physics.newBody(world_2, 0,(height*3/4))
	objects.platform_right.shape = love.physics.newRectangleShape(300, 50)
	objects.platform_right.fixture = love.physics.newFixture(objects.platform_right.body, objects.platform_right.shape)
	--------------------------------ball--------------------------------------------------
		stage_play_button= love.graphics.newImage("images/stage-play-button.png")
	stage_replay_button= love.graphics.newImage("images/stage-replay-button.png")

	white= love.graphics.newImage("images/white.png")
	ball = love.graphics.newImage("images/ball.png")
	x_stage_play_button= width/2 - 32
	y_stage_play_button= height-74

	x_stage_replay_button = x_stage_play_button + 64
	y_stage_replay_button = y_stage_play_button

	objects.ball = {}
	objects.ball.body = love.physics.newBody(world_2, 110,(height*3/4)-47, "dynamic")
	objects.ball.shape = love.physics.newCircleShape(21)
	objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape)
	objects.ball.body:setActive( false )
	--objects.ball.fixture:setRestitution(0.5)
	rotation = math.pi
	stage_play = true --controle
	stage_replay=true -- controle
	-------------------------line---------------------------------------------------------
	mouse_positions = {}
	size = 4,5
	width_line = -100
	height_line = -100
	draw= true
	--line
	objects.line={}
	objects.line.body = love.physics.newBody(world_2, width_line, height_line)
	objects.line.shape = love.physics.newCircleShape(size)
	objects.line.fixture = love.physics.newFixture(objects.line.body, objects.line.shape)
	-----------------------flag---------------------------------------------------------
	flag = love.graphics.newImage("images/flag.png")
	x_flag=width-130
	y_flag=3/4*height
	passou= false
	fail=false
	------------------------stars------------------------------------------------------
	score_2_2= 0
	star1= love.graphics.newImage("images/star.png")
	x_star1= 75
	y_star1= (height*3/5)-150
	star_1_collision = false

	star2= love.graphics.newImage("images/star.png")
	x_star2= width/2
	y_star2= height-200
	star_2_collision = false

	star3= love.graphics.newImage("images/star.png")
	x_star3= width-200
	y_star3= height -150
	star_3_collision = false
	stars={}
	for i=1,4 do
		stars[i]=0
	end
	--para o efeito da pontuacao
	x_score_2_1=x_star1
	y_score_2_1=y_star1
	x_score_2_2=x_star2
	y_score_2_2=y_star2
	x_score_2_3=x_star3
	y_score_2_3=y_star3
	opacity1 = 255
	opacity2 = 255
	opacity3 = 255
end

function stage2_update(dt)
	world_2:update(dt)
	x, y = love.mouse.getPosition( )
	--------------------------flag--------------------------------------
	if passou then
		passou = false
	end
	if fail then
		fail = false
	end
	if objects.ball.body:getY() > 950 then
		fail = true
	end
	if checaToqueRectangle(objects.ball.body:getX(),objects.ball.body:getY(), x_flag+21, y_flag, x_flag+109, 128) then
		passou= true
		--objects.ball.body:setPosition(objects.ball.body:getX(), objects.ball.body:getY())
		objects.ball.body:setActive( false )
	end


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
		objects.line.body = love.physics.newBody(world_2, width_line, height_line)
		objects.line.shape = love.physics.newCircleShape(size)
		objects.line.fixture = love.physics.newFixture(objects.line.body, objects.line.shape)
	end


	------------------------ball--------------------------------------------
	velocX_bola, velocY_bola = objects.ball.body:getLinearVelocity( )
	if  not((passou and  fail) and  next_menu_active) then
		x_ball, y_ball = objects.ball.body:getX(), objects.ball.body:getY()
		if checaToqueRectangle(x_mouse,y_mouse, x_stage_play_button, y_stage_play_button, 64, 64) then
			love.mouse.setVisible( true )
			if love.mouse.isDown(1) and stage_play and not passou and  not fail then
				objects.ball.body:applyForce(8000, 0)
				objects.ball.body:setActive( true )
				stage_play=false
				draw= false
			end
		end
		if checaToqueRectangle(x_mouse,y_mouse, x_stage_replay_button, y_stage_replay_button, 64, 64) then
			love.mouse.setVisible(true)
			if love.mouse.isDown(1) and stage_replay and not passou and  not fail then
				world_2:destroy( )
				stage2_load()
			end
		end


		if not passou then
			rotation=rotation+velocX_bola/1000
		end
	end

	-----------------------------score_2------------------------------

	if checaToqueRectangle(objects.ball.body:getX(),objects.ball.body:getY(), x_star1-15, y_star1-15, 60, 60) and not star_1_collision then
		stars[1]= 100
		star_1_collision = true
		y_score_2_1=y_star1
		opacity1=255
	end
	y_score_2_1 = y_score_2_1 -4
	opacity1 = opacity1 -10

	if checaToqueRectangle(objects.ball.body:getX(),objects.ball.body:getY(), x_star2-15, y_star2-15, 60, 60) and not star_2_collision then
		stars[2]= 100
		star_2_collision = true
		y_score_2_2 = y_star2
		opacity2 = 255
	end
	y_score_2_2 = y_score_2_2 -4
	opacity2 = opacity2 -10

	if checaToqueRectangle(objects.ball.body:getX(),objects.ball.body:getY(), x_star3-15, y_star3-15, 60, 60) and not star_3_collision then
		stars[3]=100
		star_3_collision = true
		y_score_2_3 = y_star3
		opacity3 = 255
	end
	y_score_2_3 = y_score_2_3 -4
	opacity3 = opacity3 -10

	if stars[1] == 100 and stars[2]== 0 and stars[3]== 0 then
		stars[4]= 0
	elseif stars[1] == 0 and stars[2]== 100 and stars[3]== 0 then
		stars[4]= 0
	elseif stars[1] == 0 and stars[2]== 0 and stars[3]== 100 then
		stars[4]= 0
	elseif stars[1] == 100 and stars[2]== 100 and stars[3]== 0 then
		stars[4]= 50
	elseif stars[1] == 100 and stars[2]== 0 and stars[3]== 100 then
		stars[4]= 50
	elseif stars[1] == 0 and stars[2]== 100 and stars[3]== 100 then
		stars[4]= 50
	elseif stars[1] == 100 and stars[2]== 100 and stars[3]== 100 then
		stars[4]= 100
	end
	score_2 = stars[1] + stars[2] + stars[3] + stars[4]
end

function stage2_draw()
	love.graphics.setColor(0, 0, 0)
   	love.graphics.setFont(font_low)
   	love.graphics.print( "fase : 2", width- 100, 20)
	-------------------------------flag--------------------------------------

	love.graphics.setColor(255,255,255)
	love.graphics.draw(flag, x_flag, y_flag)

-------------------------------line------------------------------------

	for i = 1, #mouse_positions do
		obj = mouse_positions[i]

		love.graphics.setColor(obj[1])
		love.graphics.circle("fill", obj[2], obj[3], obj[4])
	end
	if draw then
		love.graphics.setColor(0, 0, 0)
		love.graphics.circle("line", x, y, size)
	end
	love.graphics.setColor(255, 255, 255)

------------------------------ball--------------------------------------

	love.graphics.draw(white, x_stage_play_button, y_stage_play_button)
	love.graphics.draw(stage_play_button, x_stage_play_button, y_stage_play_button)
	love.graphics.draw(white, x_stage_replay_button, y_stage_replay_button)
	love.graphics.draw(stage_replay_button, x_stage_replay_button, y_stage_replay_button)

	love.graphics.setColor(0, 0, 0)
	love.graphics.polygon("fill", objects.platform_right.body:getWorldPoints(objects.platform_right.shape:getPoints()))
	--love.graphics.setColor(255, 0, 0, 150)
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(ball, objects.ball.body:getX(), objects.ball.body:getY(),rotation, 1, 1, 21, 21)

-----------------------------stars----------------------------------------

	love.graphics.setFont(font_low)
	love.graphics.setColor(255, 255, 255)
	local spriteNum = math.floor(star.currentTime / star.duration * #star.quads) + 1
  	if not star_1_collision then
  		love.graphics.setColor(255, 255, 255)
  		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], x_star1, y_star1, 0, 1)
  	else love.graphics.setColor(0, 0, 0,opacity1)
  		love.graphics.print( score_2, x_score_2_1, y_score_2_1)
  	end
  	if not star_2_collision then
  		love.graphics.setColor(255, 255, 255)
  		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], x_star2, y_star2, 0, 1)
  	else love.graphics.setColor(0, 0, 0,opacity2)
  		love.graphics.print( score_2, x_score_2_2, y_score_2_2)
  	end
  	if not star_3_collision then
  		love.graphics.setColor(255, 255, 255)
  		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], x_star3, y_star3, 0, 1)
  	else love.graphics.setColor(0, 0, 0,opacity3)
  		love.graphics.print( score_2, x_score_2_3, y_score_2_3)
  	end
  	love.graphics.setColor(255, 255, 255)
end