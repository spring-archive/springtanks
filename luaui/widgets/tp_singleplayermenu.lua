--+++!!! gucken ob es die map gibt:
--if VFS.FileExists("maps/"..ModSpecific.MapsList[m].ExternalFileName) then

function widget:GetInfo()
	return {
		name = "Springtanks | Singleplayer Selector",
		desc = "allows to chose some matches when you run over spring.exe",
		author = "knorke",
		version = "1",
		date = "Jan 2011",
		license = "Public Domain",
		layer = 10,
		enabled = true,
		--handler = true, -- To see the real widgetHandler --the wat?
	}
end
---speed ups by magic---
local glText           = gl.Text
------------------------------
local menu=true--	--menu zeug anzeigen oder nicht
local buttons={} --eine buttons list fürs menu
local gameover_buttons={} --werden nur gemalt wenn gameover ist
local vsx, vsy = widgetHandler:GetViewSizes()
local active_button = -1 --6
local gameframe=0
local missions = {} --.name .briefing .map .mapfn
selected_missionid = 2
luamsgpre = "tpMSGBOX"
local gfx_buttons={}
gfx = {}
local pixelsclicked=0
local isgameover=false
local gfxFallTimer = 0 --wird in widget:update hochgezählt um dt
local missionSucess = {} --["missionName] true/nil
local missionSucessCounter = 0 --how many missions are completed
gfx[20]={1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,1,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1}
gfx[19]={0,0,1,1,1,1,0,0,1,0,0,1,1,1,1,1,0,0,1,0,0,1,1,1,1,1,0,0,1,1,0,0,1,1,0,0,0,1,1,1,0,0,1,0,0,1,1,1,1,0,0,1}
gfx[18]={0,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,0,0,1,0,0,1,1,1,1,1,0,0,1,1,0,0,1,1,0,0,0,0,1,1,0,0,1,0,0,1,1,1,1,1,1,1}
gfx[17]={1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,1,0,0,1,0,0,1,0,0,1,1,1,0,0,0,0}
gfx[16]={1,1,1,1,1,1,0,0,1,0,0,1,1,1,1,1,1,1,1,0,0,1,1,1,0,0,1,1,1,1,0,0,1,1,0,0,1,1,0,0,0,0,1,0,0,1,1,1,1,0,0,1}
gfx[15]={0,0,1,1,1,1,0,0,1,0,0,1,1,1,1,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,0,0,1,1,0,0,1,1,1,0,0,0,1,0,0,1,1,1,1,0,0,1}
gfx[14]={1,0,0,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,1,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1}
gfx[13]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
gfx[12]={0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,1,1,0,0,0,0,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0}
gfx[11]={0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,1,1,0,0,0,1,1,1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,0,1,1,0,0,0,0,1,1,0,0,0,0}
gfx[10]={0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,1,1,0,0,1,1,1,1,0,0,1,1,0,1,1,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0}
gfx[9] ={0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0}
gfx[8] ={0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,0,1,1,0,0,1,1,1,1,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0}
gfx[7] ={0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,1,0,0,0,1,1,1,0,1,1,0,0,0,1,1,0,0,1,1,0,0,0,0,1,1,0,0,0,0}
gfx[6] ={0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,1,0,0,0,0,1,1,0,1,1,0,0,0,0,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0}
gfx[5] ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
gfx[4] ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,1,0,0,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,0}
gfx[3] ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,1,1,0,0,0,0,0,1,1,0,0,1,0,1,0,1,0,1,0,1,0,0,0,1,1,0,0,1,1,0,0}
gfx[2] ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,0,0,1,0,1,0,1,1,1,0}
gfx[1] ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

function widget:DrawScreen()
	if (menu==true) then 
		black()		
		draw_buttons(gfx_buttons)
		drawmenu()
	end
	if (isgameover==true and not menu) then draw_buttons(gameover_buttons) end
end

function widget:Initialize()	
	--if (Spring.GetModOptions()["gametimelimit"] and #Spring.GetPlayerList()>1) then --was Spring.GetModOptions()["gametimelimit"]
	if ((Spring.GetModOptions()["gametimelimit"] or not Spring.GetModOptions()["spmenu"]) and #Spring.GetPlayerList()>1) then
		Spring.Echo("singleplayermenu removed because multiplayer")
		widgetHandler:RemoveWidget() --Disable the menu in multiplayer games
	end
	--add_button (gameover_buttons, 0.3, 0.1, 0.4, 0.1, "Click here for Single Player Menu", "button_reopenmenu", {0,0.1,1,0.4})	
	menu = decide_to_show_menu ()	
	add_mission ("Tank TV", "Missions\\startscript_tv.txt", "Spectate a game of AI players", "Eye of Horus v2", "Eye_Of_Horus_v2.sd7")
	add_mission ("Sand Thyphoon Duel", "Missions\\startscript_horus.txt", "Are your tactics advanced enough?", "Eye of Horus v2", "Eye_Of_Horus_v2.sd7")
	add_mission ("Whitewater Wrestle", "Missions\\startscript_aqua.txt", "Leave Atlantis, escape the sea", "Aquatic_Divide_TNM05-V2", "Aquatic_Divide_TNM05-V2.sd7")
	--add_mission ("On The Fucking Moon", "Missions\\startscript_moon.txt", "I cant believe we gonna be playing on the fucking moon!", "MoonQ20x", "MoonQ20x.sd7")
	add_mission ("In The Fucking Desert", "Missions\\startscript_desert.txt", "I cant believe we gonna be playing in a fucking desert!", "DesertCliffsV1", "DesertCliffsV1.sd7")
	add_mission ("Into Battle", "Missions\\startscript_intobatte.txt", "Grab your lazer.", "Into Battle_v3", "Into Battle_v3.sd7")
	add_mission ("Castle Clash", "Missions\\startscript_castle.txt", "Impossible to break these walls. Or is it?", "Castles", "Castles.sdz")
	add_mission ("Super Dust Bowl", "Missions\\startscript_dust.txt", "A four player super smash fest.", "Mount DustMore v3", "MountDustmoreV3.sd7")
	
	add_button (buttons, 0.4, 0.1, 0.25, 0.1, "Start selected Game", "button_start", {0,1,1,0.4})
	add_button (buttons, 0.4, 0.05, 0.25, 0.03, "Quit", "button_quit", {1,0,0,0.4})
	readMissionSucess ()
	missionSucessCounter = countCompletedMissions()
	add_button (buttons, 0, 0.05, 0.25, 0.03, "Completed challenges: " .. missionSucessCounter, "text_missioncounter", {1,1,0,0.4})
	make_gfx_buttons(gfx)
	if (menu) then Spring.SendLuaUIMsg (luamsgpre .. "Select a Match!") end
end

function widget:ViewResize(viewSizeX, viewSizeY)
	vsx = viewSizeX
	vsy = viewSizeY	
end

function widget:MousePress(x,y,button)
	if (isgameover==true) then 
		cb = clicked_button (gameover_buttons)		
		if (cb=="button_reopenmenu") then isgameover=false menu_on () end
		return		--damit man nicht auf die unsichtbaren menu button klicken wenn gameover ist
	end
	
	if (not menu) then return end
		local cb = clicked_button (buttons)
		if (missions[cb]) then		
		selected_missionid = cb		
	end
	if (cb=="button_start") then
		mapexits = VFS.FileExists("maps\\"..missions[selected_missionid].mapfn)		
		if (mapexits==false) then Spring.Echo ("map not found!") Spring.SendLuaUIMsg (luamsgpre .. "Map not found: Get the mappack!")  return end
		restart_spring (missions[selected_missionid].startscript_fn)
	end
	local _, cbi = clicked_button (gfx_buttons)
	if (cbi) then 
		pixelsclicked=pixelsclicked+1
		if (pixelsclicked==1) then eastereggfound = true Spring.SendLuaUIMsg (luamsgpre .. "Archivement: Click a pixel") end
		if (pixelsclicked==10) then eastereggfound = true Spring.SendLuaUIMsg (luamsgpre .. "Archivement: Start Painting") end
		if (pixelsclicked==15 and missionSucessCounter > 2) then eastereggfound = true Spring.SendLuaUIMsg (luamsgpre .. "Archivement: Liquify!") end
		if (pixelsclicked==40) then eastereggfound = true Spring.SendLuaUIMsg (luamsgpre .. "Archivement: Casual Gamer") end
		if (pixelsclicked==80) then eastereggfound = true Spring.SendLuaUIMsg (luamsgpre .. "Archivement: Master Painter") end
		if (pixelsclicked==200) then eastereggfound = true Spring.SendLuaUIMsg (luamsgpre .. "Archivement: SRSBSNSS") end
		if gfx_buttons[cbi].text == " " then 
			gfx_buttons[cbi].color = {1,1,0,1} 
			gfx_buttons[cbi].text = "  "  
			gfx[gfx_buttons[cbi].name.y][gfx_buttons[cbi].name.x]=0
			return 
		end
		if gfx_buttons[cbi].text == "  " then 
			gfx_buttons[cbi].color = {1,0,0,1} 
			gfx_buttons[cbi].text = " " 
			gfx[gfx_buttons[cbi].name.y][gfx_buttons[cbi].name.x]=1
			return 
		end
	end
	if (cb=="button_quit") then Spring.SendCommands ("quit") end
end

function widget:KeyPress(key)
	local up_arrow,down_arrow,right_arrow,left_arrow,enter,space,esc,del,tab = 273,274,275,276,13,32,27,127,9
	if key==esc then
		local _,cmd=Spring.GetActiveCommand()
		local alt,ctrl,meta,shift=Spring.GetModKeyState()
		if not alt and not ctrl and not meta and not shift and not cmd then
		if (menu==true) then menu_off() return end
		if (menu==false) then menu_on() return end
		end
	end
end

function widget:GameFrame (frame)
	gameframe=frame
	--wiggleButtons (buttons)	
end

function widget:Update(dt)
	gfxFallTimer=gfxFallTimer+dt
	if (menu and pixelsclicked > 15 and missionSucessCounter > 1 and gfxFallTimer > 0.1) then gfxFallTimer =0 gfxFall () end	
end

function black()--***
	gl.Color (0,0,0,1)
	uiRect (0,0,1,1)
end

function drawmenu ()	
	draw_buttons (buttons)
	drawmissiondetails (selected_missionid)
end

function drawmissiondetails (missionid)
if (missions[missionid]) then
	uiText ("Selected: " .. missions[missionid].name, 0.2, 0.36, 0.02, 'o')
	uiText ("Briefing: " .. missions[missionid].briefing, 0.2, 0.32, 0.02, 'o')
	uiText ("Map: " .. missions[missionid].map, 0.2, 0.28, 0.02, 'o')
	local s = "No"
	if (missionSucess[missions[missionid].name] == true) then s = "Yes" end	
	uiText ("Won: " .. s, 0.2, 0.24, 0.02, 'o')
	end
end

--UI coordinaten zu scalierten screen koordinaten
function sX (uix)
	return uix*vsx
end
function sY (uiy)
	return uiy*vsy
end
---...und andersrum!
function uiX (sX)
	return sX/vsx
end
function uiY (sY)
	return sY/vsy
end
----zeichen funktionen
function uiRect (x,y,x2,y2)
	gl.Rect (sX(x), sY(y), sX(x2), sY(y2))
end

function uiText (text, x,y,s,options)
	if (text==" " or text=="  ") then return end --archivement: unlock +20 fps
	glText (text, sX(x), sY(y), sX(s), options)
end
-----------
-----message boxxy-----
function drawmessagebox (msgbox, msg_n)
	local yoff = msgbox.textsize
	local start = #msgbox.messages-msg_n+1
	if (start < 1) then start = 1 end	
	local fade = 1
	for i =  start, #msgbox.messages , 1 do
		drawmessage (msgbox.messages[i],  msgbox.x,  msgbox.y-yoff, msgbox.textsize)
		yoff=yoff+msgbox.textsize*1.1
	end
end

--msgbox.bla sollte hier drin nicht vorkommen
function drawmessage (message, x, y, s)	
	--if (message.bgcolor) then 
--		gl.Color (unpack(message.bgcolor)) 
		--uiRect (x,y+s/2, x+msgbox.w,y-s/2)
	--end	
	--gl.Color (0, 0.5, 0.5, 0.5)
	--uiRect (x,y+s/2, x+msgbox.w,y-s/2)
	offx=0
	if (message.frame) then		
		glText (frame2time (message.frame), sX(x+offx), sY(y), sX(s/2), 'vo')
		offx=offx+(2*s)
	end	
	glText (message.text, sX(x+offx), sY(y), sX(s), 'vo')	
end

function addmessage (msgbox, text)
	local newmessage = {}
	--newmessage.frame = gameframe
	newmessage.bgcolor = {0,0,0.8,0.5}
	newmessage.text = text
	table.insert (msgbox.messages, newmessage)
end
-------message boxxy end------
------BUTTONS------
function draw_buttons (b)
local mousex, mousey = Spring.GetMouseState()
for i = 1, #b, 1 do	
	if (b[i].color) then gl.Color (unpack(b[i].color)) else gl.Color (1 ,0,0,1) end
	if (point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  uiX(mousex), uiY(mousey)) or i == active_button) then
		gl.Color (1,1,0.5,0.8)
	end
	if (b[i].name == selected_missionid) then gl.Color (0,1,1,0.9) end --highlight selected mission, bit unnice this way w/e
	uiRect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h)
	uiText (b[i].text, b[i].x, b[i].y+b[i].h/2,  0.02, 'vo')
	end
end

function add_button (buttonlist, x,y, w, h, text, name, color)
local new_button = {}
new_button.x=x new_button.y=y new_button.w=w new_button.h=h new_button.text=text new_button.name=name
if(color) then new_button.color=color end
table.insert (buttonlist, new_button)
end

function previous_button ()
active_button = active_button -1
if (active_button < 1) then active_button = #buttons end
end

function next_button ()
active_button = active_button +1
if (active_button > #buttons) then active_button = 1 end
end

function point_in_rect (x1, y1, x2, y2, px, py)
	if (px > x1 and px < x2 and py > y1 and py < y2) then return true end
	return false
end

function clicked_button (b)
local mx, my,click = Spring.GetMouseState()
local mousex=uiX(mx)
local mousey=uiY(my)
for i = 1, #b, 1 do	
	if (click == true and point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  mousex, mousey)) then return b[i].name, i end
	--if (mouse_was_down == false and click == true and point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  mousex, mousey)) then mouse_was_down = true end
	end
--keyboard:
--if (enter_was_down and active_button > 0 and active_button < #buttons+1) then enter_was_down = false return b[active_button].name, active_button end
return "NOBUTTONCLICKED"
end
-------------------
function menu_on ()
	Spring.SendCommands("pause 1")
	menu=true
	readMissionSucess ()
	missionSucessCounter = countCompletedMissions()	
	for i = 1, #buttons, 1 do	
		if (buttons[i].name == "text_missioncounter") then buttons[i].text = "Completed challenges: " .. missionSucessCounter end
	end	
end

function menu_off()
	Spring.SendCommands("pause 0")
	menu=false
end


--das mit id statt table.insert muss sein damit die id immer gleicht bleibt und man es mit den
--buttons verknüpfen kann
function add_mission (name, startscript_fn, briefing, map, mapfn)
	local missions_n = #missions
	local id = #missions +1
	missions [id] = {}
	missions [id].name = name
	missions [id].startscript_fn = startscript_fn
	missions [id].briefing = briefing
	missions [id].map = map
	missions [id].mapfn = mapfn
	local h = 0.05
	local c = {0.4, 0.4, 0.4, 0.4}
	if (missionSucess[name] == true) then c= {0,1,0,0.4} name=name.. " *WIN*" end
	add_button (buttons, 0.39, 0.9-id*h, 0.26, h, name, id, c)
end

function readMissionSucess ()
	fh = io.open("springtanks_mission_sucess.txt","r")
	if (fh) then
		while true do
			line = fh.read(fh)
			if not line then break end
			missionSucess[line] = true
		end
		fh:close()
	else
		missionSucess = {}
	end	
end

function countCompletedMissions()
	local c = 0
	for i = 1, #missions, 1 do
		if (missionSucess[missions[i].name]) then c = c +1 end
	end
	return c
end

--function add_button (buttonlist, x,y, w, h, text, name, color)
function make_gfx_buttons (gfx)
	gfx_buttons = {} --nicht jedes mal löschen...***
	local offx=0.01
	local offy=0.45
	local a = 0.007
	for yi = 1, #gfx, 1 do
		for xi = 1, #gfx[yi], 1 do
			local x=offx+  (xi*a)
			local y=offy+ (yi*a*3)
			local c = " "
			local color = {1,0.5,0.5,1}
			if (gfx[yi][xi]==1) then color = {1,0,0,1} c=" " else color = {1,1,0,1} c="  " end
			add_button (gfx_buttons, x, y, a,a*3, c,({x=xi,y=yi,}) ,  color)
		end
	end
end

-----RESTART SPRING STUFF----------
function restart_spring (startscriptfilename)
	local file=VFS.LoadFile(startscriptfilename)
	Spring.Echo ("file:" .. file)
	file = string.gsub(file,"GameType=[^;]*;","GameType=".. Game.modName ..";",1) --replace GameType=   with modname  by zwszg
	 --file = assert(io.open("list.txt", "r"))
	Spring.Restart("-s", file)
end

function wiggleButtons (b)
	--if (not normalButtons) then normalButtons = b end
	for i = 1, #b, 1 do	
		b[i].x =  0.5+(math.sin (gameframe/i)/5)
		b[i].y =  0.5+(math.cos (gameframe/i)/5)
	end
end

function decide_to_show_menu ()
	if (Spring.GetModOptions()["gametimelimit"]) then return false end
	return true
end

function widget:RecvLuaMsg(msg, playerID)	
	luamsgpre = "tpMSGBOX"
	luascoremsgpre ="tpSCORE"
	luaresultmsgpre = "tpRESULT" -- *1* *2* etc, 1,2 sind die winner
	if (msg:find("The game has ended!",1,true)) then
		if (isgameover==false) then add_button (gameover_buttons, 0.3, 0.1, 0.4, 0.1, "Click here for Single Player Menu", "button_reopenmenu", {0,0.1,1,0.4}) end
		isgameover=true		
	end
	
	if (msg:find(luaresultmsgpre,1,true)) then
		--Did I win?
		local s = "*" .. Spring.GetLocalTeamID () .. "*"
		Spring.Echo ("luaresultmsgpre im widget:" .. msg .." s:" .. s)		
		if (msg:find(s,1,true)) then
			writeMissionSucess()
		end
	end
	
end

function writeMissionSucess()
	local modOptions = Spring.GetModOptions()
	missionName = modOptions.missionname
	if (missionName) then
		Spring.Echo ("missionName:" ..missionName)
		file = io.open ("springtanks_mission_sucess.txt", "a")
		if (file== nil) then Spring.Echo ("ERROR: could not open springtanks_mission_sucess.txt for writing!") return end
		file:write ("\n" .. missionName)
		file:flush()
		file:close ()
	end
end

function gfxFall ()
	for u = 0,1,1 do
		for yi = 1,#gfx, 1 do
		for xi = 2+u, #gfx[yi]-1, 2 do
				if (yi > 1 and gfx[yi][xi]==1) then					
					if (gfx[yi-1][xi]==0) then --drunter leer -> falle runter
						gfx[yi-1][xi]=1
						gfx[yi][xi]=0
					else						
						if (yi < #gfx and gfx[yi+1][xi]==1) then --was oben drauf? rutsche links/rechts weg
							local g = 1 - (2* math.random(0,1))
							if     (gfx[yi][xi+g]==0) then
								gfx[yi][xi+g]=1
								gfx[yi][xi]=0
							elseif (gfx[yi][xi-g]==0) then
								gfx[yi][xi-g]=1
								gfx[yi][xi]=0
							end
						end
					end				
				end
			end
		gfx[yi][1] = 0
		gfx[yi][#gfx[yi]] = 0
		end	
	end	
	make_gfx_buttons(gfx)
end