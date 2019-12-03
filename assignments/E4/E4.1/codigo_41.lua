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

radius1 = 0
radius2 = 0
radius3 = 0

colorR = 0
colorG = 0
colorB = 0

----------------------------------------------------
function setup()
	of.enableSmoothing()
	of.setCircleResolution(50)

	radius1 = 50
	radius2 = 50
	radius3 = 50
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


	-- Map the values to the colors
	color1 = of.map(_mosaic_data_inlet[1], 0.0, 1.0, 0, 255)
	color2 = of.map(_mosaic_data_inlet[2], 0.0, 1.0, 0, 255)
	color3 = of.map(_mosaic_data_inlet[3], 0.0, 1.0, 0, 255)


end

----------------------------------------------------
function draw()

	----------------------------------------- RECEIVING vector<float> from MOSAIC PATCH
	-- avoid null readings
	if next(_mosaic_data_inlet) == nil then
		return
	end

	-----------------------------------------

	-- of.background(0)

	of.setColor(0, 0, 0, 1)
	of.drawRectangle(0, 0, OUTPUT_WIDTH, OUTPUT_HEIGHT)


	-- Inner circle
	of.pushMatrix()

	of.translate(OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2)
	of.rotateZDeg(angleZ)
	of.setColor(color1, color2, color3, 100)
	of.drawCircle(0, 100, 25, radius1)

	of.popMatrix()

	-- Middle circle
	of.pushMatrix()

	of.translate(OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2)
	of.rotateZDeg(-angleZ)
	of.setColor(color2, color3, color1, 100)
	of.drawCircle(0, 200, 25, radius2)

	of.popMatrix()

	-- Outer circle
	of.pushMatrix()

	of.translate(OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2)
	of.rotateZDeg(angleZ)
	of.setColor(color3, color1, color2, 100)
	of.drawCircle(0, 300, 25, radius3)

	of.popMatrix()


end

----------------------------------------------------
function exit()

end


-- input callbacks

----------------------------------------------------
function keyPressed(key)
	-- Pressing 1, 2 or 3 will increase the radius of the circles
	if key == string.byte('1') then
		radius1 = radius1 + 10
	elseif key == string.byte('2') then
		radius2 = radius2 + 10
	elseif key == string.byte('3') then
		radius3 = radius3 + 10
	-- Pressing 4, 5 or 6 will decrease the radius of the circles
	elseif key == string.byte('4') then
		radius1 = radius1 - 10
	elseif key == string.byte('5') then
		radius2 = radius2 - 10
	elseif key == string.byte('6') then
		radius3 = radius3 - 10
	-- Pressing r will reset the radius to their original state
	elseif key == string.byte('r') then
		radius1 = 50
		radius2 = 50
		radius3 = 50
	end
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
