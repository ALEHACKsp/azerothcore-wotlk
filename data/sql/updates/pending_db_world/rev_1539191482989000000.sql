INSERT INTO version_db_world (`sql_rev`) VALUES ('1539191482989000000');

UPDATE `gameobject_template` SET AIName = 'SmartGameObjectAI', `ScriptName` = '' WHERE `entry`=194569;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=10389;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `box_coded`, `box_money`, `box_text`) VALUES
(10389, 0, 0, 'Teleport to the Expedition Base Camp', 1, 0, 0, ''),
(10389, 1, 0, 'Teleport to the Formation Grounds', 1, 0, 0, ''),
(10389, 3, 0, 'Teleport to the Colossal Forge', 1, 0, 0, ''),
(10389, 4, 0, 'Teleport to the Scrapyard', 1, 0, 0, ''),
(10389, 5, 0, 'Teleport to the Antechamber of Ulduar', 1, 0, 0, ''),
(10389, 6, 0, 'Teleport to the Shattered Walkway', 1, 0, 0, ''),
(10389, 10, 0, 'Teleport to the Conservatory of Life', 1, 0, 0, ''),
(10389, 12, 0, 'Teleport to the Spark of Imagination', 1, 0, 0, ''),
(10389, 15, 0, 'Teleport to the Prison of Yogg-Saron', 1, 0, 0, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=194569;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=194569;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,0,9,62,0,100,0,10389,0,0,0,11,64014,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - On gossip select 0 - Cast \"Expedition Base Camp Teleport\"');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,1,9,62,0,100,0,10389,1,0,0,11,64032,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - On gossip select 1 - Cast \"Formation Grounds Teleport\"');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,2,9,62,0,100,0,10389,3,0,0,11,64028,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - On gossip select 3 - Cast \"Colossal Forge Teleport\"');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,3,9,62,0,100,0,10389,4,0,0,11,64031,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - On gossip select 4 - Cast \"Scrapyard Teleport\"');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,4,9,62,0,100,0,10389,5,0,0,11,64030,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - On gossip select 5 - Cast \"Antechamber Teleport\"');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,5,9,62,0,100,0,10389,6,0,0,11,64029,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - On gossip select 6 - Cast \"Shattered Walkway Teleport\"');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,6,9,62,0,100,0,10389,10,0,0,11,64024,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - On gossip select 10 - Cast \"Conservatory Teleport\"');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,7,9,62,0,100,0,10389,12,0,0,11,65042,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - On gossip select 12 - Cast \"Halls of Invention Teleport\"');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,8,9,62,0,100,0,10389,15,0,0,11,64025,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - On gossip select 15 - Cast \"Prison of Yogg-Saron Teleport\"');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (194569,1,9,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ulduar Teleporter - Linked with Previous Event - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10389;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES (15,10389,1,0,0,13,0,0,4,0,0,0,0,'','');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES (15,10389,3,0,0,13,0,0,3,0,0,0,0,'','');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES (15,10389,4,0,0,13,0,3,3,0,0,0,0,'','');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES (15,10389,5,0,0,13,0,3,3,0,0,0,0,'','');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES (15,10389,6,0,0,13,0,5,3,0,0,0,0,'','');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES (15,10389,10,0,0,13,0,5,3,0,0,0,0,'','');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES (15,10389,12,0,0,13,0,6,3,0,0,0,0,'','');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES (15,10389,15,0,0,13,0,11,3,0,0,0,0,'','');
