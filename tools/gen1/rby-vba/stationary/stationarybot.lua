-- tools/gen1/rby-vba/stationary/stationarybot.lua
-- Gen1 stationary shiny hunter (Snorlax, Zapdos, Articuno, Moltres, Mewtwo,
-- Electrode/Voltorb in Power Plant).
-- Refactored by PokemonHuntScripts: version detection moved into
-- shared/tables/gen1_addresses.lua (single source of truth).

local gen1 = require("shared.tables.gen1_addresses")

local entry, err = gen1.detect()
if not entry then
    print(err)
    print("Script stopped")
    return
end
print(string.format("%s detected", entry.name))

local flag_addr = 0xc027
local base_address = entry.dvs
local atkdef
local spespc
local cont = 1

local state = savestate.create()
savestate.save(state)

while true do
    joypad.set(1, {A = true})
    emu.frameadvance()

    atkdef = 0
    spespc = 0
    savestate.save(state)

    while memory.readbyte(flag_addr) ~= 0xf0 do
        joypad.set(1, {A = false})
        vba.frameadvance()
        atkdef = memory.readbyte(base_address)
        spespc = memory.readbyte(base_address + 1)
    end

    if gen1.is_shiny(atkdef, spespc) then
        print("Shiny!!! Script stopped.")
        print(string.format("Atk: %d", math.floor(atkdef / 16)))
        print(string.format("Def: %d", atkdef % 16))
        print(string.format("Spe: %d", math.floor(spespc / 16)))
        print(string.format("Spc: %d", spespc % 16))
        savestate.save(state)
        break
    else
        print(string.format("Not shiny... SR: %d - Atk: %d Def: %d Spe: %d Spc: %d",
            cont, math.floor(atkdef / 16), atkdef % 16,
            math.floor(spespc / 16), spespc % 16))
        cont = cont + 1
        savestate.load(state)
    end
end