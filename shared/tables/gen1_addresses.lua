-- shared/tables/gen1_addresses.lua
-- Canonical Generation 1 memory map and version auto-detector for VBA-M
-- Values independently cross-verified against Real96/PokeLua and zep715/rbylua.

local gen1 = {}

local REGIONS = {
    -- Japanese ROMs
    [0xc1a2] = { name = "Japan Red",     lang = "JPN", party = 0xd12b, slots = 0xd123, dvs = 0xcfd8, fish = 0xd036, tid = 0xd2d8 },
    [0x36dc] = { name = "Japan Green",   lang = "JPN", party = 0xd12b, slots = 0xd123, dvs = 0xcfd8, fish = 0xd036, tid = 0xd2d8 },
    [0xd5dd] = { name = "Japan Blue",    lang = "JPN", party = 0xd12b, slots = 0xd123, dvs = 0xcfd8, fish = 0xd036, tid = 0xd2d8 },
    [0x299c] = { name = "Japan Yellow",  lang = "JPN", party = 0xd12b, slots = 0xd123, dvs = 0xcfd8, fish = 0xd036, tid = 0xd2d8 },
    -- USA ROMs
    [0xe691] = { name = "USA Red",       lang = "USA", party = 0xd16b, slots = 0xd163, dvs = 0xcff1, fish = 0xd059, tid = 0xd359 },
    [0x0a9d] = { name = "USA Blue",      lang = "USA", party = 0xd16b, slots = 0xd163, dvs = 0xcff1, fish = 0xd059, tid = 0xd359 },
    [0x7c04] = { name = "USA Yellow",    lang = "USA", party = 0xd16a, slots = 0xd162, dvs = 0xcff0, fish = 0xd058, tid = 0xd358 },
    -- European ROMs
    [0xd289] = { name = "EUR Red (EN)",  lang = "EUR", party = 0xd170, slots = 0xd168, dvs = 0xcff6, fish = 0xd05e, tid = 0xd35e },
    [0x9c5e] = { name = "EUR Blue (EN)", lang = "EUR", party = 0xd170, slots = 0xd168, dvs = 0xcff6, fish = 0xd05e, tid = 0xd35e },
    [0xdc5c] = { name = "EUR Red (FR)",  lang = "EUR", party = 0xd170, slots = 0xd168, dvs = 0xcff6, fish = 0xd05e, tid = 0xd35e },
    [0xbc2e] = { name = "EUR Blue (FR)", lang = "EUR", party = 0xd170, slots = 0xd168, dvs = 0xcff6, fish = 0xd05e, tid = 0xd35e },
    [0x4a38] = { name = "EUR Red (DE)",  lang = "EUR", party = 0xd170, slots = 0xd168, dvs = 0xcff6, fish = 0xd05e, tid = 0xd35e },
    [0xd714] = { name = "EUR Blue (DE)", lang = "EUR", party = 0xd170, slots = 0xd168, dvs = 0xcff6, fish = 0xd05e, tid = 0xd35e },
    [0xfc7a] = { name = "EUR Red (ES)",  lang = "EUR", party = 0xd170, slots = 0xd168, dvs = 0xcff6, fish = 0xd05e, tid = 0xd35e },
    [0xa456] = { name = "EUR Blue (ES)", lang = "EUR", party = 0xd170, slots = 0xd168, dvs = 0xcff6, fish = 0xd05e, tid = 0xd35e },
    [0x8f4e] = { name = "EUR Yellow (EN)",lang = "EUR", party = 0xd16f, slots = 0xd167, dvs = 0xcff5, fish = 0xd05d, tid = 0xd35d },
    [0xfb66] = { name = "EUR Yellow (FR)",lang = "EUR", party = 0xd16f, slots = 0xd167, dvs = 0xcff5, fish = 0xd05d, tid = 0xd35d },
    [0x3756] = { name = "EUR Yellow (DE)",lang = "EUR", party = 0xd16f, slots = 0xd167, dvs = 0xcff5, fish = 0xd05d, tid = 0xd35d },
    [0xc1b7] = { name = "EUR Yellow (ES)",lang = "EUR", party = 0xd16f, slots = 0xd167, dvs = 0xcff5, fish = 0xd05d, tid = 0xd35d },
}

function gen1.detect()
    local version = memory.readword(0x14e)
    local entry = REGIONS[version]
    if not entry then
        return nil, string.format("Unknown Gen1 ROM header sum: 0x%04X", version)
    end
    return entry, nil
end

function gen1.is_shiny(atkdef, spespc)
    if spespc == 0xAA then
        if atkdef == 0x2A or atkdef == 0x3A or atkdef == 0x6A or atkdef == 0x7A or
           atkdef == 0xAA or atkdef == 0xBA or atkdef == 0xEA or atkdef == 0xFA then
            return true
        end
    end
    return false
end

return gen1