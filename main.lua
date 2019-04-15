-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- simple touch code
display.setDefault( "background", 100/255, 100/255, 200/255 )

local theBall = display.newImageRect( "./assets/ball.png", 200, 200 )
theBall.x = display.contentCenterX
theBall.y = 320
theBall.id = "ball object"
 
local function onBallTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
        theBall.y = theBall.y + 50
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
        theBall.y = theBall.y - 50
    end
  
    return true
end

theBall:addEventListener( "touch", onBallTouched )

-- Comprehensive touch code

local theBall2 = display.newImageRect( "./assets/ball2.png", 100, 100 )
theBall2.x = display.contentCenterX
theBall2.y = 100
theBall2.id = "second ball object"
 
local function theBall2touch ( event )
local theBall2touched = event.target

        if (event.phase == "began") then
        	display.getCurrentStage():setFocus( theBall2touched )

        	theBall2touched.startMoveX = theBall2touched.x
        	theBall2touched.startMoveY = theBall2touched.y

        elseif (event.phase == "moved") then
        		 theBall2touched.x = (event.x - event.xStart) + theBall2touched.startMoveX
        		 theBall2touched.y = (event.y - event.yStart) + theBall2touched.startMoveY
 
        elseif event.phase == "ended" or event.phase == "cancelled"  then
        		display.getCurrentStage():setFocus( nil )

             
        end
                return true
end

theBall2:addEventListener("touch", theBall2touch )