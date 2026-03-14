-- Low Gravity Mayhem - Ravenfield Mutator Mod
-- A fun mutator that reduces gravity for chaotic moon-jumping gameplay!

behaviour("LowGravityMayhem")

local GRAVITY_SCALE = 0.3  -- Moon-like gravity
local JUMP_MULTIPLIER = 1.8 -- Extra jump height

function LowGravityMayhem:Start()
    print("[Low Gravity Mayhem] Mod activated!")

    -- Store original gravity value
    self.originalGravity = Physics.gravity.y

    -- Apply low gravity globally
    Physics.gravity = Vector3(0, -9.81 * GRAVITY_SCALE, 0)
end

function LowGravityMayhem:Update()
    -- Continuously ensure gravity stays low
    if Physics.gravity.y > -9.81 * GRAVITY_SCALE * 1.1 then
        Physics.gravity = Vector3(0, -9.81 * GRAVITY_SCALE, 0)
    end
end

function LowGravityMayhem:OnDestroy()
    -- Restore normal gravity when mod is removed
    if self.originalGravity then
        Physics.gravity = Vector3(0, self.originalGravity, 0)
    end
    print("[Low Gravity Mayhem] Normal gravity restored.")
end
