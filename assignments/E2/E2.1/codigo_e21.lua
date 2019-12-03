--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 20189 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--  freedoms to use Mosaic in any context: commercial or non-commercial,
--  public or private, open or closed source.
--
--  See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	EmptyScriptWithMosaicTableTO_LUA.lua: A basic template script for receiving the vector data
--  (the "lua script" object inlet) from Mosaic patch
--
--


-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")

-- _mosaic_data_inlet is the name of the lua table storing data incoming from a Mosaic patch
-- a vector<float> is automatically converted to a lua table, where the index starts from 1, NOT 0
-- so the first position of your table will be accessed like this: _mosaic_data_inlet[1]


angleZ = 0
radius = 0

posX = 0
posY = 0

colorR = 0
colorG = 0
colorB = 0

----------------------------------------------------
function setup()


end

----------------------------------------------------
function update()
	----------------------------------------- RECEIVING vector<float> from MOSAIC PATCH
	-- avoid null readings
	if next(_mosaic_data_inlet) == nil then
		return
	end
	-----------------------------------------

	if angleZ < 360 then
		angleZ = angleZ + 1
	else
		angleZ = 0
	end

	-- Map the values to x and y
	posX = of.map(_mosaic_data_inlet[1], 0.0, 1.0, -100, 100)
	posY = of.map(_mosaic_data_inlet[2], 0.0, 1.0, -100, 100)

	-- Map the values to x and y
	posX2 = of.map(_mosaic_data_inlet[3], 0.0, 1.0, -100, 100)
	posY2 = of.map(_mosaic_data_inlet[4], 0.0, 1.0, -100, 100)

	-- Map the values to the colors
	colorR = of.map(_mosaic_data_inlet[1], 0.0, 1.0, 0, 255)
	colorG = of.map(_mosaic_data_inlet[2], 0.0, 1.0, 0, 255)
	colorB = of.map(_mosaic_data_inlet[3], 0.0, 1.0, 0, 255)

	-- Map a value to the radius
	radius = of.map(_mosaic_data_inlet[4], 0.0, 1.0, 0, 1)


end

----------------------------------------------------
function draw()

	----------------------------------------- RECEIVING vector<float> from MOSAIC PATCH
	-- avoid null readings
	if next(_mosaic_data_inlet) == nil then
		return
	end

	-----------------------------------------


	-- Transparent background
	of.setColor(0, 0, 0, 1)
	of.drawRectangle(0, 0, OUTPUT_WIDTH, OUTPUT_HEIGHT)

	-- Drawing A
	of.pushMatrix()

	of.translate(OUTPUT_WIDTH/2 - 200, OUTPUT_HEIGHT/2 - 100)
	of.rotateZDeg(-angleZ) -- Rotate in the oposite direction
	of.setColor(colorR, colorG, colorB, 100)
	of.drawLine(posX, posY, radius, OUTPUT_WIDTH/5)

	of.popMatrix()

	-- Drawing B
	of.pushMatrix()

	of.translate(OUTPUT_WIDTH/2 - 100, OUTPUT_HEIGHT/2 + 100)
	of.rotateZDeg(angleZ) -- Rotate
	of.setColor(colorR, colorG, colorB, 100)
	of.drawLine(posX, posY, radius, OUTPUT_WIDTH/5)

	of.popMatrix()

	-- Drawing C
	of.pushMatrix()

	of.translate(OUTPUT_WIDTH/2 + 100, OUTPUT_HEIGHT/2 + 100)
	of.rotateZDeg(-angleZ) -- Rotate in the oposite direction
	of.setColor(colorR, colorG, colorB, 100)
	of.drawLine(posX, posY, radius, OUTPUT_WIDTH/5)

	of.popMatrix()

	-- Drawing D
	of.pushMatrix()

	of.translate(OUTPUT_WIDTH/2 + 200, OUTPUT_HEIGHT/2 - 100)
	of.rotateZDeg(angleZ) -- Rotate the oposite direction
	of.setColor(colorR, colorG, colorB, 100)
	of.drawLine(posX, posY, radius, OUTPUT_WIDTH/5)

	of.popMatrix()

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
