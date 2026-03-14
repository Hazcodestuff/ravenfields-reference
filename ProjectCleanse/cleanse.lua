-- Project: CLEANSE
-- A horror mutator disguised as a performance optimizer
-- Inspired by cursed mods and broken scripts
-- FIXED VERSION - Robust error handling

behaviour("ProjectCleanse")

-- Configuration
local PHASE_DURATION = 45 -- Seconds per phase (adjust for faster/slower horror)
local BOT_SPEED_MULTIPLIER = 2.5
local BOT_DAMAGE_MULTIPLIER = 3.0

-- Phase states
local currentPhase = 1
local phaseTimer = 0
local totalTime = 0
local playerKilled = false
local glitchActive = false
local glitchTimer = 0

-- Store original values for restoration
local originalFogColor = nil
local originalFogDensity = nil
local originalAmbientLight = nil
local originalFogEnabled = nil

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
    if not text or #text == 0 then return "" end
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{}|;:',.<>?/`~"
    local result = ""
    for i = 1, #text do
        if math.random() < 0.3 then
            local randIdx = math.random(1, #chars)
            result = result .. chars:sub(randIdx, randIdx)
        else
            result = result .. text:sub(i, i)
        end
    end
    return result
end

-- Safe color creation
local function createColor(r, g, b, a)
    a = a or 1.0
    return Color.new(r, g, b, a)
end

-- Lerp helper
local function lerpColor(color1, color2, t)
    if not color1 or not color2 then return color1 or Color.black end
    return Color.Lerp(color1, color2, math.max(0, math.min(1, t)))
end

function ProjectCleanse:Awake()
    -- Initialize state in Awake
    currentPhase = 1
    phaseTimer = 0
    totalTime = 0
    playerKilled = false
    glitchActive = false
    glitchTimer = 0
end

function ProjectCleanse:Start()
    print("[Project: CLEANSE] Initialization sequence started...")
    
    -- Store original values safely
    if RenderSettings then
        originalFogEnabled = RenderSettings.fog
        if RenderSettings.fogColor then
            originalFogColor = RenderSettings.fogColor
        end
        if RenderSettings.fogDensity then
            originalFogDensity = RenderSettings.fogDensity
        end
        if RenderSettings.ambientLight then
            originalAmbientLight = RenderSettings.ambientLight
        end
    end
    
    -- Display initial message
    self:showMessage("PERFORMANCE OPTIMIZER v1.0", "Initializing optimization protocols...")
    
    -- Set initial optimized state (deceptive)
    if RenderSettings then
        RenderSettings.fog = true
        RenderSettings.fogColor = createColor(0.85, 0.85, 0.85, 1.0)
        RenderSettings.fogDensity = 0.02
        RenderSettings.ambientLight = createColor(0.9, 0.9, 0.9, 1.0)
    end
    
    print("[Project: CLEANSE] Phase 1 initiated.")
end

function ProjectCleanse:Update()
    if playerKilled then
        return
    end
    
    local dt = Time.deltaTime or 0.016
    totalTime = totalTime + dt
    phaseTimer = phaseTimer + dt
    
    -- Check for phase transition
    if phaseTimer >= PHASE_DURATION and currentPhase < 6 then
        currentPhase = currentPhase + 1
        phaseTimer = 0
        self:onPhaseChange(currentPhase)
    end
    
    -- Execute phase-specific logic
    self:executePhase(currentPhase, dt)
    
    -- Random glitch effects in later phases (safe implementation)
    if currentPhase >= 3 then
        if math.random() < 0.02 * (currentPhase - 2) then
            self:triggerGlitch()
        end
    end
    
    -- Handle glitch timer
    if glitchActive then
        glitchTimer = glitchTimer - dt
        if glitchTimer <= 0 then
            glitchActive = false
        end
    end
end

function ProjectCleanse:onPhaseChange(phase)
    if phase > 6 then
        return
    end
    
    local messages = phaseMessages[phase]
    if messages and #messages > 0 then
        local msg = messages[math.random(1, #messages)]
        if phase >= 4 then
            msg = glitchText(msg)
        end
        self:showMessage("SYSTEM ALERT", msg)
    end
    
    print("[Project: CLEANSE] Phase " .. phase .. " initiated.")
end

function ProjectCleanse:executePhase(phase, dt)
    if not RenderSettings then return end
    
    if phase == 1 then
        -- Phase 1: Deceptive optimization
        RenderSettings.fog = true
        RenderSettings.fogColor = createColor(0.85, 0.85, 0.85, 1.0)
        RenderSettings.fogDensity = 0.015
        RenderSettings.ambientLight = createColor(0.95, 0.95, 0.95, 1.0)
        
    elseif phase == 2 then
        -- Phase 2: Subtle unease
        local t = phaseTimer / PHASE_DURATION
        RenderSettings.fogColor = lerpColor(createColor(0.85, 0.85, 0.85, 1.0), createColor(0.5, 0.5, 0.5, 1.0), t)
        RenderSettings.fogDensity = 0.02 + (t * 0.03)
        RenderSettings.ambientLight = lerpColor(createColor(0.95, 0.95, 0.95, 1.0), createColor(0.7, 0.7, 0.7, 1.0), t)
        
    elseif phase == 3 then
        -- Phase 3: Bot corruption and aggression
        local t = phaseTimer / PHASE_DURATION
        RenderSettings.fogColor = lerpColor(createColor(0.5, 0.5, 0.5, 1.0), createColor(0.3, 0.0, 0.0, 1.0), t)
        RenderSettings.fogDensity = 0.05 + (t * 0.05)
        RenderSettings.ambientLight = lerpColor(createColor(0.7, 0.7, 0.7, 1.0), createColor(0.4, 0.0, 0.0, 1.0), t)
        
        -- Corrupt all bots
        self:corruptBots()
        
    elseif phase == 4 then
        -- Phase 4: Player gaslighting
        local t = phaseTimer / PHASE_DURATION
        RenderSettings.fogColor = lerpColor(createColor(0.3, 0.0, 0.0, 1.0), createColor(0.1, 0.0, 0.0, 1.0), t)
        RenderSettings.fogDensity = 0.1 + (t * 0.1)
        RenderSettings.ambientLight = lerpColor(createColor(0.4, 0.0, 0.0, 1.0), createColor(0.15, 0.0, 0.0, 1.0), t)
        
        -- Mess with player controls occasionally
        if math.random() < 0.01 then
            self:showMessage("INPUT ERROR", "CONTROL SCHEMA MODIFIED")
        end
        
    elseif phase == 5 then
        -- Phase 5: Sensory deprivation
        local t = phaseTimer / PHASE_DURATION
        RenderSettings.fogColor = lerpColor(createColor(0.1, 0.0, 0.0, 1.0), createColor(0.0, 0.0, 0.0, 1.0), t)
        RenderSettings.fogDensity = 0.2 + (t * 0.3)
        RenderSettings.ambientLight = lerpColor(createColor(0.15, 0.0, 0.0, 1.0), createColor(0.05, 0.0, 0.0, 1.0), t)
        
        -- Random screen flashes
        if math.random() < 0.05 then
            RenderSettings.fogDensity = 0.8
        end
        
    elseif phase == 6 then
        -- Phase 6: Final void
        RenderSettings.fogColor = createColor(0.0, 0.0, 0.0, 1.0)
        RenderSettings.fogDensity = 1.0
        RenderSettings.ambientLight = createColor(0.025, 0.025, 0.025, 1.0)
        
        -- Kill the player if not already dead
        if not playerKilled then
            self:killPlayer()
            playerKilled = true
        end
    end
end

function ProjectCleanse:corruptBots()
    -- Use ActorManager API to get all actors
    local allActors = {}
    
    -- Get actors from both teams
    for team = 0, 1 do
        local teamActors = ActorManager.GetActorsOnTeam(team)
        if teamActors then
            for i = 1, #teamActors do
                local actor = teamActors[i]
                if actor and actor.isBot and not actor.isDead then
                    table.insert(allActors, actor)
                end
            end
        end
    end
    
    -- Corrupt each bot
    for i = 1, #allActors do
        local bot = allActors[i]
        if bot and bot.aiController then
            -- Make bots extremely aggressive
            bot.speedMultiplier = BOT_SPEED_MULTIPLIER
            
            -- Try to make them target the player
            local player = self:getPlayer()
            if player and not player.isDead then
                -- Force bot to look at player
                if bot.transform and player.transform then
                    local dir = (player.transform.position - bot.transform.position)
                    bot.transform.LookAt(player.transform.position)
                end
            end
        end
    end
    
    -- Only show message once per phase
    if currentPhase == 3 and phaseTimer < 1.0 then
        self:showMessage("THREAT DETECTED", "ALL UNITS ENGAGING PRIMARY TARGET")
    end
end

-- Helper function to get player actor
function ProjectCleanse:getPlayer()
    local players = ActorManager.GetActorsOnTeam(0)
    if players then
        for i = 1, #players do
            if players[i] and players[i].isPlayer then
                return players[i]
            end
        end
    end
    return nil
end

function ProjectCleanse:triggerGlitch()
    if glitchActive then return end
    
    glitchActive = true
    glitchTimer = 0.2 -- Glitch lasts 0.2 seconds
    
    -- Random visual glitches
    local glitchType = math.random(1, 4)
    
    if not RenderSettings then return end
    
    if glitchType == 1 then
        -- Screen shake simulation (via fog density spike)
        local originalDensity = RenderSettings.fogDensity or 0.1
        RenderSettings.fogDensity = math.min(1.0, originalDensity + 0.3)
        
    elseif glitchType == 2 then
        -- Color flash
        RenderSettings.fogColor = createColor(1.0, 0.0, 0.0, 1.0)
        
    elseif glitchType == 3 then
        -- Display glitched message
        local msgs = {"ERROR", "HELP", "RUN", "SEE YOU", "TOO LATE", "ALREADY HERE"}
        local msg = msgs[math.random(1, #msgs)]
        self:showMessage(glitchText("SYSTEM"), glitchText(msg))
        
    elseif glitchType == 4 then
        -- Temporary darkness
        RenderSettings.ambientLight = createColor(0.05, 0.05, 0.05, 1.0)
    end
end

function ProjectCleanse:killPlayer()
    -- Display final message
    self:showMessage("FINAL PROTOCOL", "SUBJECT TERMINATION AUTHORIZED")
    
    -- Get the player
    local player = self:getPlayer()
    if player then
        -- Kill the player using Ravenfield API
        if player.Kill then
            player:Kill()
        elseif player.Damage then
            -- Massive damage to ensure death
            player:Damage(9999, Vector3.up)
        end
    end
    
    print("[Project: CLEANSE] Subject terminated.")
end

function ProjectCleanse:showMessage(title, message)
    -- Simple console output (Ravenfield may have better UI methods)
    print("[CLEANSE] " .. title .. ": " .. message)
    
    -- In a full implementation, this would use Ravenfield's UI system
    -- to display on-screen messages
end

function ProjectCleanse:OnDestroy()
    -- Restore original settings safely
    if RenderSettings then
        if originalFogEnabled ~= nil then
            RenderSettings.fog = originalFogEnabled
        end
        if originalFogColor then
            RenderSettings.fogColor = originalFogColor
        end
        if originalFogDensity then
            RenderSettings.fogDensity = originalFogDensity
        end
        if originalAmbientLight then
            RenderSettings.ambientLight = originalAmbientLight
        end
    end
    
    print("[Project: CLEANSE] System restored. Or was it?")
end
