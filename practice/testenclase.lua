--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--    freedoms to use Mosaic in any context: commercial or non-commercial,
--    public or private, open or closed source.
--
--    See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--
--


-- variables for mouse interaction
mouseX = 0
mouseY = 0

posY = 0
inc = 1

colorCr = 0
colorCg = 0
colorCb = 0

radio = 100
incRadio = 1

----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()
	posY = posY + inc

	if posY > OUTPUT_HEIGHT or posY < 0 then
		inc = inc *- 1
	end
end

----------------------------------------------------
function draw()
	of.background(0, 0, 0)
	of.setLineWidth(4)
	r = of.random(128, 255)
	g = of.random(128, 255)
	b = of.random(128, 255)

	of.setColor(r, g, b)
	of.drawLine(0, posY, OUTPUT_WIDTH, posY)

	of.setColor(colorCr, colorCg, colorCb)
	of.drawCircle(OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, radio)

	if posY < OUTPUT_HEIGHT/8 then
		colorCr = 124
		colorCg = 83
		colorCb = 41
	elseif posY < OUTPUT_HEIGHT/4 then
		colorCr = 90
		colorCg = 221
		colorCb = 230
	elseif posY < OUTPUT_HEIGHT/2 then
		colorCr = 123
		colorCg = 50
		colorCb = 12
	elseif posY < 3*OUTPUT_HEIGHT/4 then
		colorCr = 255
		colorCg = 246
		colorCb = 100
	end

	radio = radio + 1
	if radio > 200 or radio < 10 then
		incRadio = incRadio * -1
	end

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
