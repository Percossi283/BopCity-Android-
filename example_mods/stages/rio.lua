function onCreate()
    setProperty("skipCountdown", true)
    makeLuaSprite("bg",'bg/rio/rio', -745,-250)
    addLuaSprite("bg")
    makeLuaSprite("overlay",'bg/rio/rio', -745,-250)
    addLuaSprite("overlay")
    setObjectCamera('overlay', 'camother')
    setBlendMode("overlay", "add")
    setProperty('overlay.alpha', 0.6)
end