private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CSAT"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "CSAT"]] call _fnc_saveToTemplate;

["flag", "Flag_CSAT_F"] call _fnc_saveToTemplate;
["flagTexture", "A3\Data_F\Flags\Flag_CSAT_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CSAT"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "O_T_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_T_East_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_T_CSAT_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["Atlas_O_W_Quadbike_01_F"]] call _fnc_saveToTemplate;

private _lightUnarmed = ["Atlas_O_W_MRAP_02_F"];
private _lightArmed = ["Atlas_O_W_MRAP_02_gmg_F", "Atlas_O_W_MRAP_02_hmg_F"];
if (_hasApex) then {
    _lightUnarmed pushBack "Atlas_O_W_LSV_02_unarmed_F";
    _lightArmed append ["Atlas_O_W_LSV_02_AT_F", "Atlas_O_W_LSV_02_armed_F"];
};
["vehiclesLightUnarmed", _lightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _lightArmed] call _fnc_saveToTemplate;

["vehiclesTrucks", ["Atlas_O_W_Truck_03_covered_ghex_F", "Atlas_O_W_Truck_03_transport_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["Atlas_O_W_Truck_02_cargo_F", "Atlas_O_W_Truck_02_flatbed_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["Atlas_O_W_Truck_03_ammo_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["Atlas_O_W_Truck_03_repair_ghex_F", "Atlas_O_W_Truck_02_box_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["Atlas_O_W_Truck_02_fuel_F", "Atlas_O_W_Truck_03_fuel_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["Atlas_O_W_Truck_03_medical_ghex_F", "Atlas_O_W_Truck_02_medical_F"]] call _fnc_saveToTemplate;
private _lightAPCs = ["Atlas_O_W_APC_Wheeled_02_rcws_v2_ghex_F"];
private _apcs = ["O_T_APC_Tracked_02_cannon_ghex_F", "Atlas_O_W_APC_Wheeled_02_rcws_v2_ghex_F"];
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesAirborne", ["Atlas_O_W_APC_Wheeled_02_rcws_v2_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["Atlas_O_W_APC_Wheeled_02_rcws_v2_ghex_F"]] call _fnc_saveToTemplate;
private _tanks = ["Atlas_O_W_MBT_02_cannon_ghex_F"];
["vehiclesAA", ["Atlas_O_W_APC_Tracked_02_AA_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_T_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["O_T_Boat_Armed_01_hmg_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["Atlas_O_W_Plane_CAS_02_dynamicLoadout_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["O_T_Plane_Fighter_02_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["O_T_Plane_Transport_01_infantry_ghex_F", "O_T_VTOL_02_infantry_dynamicLoadout_F"]] call _fnc_saveToTemplate;


private _lightHelicopters = ["Atlas_O_W_Heli_Light_02_unarmed_F", "O_T_Heli_Transport_04_bench_F"];
private _transportHelicopters = ["Atlas_O_W_Heli_Light_02_unarmed_F"];

if (_hasHelicopters) then {
    _lightHelicopters pushBack "O_T_Heli_Transport_04_bench_F";
    _transportHelicopters = ["O_T_Heli_Transport_04_covered_F", "O_T_Heli_Transport_04_bench_F"]; 
};

["vehiclesHelisLight", _lightHelicopters] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _transportHelicopters] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["Atlas_O_W_Heli_Light_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["Atlas_O_W_Heli_Attack_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["O_T_MBT_02_arty_ghex_F", "O_T_Truck_02_MRL_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["O_T_Truck_02_MRL_F", ["12Rnd_230mm_rockets"]],
["O_T_MBT_02_arty_ghex_F",["32Rnd_155mm_Mo_shells_O"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["O_T_UAV_04_CAS_F"]] call _fnc_saveToTemplate;
private _uavsPortable = if (_hasWs) then {["Aegis_O_T_UAV_02_lxWS", "O_T_UAV_01_F"]} else {["O_T_UAV_01_F"]};
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["Atlas_O_W_MRAP_02_hmg_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["Atlas_O_W_Truck_02_F", "Atlas_O_W_Truck_02_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["Atlas_O_W_MRAP_02_F"]] call _fnc_saveToTemplate;
private _militiaAPCs = [];

private _policeVehs = if (_hasContact) then {
    ["B_GEN_Offroad_01_covered_F", "B_GEN_Offroad_01_comms_F", "B_GEN_Offroad_01_gen_F"]
} else {
    ["B_GEN_Offroad_01_gen_F"]
};

["vehiclesPolice", _policeVehs] call _fnc_saveToTemplate;

["staticMGs", ["Atlas_O_W_HMG_01_high_F", "Atlas_O_W_HMG_01_high_F", "Atlas_O_W_HMG_01_high_F", "Atlas_O_W_GMG_01_high_F"]] call _fnc_saveToTemplate;
["staticATs", ["O_T_Static_AT_F"]] call _fnc_saveToTemplate;
["staticAAs", ["O_T_Static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["O_T_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "O_T_Radar_System_02_F"] call _fnc_saveToTemplate;
["vehicleSam", "O_T_SAM_System_04_F"] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;


["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

if (_hasTanks) then {
    _tanks = [
        "Atlas_O_W_MBT_02_cannon_ghex_F",
        "Atlas_O_W_MBT_02_cannon_ghex_F",
        "Atlas_O_W_MBT_02_cannon_ghex_F",
        "Atlas_O_W_MBT_02_cannon_ghex_F",
        "O_T_MBT_04_cannon_F", 
        "O_T_MBT_04_command_F"
    ];
};

if (_hasWs) then {
    _lightAPCs pushBack "O_T_APC_Wheeled_02_hmg_lxWS";
    _militiaAPCs = ["O_T_APC_Wheeled_02_hmg_lxWS"];
    _apcs pushBack "Atlas_O_W_APC_Tracked_02_30mm_lxWS";
};

["vehiclesLightAPCs", _lightAPCs] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", _militiaAPCs] call _fnc_saveToTemplate;
["vehiclesTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesAPCs", _apcs] call _fnc_saveToTemplate;

#include "Aegis_Vehicle_Attributes.sqf"

["animations", [
    ["O_T_MBT_04_command_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3]],
    ["O_T_MBT_04_cannon_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3]],
    ["Atlas_O_W_MBT_02_cannon_ghex_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3, "showLog", 0.4]],
    ["O_T_APC_Wheeled_02_hmg_lxWS", ["mg_hide_armor_front",0.3,"mg_hide_armor_rear",0.3,"mg_Hide_Rail",0.3,"showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["O_APC_Wheeled_02_unarmed_lxWS", ["showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["Atlas_O_W_APC_Wheeled_02_rcws_v2_ghex_F", ["showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["Atlas_O_W_LSV_02_armed_F", ["Unarmed_Doors_Hide",0.3]],
    ["Atlas_O_W_LSV_02_unarmed_F", ["Unarmed_Doors_Hide",0.3]],
    ["Atlas_O_W_LSV_02_AT_F", ["Unarmed_Doors_Hide",0.3]],
    ["O_T_APC_Tracked_02_cannon_ghex_F", ["showTracks",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["Atlas_O_W_APC_Tracked_02_30mm_lxWS", ["showTracks",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["Atlas_O_W_APC_Tracked_02_AA_F", ["showTracks",0.3,"showCamonetHull",0.3,"showCamonetTurret",0.3,"showSLATHull",0.3]]
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

private _chVoices = ["Male01CHI","Male02CHI","Male03CHI"];
private _chFaces = ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"];

["sfVoices", _chVoices] call _fnc_saveToTemplate;
["sfFaces", _chFaces] call _fnc_saveToTemplate;
["eliteVoices", _chVoices] call _fnc_saveToTemplate;
["eliteFaces", _chFaces] call _fnc_saveToTemplate;

["voices", ["Male01POL", "Male02POL", "Male03POL"]] call _fnc_saveToTemplate;
["faces", [
    "LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4",
    "LivonianHead_5", "LivonianHead_6", "LivonianHead_7", "LivonianHead_8",
    "LivonianHead_9", "LivonianHead_10",
    "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04",
    "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_10", "WhiteHead_11",
    "WhiteHead_13", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18",
    "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"
]] call _fnc_saveToTemplate;

["insignia", ["CSAT_Patch", "CSAT_BearRegiment", ""]] call _fnc_saveToTemplate;
["sfInsignia", ["CSAT_DragonRegiment"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["designatedGrenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", [
["launch_RPG32_camo_F", "", "", "", ["RPG32_F", "RPG32_F","RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F","RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F","RPG32_HE_F"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HEAT"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT","Titan_AT","Titan_AP"], [], ""],
["launch_O_Titan_short_camo_F", "", "acc_pointer_IR", "", ["Titan_AT","Titan_AT","Titan_AP"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_olive_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", ["hgun_Rook40_F"]];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade_Guer", "HandGrenade_East"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["officerUniforms", ["Atlas_U_O_W_OfficerUniform", "Atlas_U_O_Luchnik_Officer_whex_F"]];
_loadoutData set ["officerVests", ["V_Rangemaster_belt_khk"]];
_loadoutData set ["officerHats", ["H_MilCap_whex_F", "H_Beret_CSAT_01_F"]];

_loadoutData set ["traitorUniforms", ["Opf_U_I_I_Uniform_01_ghex_F"]];
_loadoutData set ["traitorVests", ["V_TacVest_grn"]];
_loadoutData set ["traitorHats", ["H_Cap_ghex_F", "H_Cap_grn", "H_Bandanna_khk"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["B_Carryall_owcamo"]];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_whex_F"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_CSAT_01_F", "H_MilCap_whex_F"]];
_loadoutData set ["sniHats", ["H_Booniehat_whex_F", "H_Booniehat_whex_hs_F"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

_loadoutData set ["glasses", [
    "G_Aviator",
    "G_Cigarette",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Shades_Yellowred",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack"
]];
_loadoutData set ["goggles", ["G_Lowprofile"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["Atlas_U_O_CombatFatigues_mhex_F", "Atlas_U_O_CombatFatigues_mhex_02_F"]];
_sfLoadoutData set ["vests", ["Atlas_V_OCarrierRig_CQB_blk_F", "Atlas_V_OCarrierRig_Lite_blk_F"]];
_sfLoadoutData set ["glVests", ["Atlas_V_OCarrierRig_CQB_blk_F", "Atlas_V_OCarrierRig_Lite_blk_F", "Atlas_V_OCarrierRig_GL_blk_F"]];
_sfLoadoutData set ["backpacks", ["B_FieldPack_blk", "B_Carryall_blk", "B_Kitbag_blk"]];
_sfLoadoutData set ["helmets", ["Atlas_H_HelmetCCH_cover_mhex_F", "H_HelmetSpecter_black_headset_F", "H_Booniehat_blk", "H_Bandanna_gry"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_02"]];
_sfLoadoutData set ["NVGs", ["O_NVGoggles_blk_F"]];
_sfLoadoutData set ["slHat", ["lxWS_H_Bandanna_blk_hs"]];
_sfLoadoutData set ["sniHats", ["H_Booniehat_blk"]];

_sfLoadoutData set ["slRifles", [
["arifle_ARX_blk_F", "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"], ["10Rnd_50BW_Mag_F"], ""],
["arifle_ARX_blk_F", "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"], ["10Rnd_50BW_Mag_F"], ""],
["arifle_ARX_blk_F", "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"], ["10Rnd_50BW_Mag_F"], ""],
["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_CTARS_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTARS_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTARS_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];

_sfLoadoutData set ["machineGuns", [
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""]
]];

private _marksmanRifles = [
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_NVS", [], [], ""],
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_KHS_blk", [], [], ""],
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_Arco_blk_F", [], [], ""],
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_DMS", [], [], ""],
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_SOS", [], [], ""]
];

if (_hasMarksman) then {
    _marksmanRifles append [
        ["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_Nightstalker", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_Arco_blk_F", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_KHS_blk", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"]
    ];
};

_sfLoadoutData set ["marksmanRifles", _marksmanRifles];
_sfLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_KHS_blk", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Rook40_F", "muzzle_snds_L", "", "", [], [], ""]
]];


/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["Atlas_U_O_W_CombatUniform_owcamo"]];
_eliteLoadoutData set ["vests", ["Atlas_V_OCarrierRig_Lite_whex_F", "Atlas_V_OCarrierRig_CQB_WHex_F"]];
_eliteLoadoutData set ["glVests", ["Atlas_V_OCarrierRig_Lite_whex_F", "Atlas_V_OCarrierRig_CQB_WHex_F","Atlas_V_OCarrierRig_GL_whex_F"]];
_eliteLoadoutData set ["backpacks", ["B_ViperHarness_whex_F", "B_ViperLightHarness_whex_F"]];
_eliteLoadoutData set ["helmets", ["H_HelmetSpecO_whex_F", "H_HelmetLeaderO_whex_F", "H_HelmetO_whex_F"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator_02_ghex_F"]];
_eliteLoadoutData set ["NVGs", ["O_NVGoggles_blk_F"]];

_eliteLoadoutData set ["slRifles", [
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_ghex_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_ghex_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_GL_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_CTAR_GL_ghex_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_CTAR_GL_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_CTAR_GL_ghex_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["rifles", [
["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_ghex_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
["arifle_CTAR_ghex_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["arifle_CTAR_GL_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_ghex_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_CTAR_GL_ghex_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];

private _mgs = [
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_Nightstalker", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_MRCO", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_Nightstalker", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_ACO_grn", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_ACO_grn", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "acc_pointer_IR", "optic_Nightstalker", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_MRCO", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_Nightstalker", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_ghex_F", "", "acc_pointer_IR", "optic_ACO_grn", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], [], ""]
];

private _marksmanRifles = [
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_Nightstalker", [], [], ""],
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_KHS_blk", [], [], ""],
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_Arco_blk_F", [], [], ""],
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_DMS", [], [], ""],
    ["srifle_DMR_07_blk_F", "muzzle_mzls_H", "", "optic_SOS", [], [], ""],
    ["srifle_DMR_07_ghex_F", "muzzle_mzls_H", "", "optic_Nightstalker", [], [], ""],
    ["srifle_DMR_07_ghex_F", "muzzle_mzls_H", "", "optic_KHS_blk", [], [], ""],
    ["srifle_DMR_07_ghex_F", "muzzle_mzls_H", "", "optic_Arco_ghex_F", [], [], ""],
    ["srifle_DMR_07_ghex_F", "muzzle_mzls_H", "", "optic_DMS_ghex_F", [], [], ""],
    ["srifle_DMR_07_ghex_F", "muzzle_mzls_H", "", "optic_SOS", [], [], ""]
];

if (_hasMarksman) then {
    _mgs append [
        ["MMG_01_black_F", "", "acc_pointer_IR", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"],
        ["MMG_01_black_F", "", "acc_pointer_IR", "optic_MRCO", [], [], "bipod_02_F_blk"],
        ["MMG_01_black_F", "", "acc_pointer_IR", "optic_ACO_grn", [], [], "bipod_02_F_blk"],
        ["MMG_01_black_F", "", "acc_pointer_IR", "optic_MRCO", [], [], "bipod_02_F_blk"],
        ["MMG_01_black_F", "", "acc_pointer_IR", "optic_Nightstalker", [], [], "bipod_02_F_blk"],
        ["MMG_01_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", [], [], "bipod_02_F_blk"],
        ["MMG_01_ghex_F", "", "acc_pointer_IR", "optic_MRCO", [], [], "bipod_02_F_blk"],
        ["MMG_01_ghex_F", "", "acc_pointer_IR", "optic_ACO_grn", [], [], "bipod_02_F_blk"],
        ["MMG_01_ghex_F", "", "acc_pointer_IR", "optic_MRCO", [], [], "bipod_02_F_blk"],
        ["MMG_01_ghex_F", "", "acc_pointer_IR", "optic_Nightstalker", [], [], "bipod_02_F_blk"]
    ];
    _marksmanRifles append [
        ["srifle_DMR_05_ghex_F", "", "acc_pointer_IR", "optic_Nightstalker", [], [], "bipod_02_F_blk"],
        ["srifle_DMR_05_ghex_F", "", "acc_pointer_IR", "optic_DMS_ghex_F", [], [], "bipod_02_F_hex"],
        ["srifle_DMR_05_ghex_F", "", "acc_pointer_IR", "optic_Arco_ghex_F", [], [], "bipod_02_F_tan"],
        ["srifle_DMR_05_ghex_F", "", "acc_pointer_IR", "optic_KHS_blk", [], [], "bipod_02_F_blk"],
        ["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_Nightstalker", [], [], "bipod_02_F_blk"],
        ["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_hex"],
        ["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", [], [], "bipod_02_F_tan"],
        ["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_KHS_blk", [], [], "bipod_02_F_blk"]
    ];
};
_eliteLoadoutData set ["machineGuns", _mgs];
_eliteLoadoutData set ["marksmanRifles", _marksmanRifles];
_eliteLoadoutData set ["sniperRifles", [
["srifle_GM6_ghex_F", "", "", "optic_DMS_ghex_F", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_ghex_F", "", "", "optic_LRPS_ghex_F", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["Atlas_U_O_Luchnik_TShirt_whex_F", "Atlas_U_O_Luchnik_RolledUp_whex_F", "Atlas_U_O_Luchnik_whex_F"]];
_militaryLoadoutData set ["vests", ["Atlas_V_OCarrierLuchnik_CQB_whex_F", "Atlas_V_OCarrierLuchnik_Lite_whex_F"]];
_militaryLoadoutData set ["glVests", ["Atlas_V_OCarrierLuchnik_CQB_whex_F", "Atlas_V_OCarrierLuchnik_Lite_whex_F", "Atlas_V_OCarrierLuchnik_GL_whex_F"]];
_militaryLoadoutData set ["backpacks", ["B_FieldPack_owcamo", "B_Carryall_owcamo"]];
_militaryLoadoutData set ["helmets", ["H_HelmetLuchnik_cover_whex_F", "H_HelmetLuchnik_olive_F", "Atlas_H_HelmetCCH_Cover_whex_F", "H_HelmetSpecter_cover_whex_CO"]];

_militaryLoadoutData set ["slRifles", [
["arifle_AK12_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_AK12_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_AK12U_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "SmokeShell"], ""],
["arifle_AK12_GL_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "SmokeShell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "SmokeShell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "SmokeShell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "SmokeShell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "SmokeShell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_02_F", "", "", "", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"], [], ""],
["SMG_02_F", "", "", "", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"], [], ""],
["SMG_02_F", "", "", "optic_Holosight_blk_F", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"], [], ""],
["arifle_AK12U_545_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "", "optic_Aco_smg", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""]
]];

private _mgs = [
["Atlas_LMG_Negev_black_F", "", "acc_flashlight", "optic_NVS", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
["Atlas_LMG_Negev_black_F", "", "acc_flashlight", "optic_ACO_grn", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
["Atlas_LMG_Negev_black_F", "", "acc_flashlight", "optic_MRCO", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
["Atlas_LMG_Negev_black_F", "", "acc_flashlight", "optic_Arco_blk_F", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""]
];
if (_hasWs) then {
    _mgs append [
    ["LMG_S77_lxWS", "", "acc_flashlight", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_lxWS", "", "acc_flashlight", "optic_MRCO", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_lxWS", "", "acc_flashlight", "optic_Arco_blk_F", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_lxWS", "", "acc_flashlight", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_flashlight", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_flashlight", "optic_MRCO", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_flashlight", "optic_Arco_blk_F", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_flashlight", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""]
    ];
};
_militaryLoadoutData set ["machineGuns", _mgs];

_militaryLoadoutData set ["marksmanRifles", [
["srifle_DMR_01_black_F", "", "", "optic_NVS", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "", "optic_KHS_blk", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "", "optic_DMS", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "", "optic_SOS", [], [], "bipod_02_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_KHS_blk", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];


///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////
private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
private _helmets = ["H_MilCap_gen_F", "H_Beret_gen_F"];
if (_hasLawsOfWar) then {
    _helmets pushBack "H_PASGT_basic_blue_F";
};
_policeLoadoutData set ["helmets", _helmets];
_policeLoadoutData set ["SMGs", [
["sgun_Mp153_black_F", "", "acc_flashlight_pistol", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""],
["sgun_Mp153_black_F", "", "acc_flashlight_pistol", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""],
["sgun_Mp153_black_F", "", "acc_flashlight_pistol", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""],
["sgun_Mp153_black_F", "", "acc_flashlight_pistol", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""],
["SMG_02_F", "", "", "", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"], [], ""],
["SMG_02_F", "", "", "", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"], [], ""],
["SMG_02_F", "", "", "optic_Aco_smg", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"], [], ""],
["SMG_02_F", "", "", "optic_Holosight_blk_F", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"], [], ""],
["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["arifle_AKS_alt_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["arifle_AKS_alt_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_Rook40_F"]];


////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["Atlas_U_O_Luchnik_whex_F", "Atlas_U_O_Luchnik_RolledUp_whex_F", "Atlas_U_O_Luchnik_TShirt_whex_F"]];
_militiaLoadoutData set ["vests", ["V_HarnessO_whex_F", "V_HarnessOSpec_whex_F"]];
_militiaLoadoutData set ["glVests", ["V_HarnessOGL_whex_F", "V_HarnessOSpec_whex_F"]];
_militiaLoadoutData set ["backpacks", ["B_FieldPack_owcamo", "B_FieldPack_owcamo", "B_Kitbag_cbr"]];
_militiaLoadoutData set ["helmets", ["H_O_Helmet_canvas_owcamo", "H_Beret_brn", "H_Booniehat_whex_F", "H_Bandanna_cbr"]];

_militiaLoadoutData set ["lightATLaunchers", [
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""]
]];
_militiaLoadoutData set ["ATLaunchers", [
["launch_RPG32_camo_F", "", "", "", ["RPG32_F", "RPG32_F","RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F","RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F","RPG32_HE_F"], [], ""]
]];
_militiaLoadoutData set ["missileATLaunchers", [
["launch_RPG32_camo_F", "", "", "", ["RPG32_F", "RPG32_F","RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F","RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F","RPG32_HE_F"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
    ["Aegis_arifle_AKM74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""],
    ["Aegis_arifle_AKM74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""],
    ["Aegis_arifle_AKM74_F", "", "acc_flashlight_pistol", "optic_MRCO", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""],
    ["Aegis_arifle_AKM74_plum_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_plum_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_plum_F", "", "acc_flashlight_pistol", "optic_MRCO", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_GL_plum_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_plum_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_plum_F", "", "acc_flashlight_pistol", "optic_MRCO", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_F", "", "acc_flashlight_pistol", "optic_MRCO", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["Aegis_arifle_AKM74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""],
    ["Aegis_arifle_AKM74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""],
    ["Aegis_arifle_AKM74_F", "", "acc_flashlight_pistol", "optic_ACO_grn", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""],
    ["Aegis_arifle_AKM74_plum_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_plum_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_plum_F", "", "acc_flashlight_pistol", "optic_ACO_grn", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["arifle_AKSM_F", "", "", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""],
    ["arifle_AKSM_alt_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["Aegis_arifle_AKM74_GL_plum_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_plum_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_plum_F", "", "acc_flashlight_pistol", "optic_ACO_grn", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_F", "", "acc_flashlight_pistol", "optic_ACO_grn", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_01_black_F", "", "", "optic_MRCO", [], [], "bipod_02_F_blk"],
    ["srifle_DMR_01_black_F", "", "", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"]
]];
_militiaLoadoutData set ["sidearms", ["hgun_Pistol_01_F"]];

private _mgs = if (_hasWs) then {
    [
        ["LMG_S77_lxWS", "", "acc_flashlight", "", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_lxWS", "", "acc_flashlight", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_lxWS", "", "acc_flashlight", "optic_MRCO", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_lxWS", "", "acc_flashlight", "optic_Arco_blk_F", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""]
    ];
} else {
    [
        ["Atlas_LMG_Negev_black_F", "", "acc_flashlight", "", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
        ["Atlas_LMG_Negev_black_F", "", "acc_flashlight", "optic_ACO_grn", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
        ["Atlas_LMG_Negev_black_F", "", "acc_flashlight", "optic_MRCO", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
        ["Atlas_LMG_Negev_black_F", "", "acc_flashlight", "optic_Arco_blk_F", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""]
    ];
};

_militiaLoadoutData set ["machineGuns", _mgs];
_militiaLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag"], [], ""]
]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["Atlas_U_O_LightCombatFatigues_whex_F"]];
_crewLoadoutData set ["vests", ["Atlas_V_OCarrierLuchnik_whex_F"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["Atlas_U_O_officer_noInsignia_whex_F"]];
_pilotLoadoutData set ["vests", ["V_TacVest_camo"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O", "H_PilotHelmetHeli_O_visor_up", "H_CrewHelmetHeli_O"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
      [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };
    
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};



////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];


[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
