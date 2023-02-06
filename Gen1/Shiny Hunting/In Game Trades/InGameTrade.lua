local version = memory.readword(0x14e)
local base_address
local cont=1

input['P1 A'] = false
input['A'] = true
input['B'] = false
input['Down'] = false
input['L'] = false
input['Left'] = false
input['Power'] = false
input['R'] = false
input['Right'] = false
input['Select'] = false
input['Start'] = false
input['Up'] = false

if version == 0xc1a2 or version == 0x36dc or version == 0xd5dd or version == 0x299c then
    print("RBGY JPN game detected")
    base_address = 0xd123
elseif version == 0xe691 or version == 0xa9d then
    print("Red/Blue USA detected")
    base_address = 0xd163
elseif version == 0x7c04 then
    print("Yellow USA detected")
    base_address = 0xd162
elseif version == 0xd289 or version == 0x9c5e or version == 0xdc5c or version == 0xbc2e or version == 0x4a38 or version == 0xd714 or version == 0xfc7a or version == 0xa456 then
    print("Red/Blue EUR detected")
    base_address = 0xd168
elseif version == 0x8f4e or version == 0xfb66 or version == 0x3756 or version == 0xc1b7 then
    print("Yellow EUR detected")
    base_address = 0xd167
else
    print(string.format("Unknown version, code: %4x", version))
    print("Script stopped")
    return
end

local partyno = memory.readbyte(base_address)-1
local dv_addr = (base_address + 0x23) + partyno * 0x2C

function shiny(atkdef,spespc)
    if spespc == 0xAA then
        if atkdef == 0x2A or atkdef == 0x3A or atkdef == 0x6A or atkdef == 0x7A or atkdef == 0xAA or atkdef == 0xBA or atkdef == 0xEA or atkdef == 0xFA then
            return true
        else
            return false
        end
    else
        return false
    end
end

state = savestate.create()
savestate.save(state)

while true do
	
	emu.frameadvance()
	savestate.save(state)
	emu.frameadvance()
	
	local i = 0
	while i < 2200 do 
		emu.frameadvance()
		joypad.set(1,input)
		emu.frameadvance()
		i=i+1
	end
	
	local j = 0
	while j < 200 do 
		emu.frameadvance()
		joypad.set(1, {B=true})
		emu.frameadvance()
		j=j+1
	end
	
	joypad.set(1, {start=true})
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()

	joypad.set(1, {down=true})
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	
	joypad.set(1,input)
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	joypad.set(1,input)
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	joypad.set(1,input)
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()	
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	emu.frameadvance()
	local k = 0
	while k < 500 do 
		emu.frameadvance()
		k=k+1
	end
	

    atkdef = memory.readbyte(dv_addr)
    spespc = memory.readbyte(dv_addr+1)


	
	if shiny(atkdef,spespc) then
        print("Shiny!!! Script stopped.")
        print(string.format("atk: %d", math.floor(atkdef/16)))
        print(string.format("def: %d", atkdef%16))
        print(string.format("spe: %d", math.floor(spespc/16)))
        print(string.format("spe: %d", spespc%16))
        break
    else
		print(string.format("Not shiny... SR: %d - Atk: %d Def: %d Spe: %d Spc: %d",cont, math.floor(atkdef/16), atkdef%16, math.floor(spespc/16), spespc%16))
		cont=cont+1
		savestate.load(state)
    end

	
end
