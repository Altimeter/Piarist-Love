debug = true

function love.load(arg)

	x = 0
	y = 0
	xchange = 5
end

function love.update(dt)

	if love.keyboard.isDown("right")
		then
		x = x + xchange
	elseif love.keyboard.isDown("left")
		then
		x = x - xchange
	end

end

function love.draw(dt)
	love.graphics.rectangle("fill", x, y, 60, 60)

end
