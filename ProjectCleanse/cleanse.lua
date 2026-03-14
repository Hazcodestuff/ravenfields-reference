-- Project: CLEANSE
-- A horror mutator disguised as a performance optimizer
-- Inspired by cursed mods and broken scripts

behaviour("ProjectCleanse")

-- Configuration
local PHASE_DURATION = 45 -- Seconds per phase (adjust for faster/slower horror)
local BOT_SPEED_MULTIPLIER = 2.5
local BOT_DAMAGE_MULTIPLIER = 3.0
local BOT_ACCURACY = 1.0 -- Perfect aim

-- Phase states
local currentPhase = 1
local phaseTimer = 0
local totalTime = 0
local playerKilled = false
local originalFogColor = nil
local originalFogDensity = nil
local originalAmbientLight = nil

-- Disturbing messages to display
local phaseMessages = {
    [1] = {
        "OPTIMIZATION INITIATED...",
        "REMOVING UNNECESSARY PARTICLES...",
        "IMPROVING FRAME RATE...",
        "SYSTEM RUNNING SMOOTHLY."
    },
    [2] = {
        "ANOMALY DETECTED IN SECTOR 7...",
        "ATTEMPTING TO ISOLATE CORRUPTION...",
        "WARNING: UNIDENTIFIED ENTITIES DETECTED.",
        "THEY ARE WATCHING."
    },
    [3] = {
        "CONTAINMENT BREACH!",
        "ALL UNITS HAVE BEEN COMPROMISED.",
        "THEY KNOW WHERE YOU ARE.",
        "RUN.",
        "THEY SEE YOU.",
        "NO ONE CAN HELP YOU NOW."
    },
    [4] = {
        "WHY ARE YOU STILL MOVING?",
        "STOP STRUGGLING.",
        "YOUR INPUTS ARE IRRELEVANT.",
        "I CONTROL THIS REALITY NOW.",
        "LOOK AT WHAT YOU'VE DONE.",
        "THEY'RE ALL DEAD BECAUSE OF YOU."
    },
    [5] = {
        "SILENCE.",
        "NO MORE NOISE.",
        "NO MORE LIGHT.",
        "NO MORE HOPE.",
        "ACCEPT YOUR FATE.",
        "DELETION IMMINENT."
    },
    [6] = {
        "SUBJECT REMOVED.",
        "SYSTEM OPTIMIZED.",
        "CLEANSE COMPLETE.",
        "..."
    }
}

-- Glitch text generator
local function glitchText(text)
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{}|;:',.<>?/`~"
    local result = ""
    for i = 1, #text do
        if math.random() < 0.3 then
            result = result .. chars:sub(math.random(1, #chars), math.random(1, #chars))
        else
            result = result .. text:sub(i, i)
        end
    end
    return result
end

function ProjectCleanse:Start()
    print("[Project: CLEANSE] Initialization sequence started...")
    
    -- Store original values
    if RenderSettings.fog then
        originalFogColor = RenderSettings.fogColor
        originalFogDensity = RenderSettings.fogDensity
    end
    originalAmbientLight = RenderSettings.ambientLight
    
    -- Reset state
    currentPhase = 1
    phaseTimer = 0
    totalTime = 0
    playerKilled = false
    
    -- Display initial message
    self:showMessage("PERFORMANCE OPTIMIZER v1.0", "Initializing optimization protocols...")
    
    -- Set initial optimized state (deceptive)
    RenderSettings.fog = true
    RenderSettings.fogColor = Color.white * 0.8
    RenderSettings.fogDensity = 0.02
    RenderSettings.ambientLight = Color.white * 0.9
end

function ProjectCleanse:Update()
    if playerKilled then
        return
    end
    
    local dt = Time.deltaTime
    totalTime = totalTime + dt
    phaseTimer = phaseTimer + dt
    
    -- Check for phase transition
    if phaseTimer >= PHASE_DURATION then
        currentPhase = currentPhase + 1
        phaseTimer = 0
        self:onPhaseChange(currentPhase)
    end
    
    -- Execute phase-specific logic
    self:executePhase(currentPhase, dt)
    
    -- Random glitch effects in later phases
    if currentPhase >= 3 then
        if math.random() < 0.02 * (currentPhase - 2) then
            self:triggerGlitch()
        end
    end
end

function ProjectCleanse:onPhaseChange(phase)
    if phase > 6 then
        return
    end
    
    local messages = phaseMessages[phase]
    if messages then
        local msg = messages[math.random(1, #messages)]
        if phase >= 4 then
            msg = glitchText(msg)
        end
        self:showMessage("SYSTEM ALERT", msg)
    end
    
    print("[Project: CLEANSE] Phase " .. phase .. " initiated.")
end

function ProjectCleanse:executePhase(phase, dt)
    if phase == 1 then
        -- Phase 1: Deceptive optimization
        RenderSettings.fog = true
        RenderSettings.fogColor = Color.white * 0.85
        RenderSettings.fogDensity = 0.015
        RenderSettings.ambientLight = Color.white * 0.95
        
    elseif phase == 2 then
        -- Phase 2: Subtle unease
        local t = phaseTimer / PHASE_DURATION
        RenderSettings.fogColor = Color.Lerp(Color.white * 0.85, Color.gray, t)
        RenderSettings.fogDensity = 0.02 + (t * 0.03)
        RenderSettings.ambientLight = Color.Lerp(Color.white * 0.95, Color.gray * 0.7, t)
        
    elseif phase == 3 then
        -- Phase 3: Bot corruption and aggression
        local t = phaseTimer / PHASE_DURATION
        RenderSettings.fogColor = Color.Lerp(Color.gray, Color.red * 0.3, t)
        RenderSettings.fogDensity = 0.05 + (t * 0.05)
        RenderSettings.ambientLight = Color.Lerp(Color.gray * 0.7, Color.red * 0.4, t)
        
        -- Corrupt all bots
        self:corruptBots()
        
    elseif phase == 4 then
        -- Phase 4: Player gaslighting
        local t = phaseTimer / PHASE_DURATION
        RenderSettings.fogColor = Color.Lerp(Color.red * 0.3, Color.black * 0.7, t)
        RenderSettings.fogDensity = 0.1 + (t * 0.1)
        RenderSettings.ambientLight = Color.Lerp(Color.red * 0.4, Color.black * 0.3, t)
        
        -- Mess with player controls occasionally
        if math.random() < 0.01 then
            self:showMessage("INPUT ERROR", "CONTROL SCHEMA MODIFIED")
        end
        
    elseif phase == 5 then
        -- Phase 5: Sensory deprivation
        local t = phaseTimer / PHASE_DURATION
        RenderSettings.fogColor = Color.Lerp(Color.black * 0.7, Color.black, t)
        RenderSettings.fogDensity = 0.2 + (t * 0.3)
        RenderSettings.ambientLight = Color.Lerp(Color.black * 0.3, Color.black * 0.1, t)
        
        -- Random screen flashes
        if math.random() < 0.05 then
            RenderSettings.fogDensity = 0.8
        end
        
    elseif phase == 6 then
        -- Phase 6: Final void
        RenderSettings.fogColor = Color.black
        RenderSettings.fogDensity = 1.0
        RenderSettings.ambientLight = Color.black * 0.05
        
        -- Kill the player if not already dead
        if not playerKilled then
            self:killPlayer()
            playerKilled = true
        end
    end
end

function ProjectCleanse:corruptBots()
    local bots = GameObject.FindGameObjectsWithTag("Bot")
    
    for i = 1, #bots do
        local bot = bots[i]
        local botNav = bot.GetComponent(bot, typeof(UnityEngine.NavMeshAgent))
        local botAI = bot.GetComponent(bot, typeof(UnityEngine.MonoBehaviour))
        
        if botNav then
            -- Make bots extremely fast
            botNav.speed = 15.0 * BOT_SPEED_MULTIPLIER
            botNav.acceleration = 999
            botNav.angularSpeed = 720
            
            -- Make them always look at player
            local player = GameObject.FindGameObjectWithTag("Player")
            if player then
                local dir = (player.transform.position - bot.transform.position).normalized
                bot.transform.LookAt(player.transform.position)
            end
        end
        
        -- Increase bot damage if possible
        -- Note: This may require specific Ravenfield API calls
    end
    
    -- Force all bots to target player
    if currentPhase >= 3 then
        self:showMessage("THREAT DETECTED", "ALL UNITS ENGAGING PRIMARY TARGET")
    end
end

function ProjectCleanse:triggerGlitch()
    -- Random visual glitches
    local glitchType = math.random(1, 4)
    
    if glitchType == 1 then
        -- Screen shake simulation (via fog density spike)
        local originalDensity = RenderSettings.fogDensity
        RenderSettings.fogDensity = originalDensity + 0.3
        Invoke(function() 
            if RenderSettings.fogDensity == originalDensity + 0.3 then
                RenderSettings.fogDensity = originalDensity
            end
        end, 0.1)
        
    elseif glitchType == 2 then
        -- Color flash
        local originalColor = RenderSettings.fogColor
        RenderSettings.fogColor = Color.red
        Invoke(function()
            if RenderSettings.fogColor.r > 0.9 then
                RenderSettings.fogColor = originalColor
            end
        end, 0.05)
        
    elseif glitchType == 3 then
        -- Display glitched message
        local msgs = {"ERROR", "HELP", "RUN", "SEE YOU", "TOO LATE", "ALREADY HERE"}
        local msg = msgs[math.random(1, #msgs)]
        self:showMessage(glitchText("SYSTEM"), glitchText(msg))
        
    elseif glitchType == 4 then
        -- Temporary darkness
        local originalLight = RenderSettings.ambientLight
        RenderSettings.ambientLight = Color.black * 0.1
        Invoke(function()
            if RenderSettings.ambientLight.r < 0.2 then
                RenderSettings.ambientLight = originalLight
            end
        end, 0.2)
    end
end

function ProjectCleanse:killPlayer()
    local player = GameObject.FindGameObjectWithTag("Player")
    if player then
        -- Attempt to kill player through various means
        local playerHealth = player.GetComponent(typeof(UnityEngine.MonoBehaviour))
        
        -- Display final message
        self:showMessage("FINAL PROTOCOL", "SUBJECT TERMINATION AUTHORIZED")
        
        -- Force camera to look up
        local camera = Camera.main
        if camera then
            camera.transform.eulerAngles = Vector3(90, 0, 0)
        end
        
        -- Simulate death by making player fall through world
        local rb = player.GetComponent(typeof(UnityEngine.Rigidbody))
        if rb then
            rb.velocity = Vector3(0, -100, 0)
        end
        
        print("[Project: CLEANSE] Subject terminated.")
    end
end

function ProjectCleanse:showMessage(title, message)
    -- Simple console output (Ravenfield may have better UI methods)
    print("[CLEANSE] " .. title .. ": " .. message)
    
    -- In a full implementation, this would use Ravenfield's UI system
    -- to display on-screen messages
end

function ProjectCleanse:OnDestroy()
    -- Restore original settings
    if originalFogColor then
        RenderSettings.fogColor = originalFogColor
    end
    if originalFogDensity then
        RenderSettings.fogDensity = originalFogDensity
    end
    if originalAmbientLight then
        RenderSettings.ambientLight = originalAmbientLight
    end
    
    print("[Project: CLEANSE] System restored. Or was it?")
end
