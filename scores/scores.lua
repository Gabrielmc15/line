--[[
function open()
	local scores = io.open("scores.txt", "a+")
	scores:write("1534 ; ")
	scores:close()
end

function read()
	local scores = io.open("scores.txt", "a+")
	print(scores:read())
	scores:close()
end

open()
read()
--]]

s= "oi;lfas;1233"
text={}
text={}
i=1
for w in string.gmatch(s, "%w+") do
	--print(w)
	text[i]=w
	i=i+1
end

for i=1, #text do
	print(text[i])
end

