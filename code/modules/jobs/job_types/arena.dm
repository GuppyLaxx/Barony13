/*
Arena guys
*/
/datum/job/peasant
	title = "Peasant"
	flag = PEASANT
	department_flag = ARENA
	faction = "Arena"
	total_positions = 20
	spawn_positions = 20
	supervisors = "the Baron and their Knights"
	selection_color = "#dddddd"
	outfit = /datum/outfit/job/peasant
	
/datum/job/peasant/after_spawn(mob/living/carbon/human/H, mob/M)
	handle_arena_spawn(H)
	
/datum/job/peasant/override_latejoin_spawn(mob/living/carbon/human/H)
	return TRUE

/datum/outfit/job/peasant
	name = "Peasant"
	jobtype = /datum/job/peasant
	belt = /obj/item/melee/medieval/blade/dagger
	uniform = /obj/item/clothing/under/yogs/peasant
	neck = /obj/item/clothing/neck/cloak/medieval
	shoes = null
	id = null
	ears = null
	back = null
	
/datum/outfit/job/peasant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	return
	
/datum/job/knight
	title = "Knight"
	flag = KNIGHT
	department_flag = ARENA
	faction = "Arena"
	total_positions = 1
	spawn_positions = 1
	supervisors = "N/A"
	selection_color = "#dddddd"
	outfit = /datum/outfit/job/knight
	
/datum/job/knight/after_spawn(mob/living/carbon/human/H, mob/M)
	handle_arena_spawn(H)
	//Now lets add a thing before their names to make them more honourable or some shit
	if(H.gender == FEMALE)
		H.real_name = "Dame [H.real_name]"
	else if(H.gender == PLURAL) // If this person is... multiple?? people???
		H.real_name = "Sirs [H.real_name]"
	else // For both Males, and the bizarre technicality of a NEUTER-gendered mob becoming a knight somehow
		H.real_name = "Sir [H.real_name]"
	
/datum/job/knight/override_latejoin_spawn(mob/living/carbon/human/H)
	return TRUE
	
/datum/outfit/job/knight
	name = "Knight"
	jobtype = /datum/job/knight
	
	uniform = /obj/item/clothing/under/gambeson
	shoes = /obj/item/clothing/shoes/yogs/boots
	suit = /obj/item/clothing/suit/armor/knight
	l_hand = /obj/item/shields/medieval
	belt = /obj/item/melee/medieval/blade/shortsword
	back = /obj/item/melee/medieval/blade/sword
	neck = /obj/item/clothing/neck/cloak/medieval
	id = /obj/item/key/armory
	ears = null
	
/datum/outfit/job/knight/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	return
	
/datum/job/fighter
	title = "Fighter"
	flag = FIGHTER
	department_flag = ARENA
	faction = "Arena"
	total_positions = 0
	spawn_positions = 0
	supervisors = "N/A"
	selection_color = "#dddddd"
	outfit = /datum/outfit/job/fighter
	
/datum/job/fighter/after_spawn(mob/living/carbon/human/H, mob/M)
	handle_arena_spawn(H)
	
/datum/job/fighter/override_latejoin_spawn(mob/living/carbon/human/H)
	return TRUE
	
/datum/outfit/job/fighter
	name = "Fighter"
	jobtype = /datum/job/fighter
	
	uniform = /obj/item/clothing/under/gambeson
	shoes = /obj/item/clothing/shoes/yogs/boots
	suit = /obj/item/clothing/suit/armor/coat_of_plates
	back = /obj/item/melee/medieval/blade/sword
	belt = null
	id = null
	ears = null
	
/datum/outfit/job/fighter/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	return

/datum/job/archer
	title = "Archer"
	flag = ARCHER
	department_flag = ARENA
	faction = "Arena"
	total_positions = 0
	spawn_positions = 0
	supervisors = "N/A"
	selection_color = "#dddddd"
	outfit = /datum/outfit/job/archer
	
/datum/job/archer/after_spawn(mob/living/carbon/human/H, mob/M)
	handle_arena_spawn(H)
	H.update_inv_back()
	
/datum/job/archer/override_latejoin_spawn(mob/living/carbon/human/H)
	return TRUE
	
/datum/outfit/job/archer
	name = "Archer"
	jobtype = /datum/job/archer
	
	uniform = /obj/item/clothing/under/gambeson
	shoes = /obj/item/clothing/shoes/yogs/boots
	back = /obj/item/storage/backpack/quiver
	l_hand = /obj/item/bow
	belt = /obj/item/melee/medieval/blade/dagger
	id = null
	ears = null
	
/datum/outfit/job/archer/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!backpack_contents)
		backpack_contents = list()
	backpack_contents.Insert(1, /obj/item/ammo_casing/arrow)
	backpack_contents[/obj/item/ammo_casing/arrow] = 8

	
/datum/job/proc/handle_arena_spawn(mob/living/carbon/human/H)
	var/destination = /area/barony/inside
	var/turf/T
	var/safety = 0
	while(safety < 40)
		T = safepick(get_area_turfs(destination))
		if(T && !H.Move(T))
			safety += 1
			continue
		else
			break
