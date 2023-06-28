//General Settings\\
SWEP.Category = "WWII TTT Weapons"
SWEP.Kind = WEAPON_HEAVY
SWEP.HoldType = "ar2"
SWEP.Base = "weapon_tttbase"
SWEP.Spawnable = true
SWEP.AutoSpawnable = true
SWEP.AdminSpawnable = true
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Icon = "VGUI/ttt/R_Icon_FG42"

//Serverside Settings\\
if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
	resource.AddFile("materials/VGUI/ttt/R_Icon_FG42.vmt")
end

//Clientside Settings\\
if ( CLIENT ) then
	SWEP.PrintName = "FG-42"			
	SWEP.Author	= "Syntax_Error752 and Adapted by Focus and Royal"
	SWEP.ViewModelFOV = 60
	SWEP.Slot = 2
end
	
//Sounds and Models\\
SWEP.ViewModel = "models/weapons/v_mp33.mdl"
SWEP.WorldModel = "models/weapons/w_mp33.mdl"
local FireSound 		= Sound ("weapons/fg42_fire.wav");
local ReloadSound		= Sound ("weapons/fg42_reload.wav");
SWEP.IronSightsPos 		= Vector (-3.315, -5.7, 1.55)
SWEP.ViewModelFlip = false
SWEP.Weight = 5

//Damage Statistics\\
SWEP.Primary.Recoil = 1.5
SWEP.Primary.Damage = 15
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.05
SWEP.Primary.ClipSize = 20
SWEP.Primary.Delay = 0.15
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

//Functions\\
function SWEP:Reload()
	if (self.Weapon:Clip1() < 20) then
	
		if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
		
			self.Weapon:EmitSound( ReloadSound )
		end
		
		self.Weapon:DefaultReload( ACT_VM_RELOAD );
		
		self:SetIronsights( false )
	end
end

function SWEP:PrimaryAttack()

	self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	
	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	if ( !self:CanPrimaryAttack() ) then return end
	
	self.Weapon:EmitSound( FireSound )
	
	self:ShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self.Primary.Cone )
	
	self:TakePrimaryAmmo( 1 )
	
	if ( self.Owner:IsNPC() ) then return end
	
	self.Owner:ViewPunch( Angle( math.Rand(-0.2,-0.1) * self.Primary.Recoil, math.Rand(-0.1,0.1) *self.Primary.Recoil, 0 ) )
	
	if ( (game.SinglePlayer() && SERVER) || CLIENT ) then
		self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() )
	end
	
end