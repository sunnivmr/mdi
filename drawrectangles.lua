--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2019 Sunniva Mathea Runde aka sunnivmr
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--    freedoms to use Mosaic in any context: commercial or non-commercial,
--    public or private, open or closed source.
--
--    See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	empty.lua: A Lua script template for Mosaic,
--	mimicking the standard OF app structure
--
--


-- variables for mouse interaction
mouseX = 0
mouseY = 0

numCuad = 0
numTri = 0

----------------------------------------------------
function setup()
	of.setFrameRate(7)
end

----------------------------------------------------
function update()

	if numCuad < 40 then
		numCuad = numCuad + 1
	else
		numCuad = 0
	end

	if numTri < 5 then
		numTri = numTri + 1
	else
		numTri = 0
	end

end

----------------------------------------------------
function draw()
	of.background(0, 0, 0)

	x = OUTPUT_WIDTH/numCuad
	y = OUTPUT_HEIGHT/2
	lado = x - 4

	-- Rectangles
	for i = 0, numCuad do
		of.setColor(10 * i, 3 * i, 8 * i)
		of.drawRectangle(x * i, y, lado, lado)

		of.setColor(9 * i, 3 * i, 8 * i)
		of.drawRectangle(x * i, y + (-5)*i, lado, lado)

		of.setColor(8 * i, 3 * i, 8 * i)
		of.drawRectangle(x * i, y + 5*i, lado, lado)

		of.setColor(7 * i, 3 * i, 8 * i)
		of.drawRectangle(x * i, y + (-10)*i, lado, lado)

		of.setColor(6 * i, 3 * i, 8 * i)
		of.drawRectangle(x * i, y + 10*i, lado, lado)

		of.setColor(5 * i, 3 * i, 8 * i)
		of.drawRectangle(x * i, y + (-15)*i, lado, lado)

		of.setColor(4 * i, 3 * i, 8 * i)
		of.drawRectangle(x * i, y + 15*i, lado, lado)
	end

	end


end

----------------------------------------------------
function drawRectangles(i)



end

----------------------------------------------------
function exit()

end


-- input callbacks

----------------------------------------------------
function keyPressed(key)

end

function keyReleased(key)

end

function mouseMoved(x,y)
	mouseX = x
	mouseY = y
end

function mouseDragged(x,y)
	mouseX = x
	mouseY = y
end

function mouseReleased(x,y)

end

function mouseScrolled(x,y)

end
