function widget:GetInfo()
  return {
    name      = "SpringTanks | game message displays",
    desc      = "display game messages",
    author    = "knorke",
    date      = "Jan 16, 2011",
    license   = "horses. horses everywhere.",
    layer     = -3,		--iam 12 and whats this
    enabled   = true 	--  loaded by default?
  }
end

include "tp_clickbuttons.lua"

local glText           = gl.Text
local gameframe = 0
local localplayerID = Spring.GetMyPlayerID () --Spring.GetLocalTeamID()
---
local msgbox = {}
local scoretable = {}
local isTeamgame = false	--if there is one or more allyteams with multiple players, the scoretable has to show allyscore
local gametimelimitf = 0
local gametime = 0			--als min:sec (countdown)

score = {}			--[teamid]=punkte, wie in der game logic
local scoredisplay = {}		--[linenumber oder so] = "message" mit farbe usw. wie es dann angezeigt wird.  scoredisplay.names  scoredisplay.scores
local modOptions = Spring.GetModOptions()

---icons---
local icon_flagpickup  = ":n:"..LUAUI_DIRNAME.."Images/flagpickup.png"
local icon_flagscore = ":n:"..LUAUI_DIRNAME.."Images/flagscore.png"
local icon_flagreturn  = ":n:"..LUAUI_DIRNAME.."Images/flagreturn.png"
local icon_flag = ":n:"..LUAUI_DIRNAME.."Images/flagreturn.png"

function widget:Initialize()
	if (Spring.IsReplay ()==true or Spring.GetSpectatingState() == true ) then	
		localplayerID = Spring.GetTeamList()[1] --***just get any teamid so that messages are shown in replays and for specs
	end
	--Spring.SendCommands ("resbar 0")
	Spring.Echo ("tp_scoredisplay Initialize()")
	msgbox.x = 0.65
	msgbox.y = 0.95
	msgbox.w = 0.35
	msgbox.h = 0.2
	msgbox.textsize = 0.02
	msgbox.messages = {}	
	scoretable.names = {}
	scoretable.names.x=0.65
	scoretable.names.y=0.75
	scoretable.names.w=0.35
	scoretable.names.h=0.1
	scoretable.names.messages = {}
	scoretable.names.textsize=0.02
	scoretable.scores = {}
	scoretable.scores.x=0.95
	scoretable.scores.y=0.75
	scoretable.scores.w=0.35
	scoretable.scores.h=0.1
	scoretable.scores.messages = {}
	scoretable.scores.textsize=0.02
	addmessage (msgbox,"Welcome. Welcome at all.")
	--addmessage (scoretable.names,"pimmelmann")
	--decided if its a teamgame or not
	local allys = Spring.GetAllyTeamList ()
	for _,allyid  in ipairs (allys) do
		local nteams = #Spring.GetTeamList (allyid)
		if (nteams > 1) then isTeamgame = true end
	end
	gametimelimitf = (modOptions.gametimelimit or 10) * 60 * 30
end

function widget:GameFrame(f)
gameframe = f
if (f%30==0) then gametime = frame2time (gametimelimitf-f) end
--if (f%60==0) then addmessage ("random crap" .. f .."-".. math.random(9000)..math.random(9000)) end
end

function widget:DrawScreen()	
	drawmessagebox(msgbox, 5)
	drawscoretable()
	drawrespawntimer()
	drawgametimer ()
	if (resultText) then
		uiText (resultText, 0.25, 0.42, 0.05, "vo")
	end
end

function drawrespawntimer ()
	timeleft = 30-((gameframe/30))%30
	local center = 0.825 --0.9
	local p = ((30-timeleft)/30)*0.175
	gl.Color (1-(timeleft/60),(timeleft/30),0,1)
	--gl.Color ((timeleft/30),1-(timeleft/60),0,1)
	uiRect (center-p, 0.94,  center+p, 0.99)
	gl.Color (1,1,1,1)
	uiText ("Squad Respawn: ", 0.65, 0.96,0.02, "vo")
	timeleft=math.floor(timeleft)
	if (timeleft < 10) then timeleft=" " .. timeleft end
	uiText (timeleft, center, 0.965, 0.04, "vo")
end

function drawgametimer ()
	--local textstyle = "vO"
	--if ((gametimelimitf-gameframe)%15 ==0) then textstyle = "vO" end
	uiText ("Game Time: " .. gametime, 0.7, 0.78, 0.02, "vo")
end


function addgameeventmessage (text)
	--text=text:gsub('<TEAM(%d+)>', function(id) return (Spring.GetPlayerInfo(tonumber(id))) end)      --ging mal	
	text=text:gsub('<TEAM(%d+)>', teamid_to_playername)
	local newmessage = {}	
	newmessage.frame = gameframe
	newmessage.bgcolor = {0,0,0.8,0.5}
	if (text:find("returned" ,1,true)) then		
		newmessage.bgcolor = {0.5,0.5,0,1}
		newmessage.icon = icon_flagreturn
		text=string.sub(text, 0, string.find(text, " ")) --cut message to player name
	end
	if (text:find("picked up" ,1,true)) then 
		newmessage.bgcolor = {0.5,0,0,0.5}
		newmessage.icon = icon_flagpickup
		text=string.sub(text, 0, string.find(text, " ")) --cut message to player name
	end
	if (text:find("scored" ,1,true)) then
		newmessage.bgcolor = {0,0,0.8,0.5}
		newmessage.icon = icon_flagscore
		text=string.sub(text, 0, string.find(text, " ")) --cut message to player name
	end	
	newmessage.text = text
	table.insert (msgbox.messages, newmessage)
end


function teamid_to_playername (teamID)
	local _, uplayer, _, isAiTeam = Spring.GetTeamInfo(teamID)
	local playername = "unknown playername"
	if (isAiTeam == true) then
		local _, skirmishAIID, name, hostingPlayerID, shortName, version = Spring.GetAIInfo(teamID)  --Spring.GetAIInfo(uplayer) 
		--playername = "BOT_" .. name .. skirmishAIID .."_"..shortName ..hostingPlayerID
		playername = "(AI)" .. skirmishAIID
	end
	if (isAiTeam == false) then playername = Spring.GetPlayerInfo(uplayer) or 'GetPlayerInfo fail' end
	--Spring.Echo ("<PLAYER0> did something")
	--Spring.SendMessage ("<PLAYER0>")
	return playername
end

function frame2time (frame)
	if (frame < 0) then return "finished" end
	local h = math.floor((frame /30) /3600)
	local min =  math.floor (((frame/30)/60)%60)
	local sec = math.floor((frame/30) %60)
	if (min <10) then min ="0" .. min end
	if (sec <10) then sec ="0" .. sec end
	if (h > 0) then 
		return  h ..":" .. min .. ":" .. sec
	else
		return min .. ":" .. sec
	end
end

---SCORE---
function set_score_from_s (s)
     --t = {}
     --s = "from=world, to=Lua"
    for k, v in string.gmatch(s, "TEAMSCORE(%d+)=(%d+)") do
      --Spring.Echo ("k:" .. k .. "v=" .. v)
	  score[tonumber (k)] = tonumber(v)
	end	
end

function update_display_scoretable ()
	--if (score~=nil) then Spring.Echo ("score gibts") end
	scoretable.names.messages = {}
	scoretable.scores.messages = {}
	local allys = Spring.GetAllyTeamList ()
	for _,allyid  in ipairs (allys) do
		--Spring.Echo ("ALLYID: " .. allyid)
		local teams = Spring.GetTeamList (allyid)
		local nteams = table.getn(teams)
		--Spring.Echo ("--n teams: " ..nteams)
		
		if (isTeamgame==true) then
			if (nteams > 1) then		--add up the scores if an allyteam has multiple members
				local allyscore = 0
				for _,teamid  in ipairs (teams) do
					if (score[teamid]~=nil) then allyscore=allyscore+ score[teamid] end
				end
				if (allyscore or 0 > 0) then
					addmessage (scoretable.names, " TEAM " ..getAllyTeamName (allyid).."")
					addmessage (scoretable.scores, "*".. allyscore .."*")
				end
			else
				--if (allyscore or 0 > 0) then
					addmessage (scoretable.names, "   ")
					addmessage (scoretable.scores, "   ")
				--end
			end
		end
		
		for ti = 1,#teams do
			local teamid = teams[ti]
			local name = teamid_to_playername(teamid)-- .. "|"..teamid.."|"..(score[teamid] or 88)
			local teamscore = score[teamid] or 0
			if (teamscore>0) then
			--Spring.Echo (" teamid:" .. teamid .. " name:" .. name .. " score: " .. teamscore)
				addmessage (scoretable.names, name,{Spring.GetTeamColor (teamid)})
				addmessage (scoretable.scores, teamscore, {Spring.GetTeamColor (teamid)})
			end
		end
	end
end

function show_score_console ()
	Spring.Echo ("***SCORE TABLE***")
	for teamid,_  in pairs (score) do
		Spring.Echo ("WIDGET" .. teamid .. ")" .. teamid_to_playername(teamid).. ":" .. score[teamid])
	end
	--Spring.Echo ("score als string:" .. score_string ())
end


function drawscoretable ()
	drawmessagebox (scoretable.names,60)
	drawmessagebox (scoretable.scores,60)	
end

-------
function widget:RecvLuaMsg(msg, playerID)
	-- ("RecvLuaMsg:" .. msg)
	--local s = "\255"..string.char(R0)..string.char(G255)..string.char(B255)
	--Spring.Echo (s)
	if (playerID ~= localplayerID) then return end		--only show every message once
	
	luamsgpre = "tpMSGBOX"
	luascoremsgpre ="tpSCORE"
	luaresultmsgpre = "tpRESULT" -- *1* *2* etc, 1,2 sind die winner
	if (msg:find(luamsgpre,1,true)) then
		addgameeventmessage (msg:sub(#luamsgpre+1) )
	end
	
	if (msg:find(luascoremsgpre,1,true)) then
		msg = msg:sub(#luascoremsgpre+1)		
		set_score_from_s (msg)
		update_display_scoretable ()
		--show_score_console ()
	end
	
	if (msg:find(luaresultmsgpre,1,true)) then
		--Did I win?
		local s = "*" .. Spring.GetLocalTeamID () .. "*"
		Spring.Echo ("luaresultmsgpre im widget:" .. msg .." s:" .. s)
		if (msg:find("DRAW",1,true)) then 
			resultText = "nobody wins."
		else
			if (msg:find(s,1,true)) then 
				resultText = "YOU HAVE WON!"
			else
				resultText = "you lost."
			end
		end
	end
end


function GameMessage (msg)
	Spring.Echo ("GameMessage:" .. msg)
end

function getAllyTeamName (allyID)
if (allyID==0) then return "Horses" end
if (allyID==1) then return "Lolcats" end
if (allyID==2) then return "Watwatwat" end
if (allyID==3) then return "Sky Lovers" end
if (allyID==4) then return "Elephant Riders" end
if (allyID==5) then return "Peace Sellers" end
if (allyID==6) then return "knorke's fanclub" end
if (allyID==7) then return "Soapmakers" end
if (allyID==8) then return "Nazi Squid" end
if (allyID==8) then return "Magic Unicorns" end
if (allyID==9) then return "Boxed Rapid" end
if (allyID==10) then return "Hotstepper" end
if (allyID==11) then return "Barbie&Friends" end
if (allyID==13) then return "Breadfan" end
if (allyID==14) then return "Naked Unicorns" end
if (allyID==15) then return "Trollercoaster" end
if (allyID==16) then return "FlaggedasSpammers" end
if (allyID==17) then return "RollingFungi" end
if (allyID==18) then return "Wheelz of Steelz" end
if (allyID==19) then return "Wild Horses" end
if (allyID==20) then return "Waka Waka" end
if (allyID==21) then return "Sticky Pants" end
if (allyID==22) then return "Coon&Friends" end
if (allyID==23) then return "Goatsegaitors" end
if (allyID==24) then return "Choire Invisible" end
if (allyID==25) then return "Goatsegaitors" end
if (allyID==26) then return "Diamond Dolphins" end
return allyID
end