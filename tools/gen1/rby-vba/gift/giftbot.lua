-- tools/gen1/rby-vba/gift/giftbot.lua
-- Gen1 gift/starter shiny hunter.
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

local base_address = entry.slots
local atkdef
local spespc
local cont = 1

local size = memory.readbyte(base_address) - 1
local dv_addr = (base_address + 0x23) + size * 0x2C

local state = savestate.create()
savestate.save(state)

while true do
    emu.frameadvance()
    savestate.save(state)
    local i = 0
    while i < 20 do
        joypad.set(1, {A = true})
        vba.frameadvance()
        i = i + 1
    end

    atkdef = memory.readbyte(dv_addr)
    spespc = memory.readbyte(dv_addr + 1)

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