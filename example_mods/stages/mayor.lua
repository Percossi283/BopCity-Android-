function onCreate()
    makeLuaSprite("bg",'bg/mayor/basement')
    addLuaSprite("bg")


end


local farthestLeft = -500
local farthestRight = 1000
local runY = 350

local running = {false};
function onCreatePost()

    for i = 1,5 do
        makeAnimatedLuaSprite('run'..i,'bg/mayor/run'..i,farthestRight,runY)
        addAnimationByPrefix("run"..i, "run", "run")
        objectPlayAnimation("run"..i, "run")
        addLuaSprite("run"..i)
        setProperty('run'..i..'.alpha',0)
        setObjectOrder('run'..i,getObjectOrder("boyfriendGroup")-1)
    end


end





function onSectionHit()
    if getRandomBool(50) then
        startRun()
    end
end


function startRun()
    for i = 1,5 do
        layer = getRandomInt(1,3)
        if layer == 1 then
            setObjectOrder('run'..i,getObjectOrder("boyfriendGroup")-1)
        end
        if layer == 2 then
            setObjectOrder('run'..i,getObjectOrder("dadGroup")-1)
        end
        if layer == 3 then
            setObjectOrder('run'..i,getObjectOrder("gfGroup")-1)
        end
    
        setProperty('run'..i..'.alpha',1)
        setProperty('run'..i..'.y',runY + getRandomInt(-200,200))
        --if not running then
            flipX = getRandomBool()
            speed = 300
            if getRandomBool(80) then
                speed = 1000
            end
            if getRandomBool(10) then
                speed = 10000
            end
    
            if flipX then
                setProperty('run'..i..'.flipX', true)  
                setProperty('run'..i..'.velocity.x', speed)  
                setProperty('run'..i..'.x', farthestLeft - getProperty('run'..i..'.width'))  
            else
                setProperty('run'..i..'.flipX', false)  
                setProperty('run'..i..'.velocity.x', -speed)  
                setProperty('run'..i..'.x', farthestRight + getProperty('run'..i..'.width'))  
            end
    
            --running = true;
        --end
        
    end

end


function onUpdate(elapsed)
    --if getProperty('run.x') > farthestRight + getProperty('run.width') or getProperty('run.x') < farthestLeft - getProperty("run.width") then running = false end
end