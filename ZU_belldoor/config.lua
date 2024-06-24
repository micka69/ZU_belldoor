Config = {}

Config.Doorbells = {
    ['police'] = {
        {
            coords = vector3(441.13, -981.92, 30.69),
            label = "Sonnette du commissariat",
            job = "police"
        },
    },
    ['ambulance'] = {
        {
            coords = vector3(298.89, -584.51, 43.26),
            label = "Sonnette de l'hôpital",
            job = "ambulance"
        },
    },
    -- Ajoutez d'autres jobs et sonnettes ici
}

Config.NotificationDuration = 5000 -- Durée de la notification en ms

Config.DoorbellSound = "doorbell-sound"  -- Nom du fichier son sans extension
Config.DoorbellVolume = 0.5  -- Volume du son (0.0 à 1.0)