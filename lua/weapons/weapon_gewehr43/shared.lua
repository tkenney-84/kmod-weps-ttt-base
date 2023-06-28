//General Settings\\
SWEP.Category = "WWII TTT Weapons"
SWEP.Kind = WEAPON_HEAVY
SWEP.HoldType = "ar2"
SWEP.Base = "weapon_tttbase"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AutoSpawnable = true
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Icon = "VGUI/ttt/R_Icon_Gewehr43"

//Serverside Settings\\
if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
	resource.AddFile("materials/VGUI/ttt/R_Icon_Gewehr43.vmt")
end

//Clientside Settings\\
if ( CLIENT ) then
	SWEP.PrintName = "Gewehr 43"			
	SWEP.Author	= "Syntax_Error752 and Adapted by Focus and Royal"
	SWEP.ViewModelFOV = 50
	SWEP.Slot = 2
end

//Sounds and Models\\
SWEP.ViewModel = "models/weapons/v_k9g.mdl"
SWEP.WorldModel = "models/weapons/w_k9g.mdl"
local FireSound 		= Sound ("weapons/gewehr43_fire.wav");
local ReloadSound		= Sound ("weapons/gewehr43_reload.wav");
SWEP.IronSightsPos 		= Vector (-6.65, -10, 3.85)
SWEP.ViewModelFlip = false
SWEP.Weight = 5

//Damage Statistics\\
SWEP.Primary.Recoil = 2.1
SWEP.Primary.Damage = 32
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.02
SWEP.Primary.ClipSize = 10
SWEP.Primary.Delay = 0.9
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

//Functions\\
function SWEP:Reload()
	if (self.Weapon:Clip1() < 10) then
	
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