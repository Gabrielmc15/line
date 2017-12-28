function images_load()
	------------------------------------menu----------------------------------------
	play_button = love.graphics.newImage("images/play-button.png")
	play_button_pressed = love.graphics.newImage("images/play-button_pressed.png")
	help_button = love.graphics.newImage("images/help-button.png")
	help_button_pressed = love.graphics.newImage("images/help-button_pressed.png")
	exit_button = love.graphics.newImage("images/exit-button.png")
	exit_button_pressed = love.graphics.newImage("images/exit-button_pressed.png")

	----------------------------------next menu-------------------------------------
	next_menu = love.graphics.newImage("images/next-menu.png")
	next_menu_fail = love.graphics.newImage("images/next-menu_fail.png")
	next_button = love.graphics.newImage("images/next-button.png")
	next_button_pressed = love.graphics.newImage("images/next-button_pressed.png")
	try_again_button = love.graphics.newImage("images/tentar-novamente-button.png")
	try_again_button_pressed = love.graphics.newImage("images/tentar-novamente-button_pressed.png")
	menu_button = love.graphics.newImage("images/menu-button.png")
	menu_button_pressed = love.graphics.newImage("images/menu-button_pressed.png")

	----------------------------------score stars---------------------------------------
	score_star_1 = love.graphics.newImage("images/score_star.png")
	score_star__1_full = love.graphics.newImage("images/score_star_full.png")
	score_star_2 = love.graphics.newImage("images/score_star.png")
	score_star__2_full = love.graphics.newImage("images/score_star_full.png")
	score_star_3 = love.graphics.newImage("images/score_star.png")
	score_star__3_full = love.graphics.newImage("images/score_star_full.png")

	-------------------------------------ball---------------------------------------------
	stage_play_button= love.graphics.newImage("images/stage-play-button.png")
	stage_replay_button= love.graphics.newImage("images/stage-replay-button.png")
	ball = love.graphics.newImage("images/ball.png")
	beach_ball = love.graphics.newImage("images/beach-ball.png")

	-------------------------------------flag-------------------------------------------
	flag = love.graphics.newImage("images/flag.png")

	-------------------------------------stars--------------------------------------------
	star1= love.graphics.newImage("images/star.png")
	star2= love.graphics.newImage("images/star.png")
	star3= love.graphics.newImage("images/star.png")

end