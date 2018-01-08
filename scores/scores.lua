function write_scores(file,text)
	data = text .. ";"
	success = love.filesystem.append( file, data )
end

function read_scores(file)
	scores = love.filesystem.newFile(file)
	scores:open("r")
	data = scores:read()
	scores:close()
	scores_players_read={}
	players_read = {}
	scores_read = {}
	local i=1
	if data ~= nil then
		for w in string.gmatch(data, "%w+") do
			scores_players_read[i]=w
			i=i+1
		end
		
		local j = 1
		local k = 1
		for i= 1 , #scores_players_read,2 do
			players_read[j] = scores_players_read[i]
			j=j+1
		end
	
		for i= 2 , #scores_players_read,2 do
			scores_read[k] = scores_players_read[i]
			k=k+1
		end
	end
end

function ordenarScores(v,v2)
	for i=1,#v-1 do
		for j=i+1, #v do
			if tonumber(v[j])>tonumber(v[i]) then
				v[i], v[j] = v[j], v[i]
				v2[i], v2[j] = v2[j], v2[i]
			end
		end
	end
end


function scores_load()
	--success = love.filesystem.remove( "scores.txt" )
	r = total_score
	t= text
	scores_play = true
end

function scores_update(dt)
	if scores_play then
		write_scores("scores.txt", t)
		write_scores("scores.txt", r)
		scores_play = false
	end

	read_scores("scores.txt")
	ordenarScores(scores_read,players_read)
end

function scores_draw()
	love.graphics.setColor(0, 0, 0)
	if data ~= nil then
		for i=1, #players_read do
			if i <= 10 then
				love.graphics.print(players_read[i], (width/3 - 75) + 150, (height/10) + (i*50)+50)
			end
		end
		for i=1, #scores_read do
			if i <= 10 then
				love.graphics.print(scores_read[i], (width/3 - 75) + 500, (height/10) + (i*50)+50)
			end
		end
	end
end