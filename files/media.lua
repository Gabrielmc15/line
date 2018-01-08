function images_load()
	------------------------------------menu----------------------------------------
	play_button = love.graphics.newImage("images/menu/play-button.png")
	play_button_pressed = love.graphics.newImage("images/menu/play-button_pressed.png")
	scores_button = love.graphics.newImage("images/menu/scores-button.png")
	scores_button_pressed = love.graphics.newImage("images/menu/scores-button_pressed.png")
	exit_button = love.graphics.newImage("images/menu/exit-button.png")
	exit_button_pressed = love.graphics.newImage("images/menu/exit-button_pressed.png")
	gravar_button = love.graphics.newImage("images/menu/gravar-button.png")
	gravar_button_pressed = love.graphics.newImage("images/menu/gravar-button_pressed.png")
	button_menu = love.graphics.newImage("images/menu/button_menu.png")
	button_menu_pressed = love.graphics.newImage("images/menu/button_menu_pressed.png")

	----------------------------------next menu-------------------------------------
	next_menu = love.graphics.newImage("images/next_menu/next-menu.png")
	next_menu_fail = love.graphics.newImage("images/next_menu/next-menu_fail.png")
	next_button = love.graphics.newImage("images/next_menu/next-button.png")
	next_button_pressed = love.graphics.newImage("images/next_menu/next-button_pressed.png")
	try_again_button = love.graphics.newImage("images/next_menu/tentar-novamente-button.png")
	try_again_button_pressed = love.graphics.newImage("images/next_menu/tentar-novamente-button_pressed.png")
	menu_button = love.graphics.newImage("images/next_menu/menu-button.png")
	menu_button_pressed = love.graphics.newImage("images/next_menu/menu-button_pressed.png")

	----------------------------------score stars---------------------------------------
	score_star_1 = love.graphics.newImage("images/score_stars/score_star.png")
	score_star__1_full = love.graphics.newImage("images/score_stars/score_star_full.png")
	score_star_2 = love.graphics.newImage("images/score_stars/score_star.png")
	score_star__2_full = love.graphics.newImage("images/score_stars/score_star_full.png")
	score_star_3 = love.graphics.newImage("images/score_stars/score_star.png")
	score_star__3_full = love.graphics.newImage("images/score_stars/score_star_full.png")

	-------------------------------------ball---------------------------------------------
	arrow_right= love.graphics.newImage("images/ball/arrow-right.png")
	arrow_left= love.graphics.newImage("images/ball/arrow-left.png")

	stage_play_button= love.graphics.newImage("images/side_menu/stage-play-button.png")
	stage_replay_button= love.graphics.newImage("images/side_menu/stage-replay-button.png")
	stage_help_button= love.graphics.newImage("images/side_menu/stage-help-button.png")
	stage_arrow_button = love.graphics.newImage("images/side_menu/stage-arrow-button.png")
	stage_ball_button = love.graphics.newImage("images/side_menu/stage-ball-button.png")

	ball = love.graphics.newImage("images/ball/ball.png")
	beach_ball = love.graphics.newImage("images/ball/beach-ball.png")
	golf_ball =love.graphics.newImage("images/ball/golf-ball.png") 

	-------------------------------------flag-------------------------------------------
	flag = love.graphics.newImage("images/scenario/flag.png")
	booster = love.graphics.newImage("images/scenario/speed-booster.png")
end

function audio_load()
	-------------------------------------audios----------------------------------------
	click = love.audio.newSource("audio/click.wav", "static")
	pick_star = love.audio.newSource("audio/pick_star.wav", "static")
	
	win_sound = love.audio.newSource("audio/win_sound.wav", "static")
	win_sound_1 = love.audio.newSource("audio/win_sound_1.wav", "static")
	win_sound_2 = love.audio.newSource("audio/win_sound_2.wav", "static")
	win_sound_3 = love.audio.newSource("audio/win_sound_3.wav", "static")
	fail_sound = love.audio.newSource("audio/fail.wav", "static")

	fan_sound = love.audio.newSource("audio/fan_fx.wav", "static")
	booster_sound = love.audio.newSource("audio/booster_sound.wav", "static")
	portal_sound = love.audio.newSource("audio/portal_sound.wav", "static")
end
