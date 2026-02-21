Include("\\script\\global\\login_head.lua")
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua");

function LoginMessage()
	local nLevel = GetLevel();
	if (nLevel == 1) then
		Msg2Player("<color=green>Chµo mõng <color=yellow>"..GetName().."<color> ®· ®Õn víi thÕ giíi Vâ L©m TruyÒn Kú")
	end
	
	if (nLevel > 1) then
		Msg2Player("<color=green>Server cµy cuèc giµnh cho c¸c b¹n ®am mª game VLTK phiªn b¶n HKMP. Chóc c¸c b¹n cã nhiÒu søc khoÎ vµ cã nh÷ng gi©y phót th­ gi·n vui vÎ trong game.")
	end
	if GetTask(5751) == 0 then 
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,1266,0,0,0}, nBindState=-2,nExpiredTime=43200}, "test", 1);
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,438,0,0,0}, nBindState=-2,nExpiredTime=43200}, "test", 1);
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,4851,0,0,0}, nBindState=-2}, "test", 1);
	SetTask(5751,1)
	end
end

if login_add then login_add(LoginMessage, 1) end