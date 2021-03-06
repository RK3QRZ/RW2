private ["_veh","_vehName","_vehVarname","_completeText","_reward"];

smRewards =
[
	["То-199 «Неофрон» (штурмовик)", "O_Plane_CAS_02_F"],
	["А-164 «Вайпаут» (штурмовик)", "B_Plane_CAS_01_F"],
	["A-143 «Буззард» (штурмовик)", "I_Plane_Fighter_03_CAS_F"],
	["MQ4A «Грейхок»", "B_UAV_02_F"],
	["Ми-48 «Кайман»", "O_Heli_Attack_02_black_F"],
	["AH-99 «Блэкфут»", "B_Heli_Attack_01_F"],
	["ПО-30 «Касатка»", "O_Heli_Light_02_F"],
	["WY-55 «Хеллкэт»", "I_Heli_light_03_F"],
	["FV-720 «Мора»", "I_APC_tracked_03_cannon_F"],
	["AFV-4 «Горгона»", "I_APC_Wheeled_03_cannon_F"],
	["IFV-6a «Гепард»", "B_APC_Tracked_01_AA_F"],
	["T-100 «Варсук»", "O_MBT_02_cannon_F"],
	["MBT-52 «Кума»", "I_MBT_03_cannon_F"],
	["M2A4 «Сламмер» UP ", "B_MBT_01_TUSK_F"]
];
smMarkerList =
["smReward1","smReward2","smReward3","smReward4","smReward5","smReward6","smReward7","smReward8","smReward9","smReward10","smReward11","smReward12","smReward13","smReward14","smReward15","smReward16","smReward17","smReward18","smReward19","smReward20","smReward21","smReward22","smReward23","smReward24","smReward25","smReward26","smReward27"];

_veh = smRewards call BIS_fnc_selectRandom;

_vehName = _veh select 0;
_vehVarname = _veh select 1;

_completeText = format[
"<t align='center'><t size='2.2'>Допзадание</t><br/><t size='1.5' color='#08b000'>ВЫПОЛНЕНО</t><br/>____________________<br/>Так держать! Такими темпами осталось ещё не долго ждать прежде чем враг будет полностью подавлен под натиском наших войск.<br/><br/>В награду, мы отправляем вам на базу %1.<br/><br/Возвращайтесь к основному заданию; генштаб оповестит о новых заданиях по ходу текущей разведки. До связи в ближайшее время!</t>",_vehName];

_reward = createVehicle [_vehVarname, getMarkerPos "smReward1",smMarkerList,0,"NONE"];
waitUntil {!isNull _reward};

_reward setDir 284;

{
	_x addCuratorEditableObjects [[_reward], false];
} foreach adminCurators;

GlobalHint = _completeText; publicVariable "GlobalHint"; hint parseText _completeText;
showNotification = ["CompletedSideMission", sideMarkerText]; publicVariable "showNotification";
showNotification = ["Reward", format["Ваша команда получила %1", _vehName]]; publicVariable "showNotification";
