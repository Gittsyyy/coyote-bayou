//Pokemon!

/mob/living/simple_animal/passive/pokemon
	name = "eevee"
	desc = "It has the ability to alter the composition of its body to suit its surrounding environment."
	icon = 'modular_coyote/icons/mob/pokemon64.dmi'
	//The size of the icon file in use. Used to center sprites on their respective tiles.
	var/icon_size = 64
	icon_state = "eevee"
	icon_living = "eevee"
	icon_dead = "eevee_d"
	unsuitable_atmos_damage = 0
	minbodytemp = TCMB
	maxbodytemp = T0C + 40
	health = 200
	maxHealth = 200
	healable = TRUE
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "bops"
	response_disarm_simple = "bop"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "nuzzles"
	attack_verb_simple = "nuzzle"
	turns_per_move = 5
	possible_a_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, INTENT_HARM)
	//Sprites are already rotated for lying down while resting.
	rotate_on_lying = FALSE
	//Can use hands
	dextrous = TRUE
	//Global cooldown used for some moves to avoid spam/lag.
	var/move_cooldown_time = 100
	//Is this pokemon on cooldown for using another move/ability?
	var/move_cooldown = FALSE
	//The pokemon-types that this mob has. Used to auto-generate moves(powers) and some other attributes.
	var/list/p_types = list()
	//Moves that aren't automatically granted based on their type. Will be assigned during Initialize()
	var/list/additional_moves = list()
	//List of passive traits/flags
	var/list/p_traits = list()
	//Moves/Abilities that this mob is currently using
	var/list/active_moves = list()

/mob/living/simple_animal/passive/pokemon/Initialize()
	. = ..()
	var/matrix/Mat = transform
	transform = Mat.Translate(-(icon_size/4),0) //Adjust pixel offset by -1/4 of their icon's width
	var/datum/action/cooldown/pokemon_rest/R = new(src)
	R.Grant(src)
	regenerate_icons()

/mob/living/simple_animal/passive/pokemon/Life()
	. = ..()
	regenerate_icons()

/mob/living/simple_animal/passive/pokemon/regenerate_icons()
	if(stat == DEAD)
		icon_state = icon_dead
	else if(stat != DEAD && !CHECK_MOBILITY(src, MOBILITY_STAND))//Not dead but can't move
		icon_state = "[icon_living]_rest"
	else
		icon_state = icon_living

/mob/living/simple_animal/passive/pokemon/update_mobility()
	. = ..()
	regenerate_icons()

///////////////////////////////
//////ALPHABETICAL PLEASE//////
///////////////////////////////

/mob/living/simple_animal/passive/pokemon/absol
	name = "absol"
	icon_state = "absol"
	icon_living = "absol"
	icon_dead = "absol_d"
	p_types = list(P_TYPE_DARK)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/aggron
	name = "aggron"
	icon_state = "aggron"
	icon_living = "aggron"
	icon_dead = "aggron_d"
	p_types = list(P_TYPE_STEEL)
	mob_size = MOB_SIZE_LARGE
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/alolanvulpix
	name = "alolan vulpix"
	icon_state = "alolanvulpix"
	icon_living = "alolanvulpix"
	icon_dead = "alolanvulpix_d"
	p_types = list(P_TYPE_ICE)
	mob_size = MOB_SIZE_SMALL
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/ampharos
	name = "ampharos"
	icon_state = "ampharos"
	icon_living = "ampharos"
	icon_dead = "ampharos_d"
	p_types = list(P_TYPE_ELEC)
	mob_size = MOB_SIZE_LARGE

/mob/living/simple_animal/passive/pokemon/braixen
	name = "braixen"
	icon_state = "braixen"
	icon_living = "braixen"
	icon_dead = "braixen_d"
	p_types = list(P_TYPE_FIRE)

/mob/living/simple_animal/passive/pokemon/celebi
	name = "celebi"
	icon_state = "celebi"
	icon_living = "celebi"
	icon_dead = "celebi_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_GRASS)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/charmander
	name = "charmander"
	icon_state = "charmander"
	icon_living = "charmander"
	icon_dead = "charmander_d"
	p_types = list(P_TYPE_FIRE)
	mob_size = MOB_SIZE_SMALL
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/ditto
	name = "ditto"
	icon_state = "ditto"
	icon_living = "ditto"
	icon_dead = "ditto_d"
	p_types = list(P_TYPE_NORM)
//	additional_moves = list(/mob/living/proc/hide, /mob/living/simple_animal/passive/pokemon/proc/move_imposter)//amogus
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/dragonair
	name = "dragonair"
	desc = "A Dragonair stores an enormous amount of energy inside its body. It is said to alter the weather around it by loosing energy from the crystals on its neck and tail."
	icon_state = "dragonair"
	icon_living = "dragonair"
	icon_dead = "dragonair_d"
	p_types = list(P_TYPE_DRAGON)
//	aquatic_movement = 1
//	additional_moves = list(/mob/living/simple_animal/passive/pokemon/proc/move_fly,
//							/mob/living/simple_animal/passive/pokemon/proc/move_hover)
	p_traits = list(P_TRAIT_RIDEABLE)
	mob_size = MOB_SIZE_LARGE

/mob/living/simple_animal/passive/pokemon/dragonair/shiny
	name = "shiny dragonair"
	icon_state = "shinydragonair"
	icon_living = "shinydragonair"
	icon_dead = "shinydragonair_d"

/mob/living/simple_animal/passive/pokemon/dragonite
	name = "dragonite"
	desc = "It can circle the globe in just 16 hours. It is a kindhearted Pok�mon that leads lost and foundering ships in a storm to the safety of land."
	icon_state = "dragonite"
	icon_living = "dragonite"
	icon_dead = "dragonite_d"
	p_types = list(P_TYPE_DRAGON, P_TYPE_FLY)
//	aquatic_movement = 1
	p_traits = list(P_TRAIT_RIDEABLE)
	mob_size = MOB_SIZE_LARGE

/mob/living/simple_animal/passive/pokemon/dratini
	name = "dratini"
	desc = "A Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels."
	icon_state = "dratini"
	icon_living = "dratini"
	icon_dead = "dratini_d"
//	movement_cooldown = 3
//	aquatic_movement = 1
	p_types = list(P_TYPE_DRAGON)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/eevee
	name = "eevee"
	desc = "Eevee has an unstable genetic makeup that suddenly mutates due to its environment. Radiation from various stones causes this Pok�mon to evolve."
	icon_state = "eevee"
	icon_living = "eevee"
	icon_dead = "eevee_d"
	p_types = list(P_TYPE_NORM)
	mob_size = MOB_SIZE_SMALL
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/espeon
	name = "espeon"
	desc = "Espeon is extremely loyal to any trainer it considers to be worthy. It is said to have developed precognitive powers to protect its trainer from harm."
	icon_state = "espeon"
	icon_living = "espeon"
	icon_dead = "espeon_d"
	p_types = list(P_TYPE_PSYCH)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/fennekin
	name = "fennekin"
	icon_state = "fennekin"
	icon_living = "fennekin"
	icon_dead = "fennekin_d"
	p_types = list(P_TYPE_FIRE)
	mob_size = MOB_SIZE_SMALL
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/flaaffy
	name = "flaaffy"
	icon_state = "flaaffy"
	icon_living = "flaaffy"
	icon_dead = "flaaffy_d"
	p_types = list(P_TYPE_ELEC)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/flareon
	name = "flareon"
	desc = "Flareon's fluffy fur releases heat into the air so that its body does not get excessively hot. Its body temperature can rise to a maximum of 1,650 degrees F."
	icon_state = "flareon"
	icon_living = "flareon"
	icon_dead = "flareon_d"
	p_types = list(P_TYPE_FIRE)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/flygon
	name = "flygon"
	desc = "The flapping of its wings sounds something like singing. Those lured by the sound are enveloped in a sandstorm, becoming Flygon's prey."
	icon_state = "flygon"
	icon_living = "flygon"
	icon_dead = "flygon_d"
	p_types = list(P_TYPE_GROUND, P_TYPE_DRAGON)
//	additional_moves = list(/mob/living/simple_animal/passive/pokemon/proc/move_fly,
//							/mob/living/simple_animal/passive/pokemon/proc/move_hover)
	p_traits = list(P_TRAIT_RIDEABLE)
	mob_size = MOB_SIZE_LARGE

/mob/living/simple_animal/passive/pokemon/furret
	name = "furret"
	icon_state = "furret"
	icon_living = "furret"
	icon_dead = "furret_d"
	p_types = list(P_TYPE_NORM)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/gallade
	name = "gallade"
	icon_state = "gallade"
	icon_living = "gallade"
	icon_dead = "gallade_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_FIGHT)

/mob/living/simple_animal/passive/pokemon/gardevoir
	name = "gardevoir"
	icon_state = "gardevoir"
	icon_living = "gardevoir"
	icon_dead = "gardevoir_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_FAIRY)

/mob/living/simple_animal/passive/pokemon/gastly
	name = "gastly"
	desc = "Almost invisible, this gaseous Pok�mon cloaks the target and puts it to sleep without notice."
	icon_state = "gastly"
	icon_living = "gastly"
	icon_dead = "gastly_d"
	p_types = list(P_TYPE_GHOST, P_TYPE_POISON)

/mob/living/simple_animal/passive/pokemon/gengar
	name = "gengar"
	desc = "It hides in shadows. It is said that if Gengar is hiding, it cools the area by nearly 10 degrees F."
	icon_state = "gengar"
	icon_living = "gengar"
	icon_dead = "gengar_d"
	p_types = list(P_TYPE_GHOST, P_TYPE_POISON)


/mob/living/simple_animal/passive/pokemon/glaceon
	name = "glaceon"
	desc = "By controlling its body heat, it can freeze the atmosphere around it to make a diamond-dust flurry."
	icon_state = "glaceon"
	icon_living = "glaceon"
	icon_dead = "glaceon_d"
	p_types = list(P_TYPE_ICE)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/haunter
	name = "haunter"
	desc = "If you get the feeling of being watched in darkness when nobody is around, Haunter may be there."
	icon_state = "haunter"
	icon_living = "haunter"
	icon_dead = "haunter_d"
	p_types = list(P_TYPE_GHOST, P_TYPE_POISON)

/mob/living/simple_animal/passive/pokemon/jirachi
	name = "jirachi"
	desc = "Generations have believed that any wish written on a note on its head will come true when it awakens."
	icon_state = "jirachi"
	icon_living = "jirachi"
	icon_dead = "jirachi_d"
	p_types = list(P_TYPE_STEEL, P_TYPE_PSYCH)
//	additional_moves = list(/mob/living/simple_animal/passive/pokemon/proc/move_fly,
//							/mob/living/simple_animal/passive/pokemon/proc/move_hover)

/mob/living/simple_animal/passive/pokemon/jolteon
	name = "jolteon"
	desc = "Its cells generate weak power that is amplified by its fur's static electricity to drop thunderbolts. The bristling fur is made of electrically charged needles."
	icon_state = "jolteon"
	icon_living = "jolteon"
	icon_dead = "jolteon_d"
	p_types = list(P_TYPE_ELEC)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/jolteon/bud
	name = "Bud"
	active_moves = list(M_SHOCK) //Shocks you by default

/mob/living/simple_animal/passive/pokemon/kirlia
	name = "kirlia"
	icon_state = "kirlia"
	icon_living = "kirlia"
	icon_dead = "kirlia_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_FAIRY)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/larvitar
	name = "larvitar"
	desc = "It is born deep underground. It can't emerge until it has entirely consumed the soil around it."
	icon_state = "larvitar"
	icon_living = "larvitar"
	icon_dead = "larvitar_d"
	p_types = list(P_TYPE_ROCK, P_TYPE_GROUND)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/leafeon
	name = "leafeon"
	icon_state = "leafeon"
	icon_living = "leafeon"
	icon_dead = "leafeon_d"
	p_types = list(P_TYPE_GRASS)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/linoone
	name = "linoone"
	icon_state = "linoone"
	icon_living = "linoone"
	icon_dead = "linoone_d"
	p_types = list(P_TYPE_NORM)
	p_traits = list(P_TRAIT_RIDEABLE)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/growlithe
	name = "growlithe"
	icon_state = "growlithe"
	icon_living = "growlithe"
	icon_dead = "growlithe_d"
	p_types = list(P_TYPE_FIRE)
	p_traits = list(P_TRAIT_RIDEABLE)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/mareep
	name = "mareep"
	icon_state = "mareep"
	icon_living = "mareep"
	icon_dead = "mareep_d"
	p_types = list(P_TYPE_ELEC)
	p_traits = list(P_TRAIT_RIDEABLE)
	mob_size = MOB_SIZE_SMALL
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/mightyena
	name = "mightyena"
	icon_state = "mightyena"
	icon_living = "mightyena"
	icon_dead = "mightyena"
	p_types = list(P_TYPE_DARK)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/miltank
	name = "miltank"
	icon_state = "miltank"
	icon_living = "miltank"
	icon_dead = "miltank_d"
	p_types = list(P_TYPE_NORM)
	var/datum/reagents/udder = null
//	movement_cooldown = 3

/mob/living/simple_animal/passive/pokemon/miltank/Initialize()
	udder = new(50)
	udder.my_atom = src
	..()

/mob/living/simple_animal/passive/pokemon/miltank/Life()
	. = ..()
	if(stat == CONSCIOUS)
		if(udder && prob(5))
			udder.add_reagent("milk", rand(5, 10))

/* TODO fix milking i guess
/mob/living/simple_animal/passive/pokemon/miltank/attackby(var/obj/item/O as obj, var/mob/user as mob)
	var/obj/item/weapon/reagent_containers/glass/G = O
	if(stat == CONSCIOUS && istype(G) && G.is_open_container())
		user.visible_message("<span class='notice'>[user] milks [src] using \the [O].</span>")
		var/transfered = udder.trans_id_to(G, "milk", rand(5,10))
		if(G.reagents.total_volume >= G.volume)
			user << "<font color='red'> The udder is dry. Wait a bit longer... </font>"
		if(!transfered)
			user << "<font color='red'> The udder is dry. Wait a bit longer... </font>"
		..()
*/

/mob/living/simple_animal/passive/pokemon/poochyena
	name = "poochyena"
	icon_state = "poochyena"
	icon_living = "poochyena"
	icon_dead = "poochyena_d"
	p_types = list(P_TYPE_DARK)
	mob_size = MOB_SIZE_SMALL
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/sylveon
	name = "sylveon"
	desc = "Sylveon, the Intertwining Pokemon. Sylveon affectionately wraps its ribbon-like feelers around its Trainer's arm as they walk together."
	icon_state = "sylveon"
	icon_living = "sylveon"
	icon_dead = "sylveon_d"
	p_types = list(P_TYPE_FAIRY)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/umbreon
	name = "umbreon"
	icon_state = "umbreon"
	icon_dead = "umbreon_d"
	icon_living = "umbreon"
	p_types = list(P_TYPE_DARK)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/vulpix
	name = "vulpix"
	icon_state = "vulpix"
	icon_living = "vulpix"
	icon_dead = "vulpix_d"
	p_types = list(P_TYPE_FIRE)
	mob_size = MOB_SIZE_SMALL
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/tentacruel
	name = "tentacruel"
	icon_state = "tentacruel"
	icon_living = "tentacruel"
	icon_dead = "tentacruel_d"
//	movement_cooldown = 3
	p_types = list(P_TYPE_WATER)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/thievul
	name = "thievul"
	icon_state = "thievul"
	icon_living = "thievul"
	icon_dead = "thievul_d"
	p_types = list(P_TYPE_DARK)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/ninetales
	name = "ninetales"
	icon_state = "ninetales"
	icon_living = "ninetales"
	icon_dead = "ninetales_d"
	p_types = list(P_TYPE_FIRE)
//	additional_moves = list(/mob/living/simple_animal/passive/pokemon/proc/move_telepathy)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/ponyta
	name = "ponyta"
	icon_state = "ponyta"
	icon_living = "ponyta"
	icon_dead = "ponyta_d"
	p_types = list(P_TYPE_FIRE)
	p_traits = list(P_TRAIT_RIDEABLE)
	mob_size = MOB_SIZE_SMALL
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/zubat
	name = "zubat"
	icon_state = "zubat"
	icon_living = "zubat"
	icon_dead = "zubat_d"
	desc = "Even though it has no eyes, it can sense obstacles using ultrasonic waves it emits from its mouth."
	p_types = list(P_TYPE_FLY, P_TYPE_POISON)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/tangela
	name = "tangela"
	icon_state = "tangela"
	icon_living = "tangela"
	icon_dead = "tangela_d"
	p_types = list(P_TYPE_GRASS, P_TYPE_POISON)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/pinsir
	name = "pinsir"
	icon_state = "pinsir"
	icon_living = "pinsir"
	icon_dead = "pinsir_d"
	p_types = list(P_TYPE_BUG)

/mob/living/simple_animal/passive/pokemon/omanyte
	name = "omanyte"
	icon_state = "omanyte"
	icon_living = "omanyte"
	icon_dead = "omanyte_d"
//	movement_cooldown = 3
	p_types = list(P_TYPE_ROCK, P_TYPE_WATER)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/magmar
	name = "magmar"
	icon_state = "magmar"
	icon_living = "magmar"
	icon_dead = "magmar_d"
//	movement_cooldown = 3
	p_types = list(P_TYPE_FIRE)

/mob/living/simple_animal/passive/pokemon/magicarp
	name = "magicarp"
	icon_state = "magicarp"
	icon_living = "magicarp"
	icon_dead = "magicarp_d"
//	movement_cooldown = 5
	p_types = list(P_TYPE_WATER)
	p_traits = list(P_TRAIT_RIDEABLE)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/lapras
	name = "lapras"
	icon_state = "lapras"
	icon_living = "lapras"
	icon_dead = "lapras_d"
//	movement_cooldown = 3
	p_types = list(P_TYPE_WATER)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/kabuto
	name = "kabuto"
	icon_state = "Kabuto"
	icon_living = "Kabuto"
	icon_dead = "Kabuto_d"
	p_types = list(P_TYPE_ROCK, P_TYPE_WATER)

/mob/living/simple_animal/passive/pokemon/aerodactyl
	name = "aerodactyl"
	icon_state = "Aerodactyl"
	icon_living = "Aerodactyl"
	icon_dead = "Aerodactyl_d"
	p_types = list(P_TYPE_ROCK, P_TYPE_FLY)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/lickitung
	name = "lickitung"
	icon_state = "lickitung"
	icon_living = "lickitung"
	icon_dead = "lickitung_d"
	p_types = list(P_TYPE_NORM)

/mob/living/simple_animal/passive/pokemon/cubone
	name = "cubone"
	icon_state = "cubone"
	icon_living = "cubone"
	icon_dead = "cubone_d"
	p_types = list(P_TYPE_GROUND)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/mew
	name = "mew"
	icon_state = "mew"
	icon_living = "mew"
	icon_dead = "mew_d"
	p_types = list(P_TYPE_PSYCH)
//	additional_moves = list(/mob/living/simple_animal/passive/pokemon/proc/move_fly,
//							/mob/living/simple_animal/passive/pokemon/proc/move_hover,
//							/mob/living/simple_animal/passive/pokemon/proc/move_imposter,
//							/mob/living/simple_animal/passive/pokemon/proc/move_invisibility)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/mewtwo
	name = "mewtwo"
	icon_state = "mewtwo"
	icon_living = "mewtwo"
	icon_dead = "mewtwo_d"
	p_types = list(P_TYPE_PSYCH)
//	additional_moves = list(/mob/living/simple_animal/passive/pokemon/proc/move_fly,
//							/mob/living/simple_animal/passive/pokemon/proc/move_hover)

/mob/living/simple_animal/passive/pokemon/purrloin
	name = "purrloin"
	icon_state = "purrloin"
	icon_living = "purrloin"
	icon_dead = "purrloin_d"
	p_types = list(P_TYPE_DARK)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/ralts
	name = "ralts"
	icon_state = "ralts"
	icon_living = "ralts"
	icon_dead = "ralts_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_FAIRY)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/snorlax
	name = "snorlax"
	icon_state = "snorlax"
	icon_living = "snorlax"
	icon_dead = "snorlax_d"
	p_types = list(P_TYPE_NORM)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/vaporeon
	name = "vaporeon"
	icon_state = "vaporeon"
	icon_living = "vaporeon"
	icon_dead = "vaporeon_d"
	p_types = list(P_TYPE_WATER)
	p_traits = list(P_TRAIT_RIDEABLE)

/mob/living/simple_animal/passive/pokemon/zigzagoon
	name = "zigzagoon"
	icon_state = "zigzagoon"
	icon_living = "zigzagoon"
	icon_dead = "zigzagoon_d"
	p_types = list(P_TYPE_NORM)
	p_traits = list(P_TRAIT_RIDEABLE)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/zoroark
	name = "zoroark"
	icon_state = "zoroark"
	icon_living = "zoroark"
	icon_dead = "zoroark_d"
	p_types = list(P_TYPE_DARK)
//	additional_moves = list(/mob/living/proc/hide, /mob/living/simple_animal/passive/pokemon/proc/move_imposter)

/mob/living/simple_animal/passive/pokemon/zorua
	name = "zorua"
	icon_state = "zorua"
	icon_living = "zorua"
	icon_dead = "zorua_d"
	p_types = list(P_TYPE_DARK)
//	additional_moves = list(/mob/living/proc/hide, /mob/living/simple_animal/passive/pokemon/proc/move_imposter)
	mob_size = MOB_SIZE_SMALL

/mob/living/simple_animal/passive/pokemon/zorua_hisuian
	name = "hisuian zorua"
	icon_state = "zorua_hisuian"
	icon_living = "zorua_hisuian"
	icon_dead = "zorua_hisuian_d"
	p_types = list(P_TYPE_NORM, P_TYPE_GHOST)
//	additional_moves = list(/mob/living/proc/hide, /mob/living/simple_animal/passive/pokemon/proc/move_imposter)
	mob_size = MOB_SIZE_SMALL

///////////////////////
//ALPHABETICAL PLEASE//
///////////////////////

