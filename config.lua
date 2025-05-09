Config        = {}
Config.Locale = 'sv'

Config.VehicleSpawnpoint = { x = -491.98, y = -334.74, z = 34.37, h = 180.19}
Config.MSPos = { x = -496.72, y = -335.57, z = 34.5}
-- Ped list ---- https://wiki.gtanet.work/index.php?title=Peds
Config.Zones = {

    MissionStarter = {
        Marker  = {
            DrawD    = 20.0, 
            Size    = {x = 1.0, y = 1.0, z = 1.0},
            Type    = 23,
            Opacity = 150,
            Color   = {r = 0, g = 169, b = 100}
        },
        Blip = {
            Coords  = vector3(Config.MSPos.x, Config.MSPos.y, Config.MSPos.z),
            Sprite  = 403,
            Display = 4,
            Scale   = 1.0,
            Colour  = 2,
            Name    = 'Medicines Transport'
        },
        Pos     = Config.MSPos,
        text    = '[~g~G~w~] Transport Medicines',
    },
}