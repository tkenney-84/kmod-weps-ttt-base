-- Variables that are used on both client and server
SWEP.Gun = ("m9k_vector") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Submachine Guns"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "KRISS Vector"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 58			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "smg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_kriss_svs.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_kriss_vector.mdl"	-- Weapon world model
SWEP.Base				= "core_kttt_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

-- TTT Required Variables
SWEP.Kind = WEAPON_HEAVY											-- SWEP.Kind determines what slot the weapon is to take up.
SWEP.AmmoEnt = "item_ammo_smg1_ttt"									-- SWEP.AmmoEnt determines the ammo pickup that will feed this gun.
SWEP.Icon = "vgui/ttt/"..SWEP.Gun..".vmt"							-- SWEP.Icon is the path to the icon for the weapon (when investigating bodies and such).
print("vgui/ttt/"..SWEP.Gun..".vmt")
if SERVER then														-- Adds the icon file to the servers resources.
	resource.AddFile("materials/vgui/ttt/"..SWEP.Gun..".vmt")
end
--SWEP.CanBuy = nil													-- SWEP.CanBuy is an array of roles who can purchase this weapon with credits.
--SWEP.InLoadoutFor = nil												-- SWEP.InLoadoutFor is an array of roles who start with this weapon.
--SWEP.LimitedStock = false											-- SWEP.LimitedStock determines whether this SWEP can only be bought once a round.
--SWEP.EquipMenuData = {											-- The information on the credit menu.
--	type = "Weapon",
--	desc = "Example custom weapon."
--};
SWEP.AllowDrop = true												-- SWEP.AllowDrop determines whether you can drop this weapon or not.
--SWEP.IsSilent = false												-- SWEP.IsSilent determines whether a person will yell when killed with this weapon or not.
--SWEP.NoSights = false												-- SWEP.NoSights determines whether a player cannot or can use iron sights with this weapon.
SWEP.AutoSpawnable = true											-- SWEP.AutoSpawnable determines whether this weapon will randomly spawn on the map or not.
--SWEP.WeaponID = nil												-- SWEP.WeaponID is for base TTT weapons only and should not be used.
-- End TTT Required Variables

SWEP.Primary.Sound			= Sound("kriss_vector.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 1000			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 50		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 18	-- Base damage per bullet
SWEP.Primary.Spread		= .026	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .014 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(3.943, -0.129, 1.677)
SWEP.IronSightsAng = Vector(-1.922, 0.481, 0)
SWEP.SightsPos = Vector(3.943, -0.129, 1.677)
SWEP.SightsAng = Vector(-1.922, 0.481, 0)
SWEP.RunSightsPos = Vector(-3.701, -6.064, -0.551)
SWEP.RunSightsAng = Vector(-4.685, -62.559, 9.093)



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