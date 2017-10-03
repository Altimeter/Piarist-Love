debug = true

function love.load(arg)

	x = 0
	y = 0
	xchange = 5
	ychange = 5
	circsize = 60
	ymin = circsize
	xmin = circsize
	ymax = love.window.getHeight() - circsize 
	xmax = love.window.getWidth() - circsize 
	intensify = 0
	intensifymax = 10000
end

function love.update(dt)

	if love.keyboard.isDown("right")
		then
		x = x + xchange
	elseif love.keyboard.isDown("left")
		then
		x = x - xchange
	end

	if love.keyboard.isDown("up")
		then
		y = y - ychange
	elseif love.keyboard.isDown("down")
		then
		y = y + ychange
	end

	if love.keyboard.isDown("1") and love.keyboard.isDown("3")
		then
			love.event.quit()
		end
	

	if love.keyboard.isDown("=") and intensify < intensifymax
		then 
		 	intensify = intensify + 1
		elseif love.keyboard.isDown("-") and intensify > 0
			then
				intensify = intensify - 1
			end

	x = x + love.math.random(-intensify, intensify)
	y = y + love.math.random(-intensify, intensify)

	if y < ymin
		then
			y = ymin
		end

		if x < xmin
			then
			x = xmin
		end
	
		if x > xmax
			then
				x = xmax
			end

			if y > ymax
				then
					y = ymax
				end


end

function love.draw(dt)
	love.graphics.setColor(255,0,0)
	love.graphics.circle("fill", x, y, circsize, circsize)
end
