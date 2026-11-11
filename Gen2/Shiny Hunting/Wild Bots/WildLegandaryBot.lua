
local atkdef
local spespc
local enemy_addr
local cont=1

local ruta=1 

local version = memory.readbyte(0x141)
local region = memory.readbyte(0x142)

if version == 0x54 then
    --catch_flag = 0xc10a
    if region == 0x44 or region == 0x46 or region == 0x49 or region == 0x53 then
        print("EUR Crystal detected")
        enemy_addr = 0xd20c
    elseif region == 0x45 then
        print("USA Crystal detected")
        enemy_addr = 0xd20c
    elseif region == 0x4A then
        print("JPN Crystal detected")
        enemy_addr = 0xd23d
    end
elseif version == 0x55 or version == 0x58 then
    --catch_flag = 0xc00a
    if region == 0x44 or region == 0x46 or region == 0x49 or region == 0x53 then
        print("EUR Gold/Silver detected")
        enemy_addr = 0xd0f5
    elseif region == 0x45 then
        print("USA Gold/Silver detected")
        enemy_addr = 0xd0f5
    elseif region == 0x4A then
        print("JPN Gold/Silver detected")
        enemy_addr = 0xd0e7
    elseif region == 0x4B then
        print("KOR Gold/Silver detected")
        enemy_addr = 0xd1b2
    end
else
    print(string.format("Unknown version, code: %4x", version))
    print("Script stopped")
    return
end

local dv_flag_addr = enemy_addr + 0x21
local battle_flag_addr = enemy_addr + 0x22

function shiny(atkdef,spespc)
    if spespc == 0xAA then
        if atkdef == 0x2A or atkdef == 0x3A or atkdef == 0x6A or atkdef == 0x7A or atkdef == 0xAA or atkdef == 0xBA or atkdef == 0xEA or atkdef == 0xFA then
            return true
        end
    end
    return false
end

function press(button, delay)
    i = 0
    while i < delay do
        joypad.set(1, button)
        i = i + 1
        emu.frameadvance()
    end
end

print("Searching for the legendary beast...")
local state = savestate.create()
local shinystate = savestate.create()
while true do
	
	savestate.save(state)
	
	press({start = true}, 10); press({start = false}, 10)
    for i=0,2,1
    do
        press({down = true}, 3); press({down = false}, 10)
    end
	press({A = true}, 10); press({A = false}, 10)
	press({A = true}, 10); press({A = false}, 10)
	press({A = true}, 10); press({A = false}, 10)
	press({A = true}, 10); press({A = false}, 10)
	press({A = true}, 10); press({A = false}, 10)
	press({A = true}, 10); press({A = false}, 10)
	press({B = true}, 10); press({B = false}, 10)
	press({B = true}, 10); press({B = false}, 10)
	press({B = true}, 10); press({B = false}, 10)
	press({B = true}, 10); press({B = false}, 10)
	press({B = true}, 10); press({B = false}, 10)
	
	
    for i=0,15,1
    do
        press({left = true}, 10); press({left = false}, 10)
    end
	press({up = true}, 10); press({up = false}, 10)
	
	savestate.save(shinystate)
	while memory.readbyte(battle_flag_addr) == 0 do
        -- Move back and fourth until encounter
        press({left = true}, 10); press({left = false}, 10)
        press({right = true}, 10); press({right = false}, 10)
    end
	
	if memory.readbyte(battle_flag_addr) == 122 then
		savestate.load(state)
		
		print(string.format("Cambio de ruta: %d", ruta))
		ruta=ruta+1;
		
	else
		savestate.load(shinystate)
		
		    while memory.readbyte(dv_flag_addr) ~= 0x01 do
                emu.frameadvance()
            end
            atkdef = memory.readbyte(enemy_addr)
            spespc = memory.readbyte(enemy_addr + 1)

		if shiny(atkdef, spespc) then
			print("Shiny!!! Script stopped.")
			print(string.format("atk: %d", math.floor(atkdef/16)))
			print(string.format("def: %d", atkdef%16))
			print(string.format("spe: %d", math.floor(spespc/16)))
			print(string.format("spe: %d", spespc%16))
			break
		else
			print(string.format("Seen: %d -Atk: %d Def: %d Spe: %d Spc: %d", cont, math.floor(atkdef/16), atkdef%16, math.floor(spespc/16), spespc%16))
			cont = cont + 1
		end
    end

end
