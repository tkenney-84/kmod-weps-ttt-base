-- Variables that are used on both client and server
SWEP.Gun = ("m9k_aw50") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Sniper Rifles"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "AI AW50"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 4				-- Slot in the weapon selection menu
SWEP.SlotPos				= 50			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.XHair					= false		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.BoltAction				= true		-- Is this a bolt action rifle?
SWEP.HoldType 				= "rpg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_aw50_awp.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_acc_int_aw50.mdl"	-- Weapon world model
SWEP.Base 				= "core_kttt_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

-- TTT Required Variables
SWEP.Kind = WEAPON_EQUIP1											-- SWEP.Kind determines what slot the weapon is to take up.
SWEP.AmmoEnt = "none"									-- SWEP.AmmoEnt determines the ammo pickup that will feed this gun.
SWEP.Icon = "vgui/ttt/"..SWEP.Gun..".vmt"							-- SWEP.Icon is the path to the icon for the weapon (when investigating bodies and such).
print("vgui/ttt/"..SWEP.Gun..".vmt")
if SERVER then														-- Adds the icon file to the servers resources.
	resource.AddFile("materials/vgui/ttt/"..SWEP.Gun..".vmt")
end
SWEP.CanBuy = { ROLE_TRAITOR, ROLE_DETECTIVE }													-- SWEP.CanBuy is an array of roles who can purchase this weapon with credits.
--SWEP.InLoadoutFor = nil												-- SWEP.InLoadoutFor is an array of roles who start with this weapon.
SWEP.LimitedStock = true											-- SWEP.LimitedStock determines whether this SWEP can only be bought once a round.
SWEP.EquipMenuData = {											-- The information on the credit menu.
	type = "The AWP",
	desc = "Ready to blow a crater size hole in someones head?"
};
SWEP.AllowDrop = true												-- SWEP.AllowDrop determines whether you can drop this weapon or not.
--SWEP.IsSilent = false												-- SWEP.IsSilent determines whether a person will yell when killed with this weapon or not.
--SWEP.NoSights = false												-- SWEP.NoSights determines whether a player cannot or can use iron sights with this weapon.
SWEP.AutoSpawnable = false											-- SWEP.AutoSpawnable determines whether this weapon will randomly spawn on the map or not.
--SWEP.WeaponID = nil												-- SWEP.WeaponID is for base TTT weapons only and should not be used.
-- End TTT Required Variables

SWEP.Primary.Sound			= Sound("Weaponaw50.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 50		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ScopeZoom			= 9	
SWEP.Secondary.UseACOG			= false -- Choose one scope type
SWEP.Secondary.UseMilDot		= false	-- I mean it, only one	
SWEP.Secondary.UseSVD			= false	-- If you choose more than one, your scope will not show up at all
SWEP.Secondary.UseParabolic		= true	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	
SWEP.Secondary.UseAimpoint		= false
SWEP.Secondary.UseMatador		= false

SWEP.data 				= {}
SWEP.data.ironsights		= 1
SWEP.ScopeScale 			= 0.7
SWEP.ReticleScale 			= 0.6

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 95	--base damage per bullet
SWEP.Primary.Spread		= .01	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .0001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(3.68, 0, 1.08)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(3.68, 0, 1.08)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 2.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)

if GetConVar("M9KDefaultClip") == nil then
	print("M9KDefaultClip is missing! You may have hit the lua limit!")
else
	if GetConVar("M9KDefaultClip"):GetInt() != -1 then
		SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * GetConVar("M9KDefaultClip"):GetInt()
	end
end

if GetConVar("M9KUniqueSlots") != nil then
	if not (GetConVar("M9KUniqueSlots"):GetBool()) then 
		SWEP.SlotPos = 2
	end
end