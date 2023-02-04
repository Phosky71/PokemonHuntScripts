local atkdef
local spespc
local cont = 1

local base_address
local version = memory.readbyte(0x141)
local region = memory.readbyte(0x142)
if version == 0x54 then
    if region == 0x44 or region == 0x46 or region == 0x49 or region == 0x53 then
        print("EUR Crystal detected")
        base_address = 0xd20c
    elseif region == 0x45 then
        print("USA Crystal detected")
        base_address = 0xd20c
    elseif region == 0x4A then
        print("JAP Crystal detected")
        base_address = 0xd23d
    end
elseif version == 0x55 or version == 0x58 then
    if region == 0x44 or region == 0x46 or region == 0x49 or region == 0x53 then
        print("EUR Gold/Silver detected")
        base_address = 0xd0f5
    elseif region == 0x45 then
        print("USA Gold/Silver detected")
        base_address = 0xd0f5
    elseif region == 0x4A then
        print("JPN Gold/Silver detected")
        base_address = 0xd0e7
    elseif region == 0x4B then
        print("KOR Gold/Silver detected")
        base_address = 0xd1b2
    end
else
    print(string.format("Unknown version, code: %4x", version))
    print("Script stopped")
    return
end

local dv_flag_addr = base_address + 0x21


function shiny(atkdef,spespc)
    if spespc == 0xAA then
        if atkdef == 0x2A or atkdef == 0x3A or atkdef == 0x6A or atkdef == 0x7A or atkdef == 0xAA or atkdef == 0xBA or atkdef == 0xEA or atkdef == 0xFA then
            return true
        end
    end
    return false
end
 
local j = 0
local k = 0
local state = savestate.create()
while true do

	emu.frameadvance()
	savestate.save(state)
	emu.frameadvance()
	
	j = 0
	while j < 60 do 
		emu.frameadvance()
		joypad.set(1, {up=true})
		j=j+1
	end
	
	k = 0
	while k < 1600 do 
		emu.frameadvance()
		joypad.set(1, {A=true})
		k=k+1
	end

    atkdef = memory.readbyte(base_address)
    spespc = memory.readbyte(base_address + 1)

    if shiny(atkdef, spespc) then
        print("Shiny Suicune!")
		print(string.format("Atk: %d Def: %d Spe: %d Spc: %d", math.floor(atkdef/16), atkdef%16, math.floor(spespc/16), spespc%16))
		print (os.date ("%c")) --> 25/04/07 10:10:05
		print(cont)
        break
    else
		print(string.format("Not shiny... - Atk: %d Def: %d Spe: %d Spc: %d", math.floor(atkdef/16), atkdef%16, math.floor(spespc/16), spespc%16))
		print(cont)
		cont = cont +1
        savestate.load(state)
    end
    emu.frameadvance()
    emu.frameadvance()
end
