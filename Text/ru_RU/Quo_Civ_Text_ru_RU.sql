/*
    Created by Quo
*/
 


INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Civ_Text_ru_RU',	'1',	'0',		'') ;




-- Germany

UPDATE LocalizedText SET Text= Text || ' Город с четырьмя специализированными районами получает +1 к [ICON_PRODUCTION] производству в каждом из них.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES_DESCRIPTION' AND Language='ru_RU';



-- England
UPDATE LocalizedText SET Text= '[ICON_CAPITAL] Верфь Королевского флота больше не заменяет гавань, а служит дополнением к ней. Она получает +3 к [ICON_HOUSING] жилью и +3 [ICON_GOLD] к золоту и имеет идентичные гавани бонусы от соседства. Строительство не ограничивается лимитом населения. Можно построить сразу после изучения Морской традиции.' 
WHERE Tag='LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= 'Получает бесплатный юнит ближнего боя каждый раз, когда основывает город на чужом континенте.' 
WHERE Tag='LOC_TRAIT_LEADER_PAX_BRITANNICA_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' Разблокируется после изучения Морской традиции.' 
WHERE Tag='LOC_UNIT_ENGLISH_SEADOG_DESCRIPTION' AND Language='ru_RU';




-- Russia
UPDATE LocalizedText SET Text= Text || ' Получает на 10% меньше [ICON_SCIENCE] и [ICON_CULTURE] при открытии Эврик. Получает 1 дополнительный [ICON_TradeRoute] торговый маршрут для каждой промышленной зоны в Тундре.' 
WHERE Tag='LOC_TRAIT_LEADER_GRAND_EMBASSY_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' Получает +1 к [ICON_PRODUCTION] производству за каждый холм с тундрой рядом с вашими промышленными зонами.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_MOTHER_RUSSIA_DESCRIPTION' AND Language='ru_RU';



-- Japan

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Это здание стоит вполовину дешевле.' 
WHERE Tag='LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' +1 к [ICON_GREATPERSON] очкам Великого полководца за каждый Военный лагерь, Священное место и Театральную площадь.)' 
WHERE Tag='LOC_TRAIT_LEADER_DIVINE_WIND_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Самураи незаметны для врага, пока не подойдут на соседнюю с ним клетку.' 
WHERE Tag='LOC_UNIT_JAPANESE_SAMURAI_DESCRIPTION' AND Language='ru_RU';



-- Arabia
UPDATE LocalizedText SET Text= ' Автоматически получает последнего Великого пророка. +2 к [ICON_SCIENCE] науке за каждый иностранный город, исповедующий вашу религию.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_LAST_PROPHET_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' Не может строить центры коммерции. Получает [ICON_TRADEROUTE] торговые маршруты от кампусов и Священных мест вместо Гаваней и Центров коммерции. Получает +5 [ICON_GOLD] золота от городов в которых построены Кампус и Священное место.' 
WHERE Tag='LOC_TRAIT_LEADER_RIGHTEOUSNESS_OF_FAITH_DESCRIPTION' AND Language='ru_RU';

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: This building is half normal cost.)' WHERE Tag='LOC_BUILDING_MADRASA_DESCRIPTION' ;



-- Sumeria
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Предоставляет +1 к [ICON_PRODUCTION] производству в смежные промышленные зоны, как если бы это была шахта или карьер.' 
WHERE Tag='LOC_IMPROVEMENT_ZIGGURAT_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' +10 к [ICON_STRENGTH] боевой мощи против варваров.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_FIRST_CIVILIZATION_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Необходимо открыть Международную торговлю.' 
WHERE Tag='LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' Получает 30 бесплатных очков [ICON_CULTURE] культуры в начале игры. Количество зависит от игровой скорости.' 
WHERE Tag='LOC_TRAIT_LEADER_ADVENTURES_ENKIDU_DESCRIPTION' AND Language='ru_RU';



-- China
UPDATE LocalizedText SET Text= Text || ' Получает +1 к соответсвующему доходу [ICON_FAITH] [ICON_PRODUCTION] [ICON_CULTURE] [ICON_GOLD] [ICON_SCIENCE] от любого района, граничащего с двумя клетками Великой стены.' 
WHERE Tag='LOC_IMPROVEMENT_GREAT_WALL_DESCRIPTION' AND Language='ru_RU';


-- Greece
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Гоплиты получают +10 к [ICON_STRENGTH] боевой мощи против пеших юнитов.' 
WHERE Tag='LOC_UNIT_GREEK_HOPLITE_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' +3 очка влияния на города-государства в ход, в мирное время. При переходе в новую эпоху, получает бесплатное [ICON_CivicBoosted] ускорение социальной политики, если является сюзереном хотя бы одного города-государства. Получает два [ICON_CivicBoosted] ускорения социальных политик, если является сюзереном хотя бы 3-х городов-государств.' 
WHERE Tag='LOC_TRAIT_LEADER_SURROUNDED_BY_GLORY_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' +3 очка влияния на города-государства в ход, во время войны с лидирующими цивилизпциями.' 
WHERE Tag='LOC_TRAIT_LEADER_THERMOPYLAE_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Друзья Греции получают +2 очка влияния на города-государства каждый ход.' 
WHERE Tag='TRAIT_CIVILIZATION_PLATOS_REPUBLIC_DESCRIPTION' AND Language='ru_RU';

-- UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Receive a free diplomatic token when you complete an Acropolis.)' WHERE Tag='LOC_DISTRICT_ACROPOLIS_DESCRIPTION' ;



-- Rome
-- UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: 45 base [ICON_STRENGTH] Strength and +10 [ICON_STRENGTH] Strength when fighting Infantry units.)' WHERE Tag='LOC_UNIT_ROMAN_LEGION_DESCRIPTION' ;



-- Norway
UPDATE LocalizedText SET Text= 'Ставкирка - храм, который можно построить в центре города. Не требует Священного места. Позволяет покупать апостолов, если вы основали религию. Дает +2 [ICON_FAITH] +1 [ICON_PRODUCTION] +1 [ICON_CULTURE]' 
WHERE Tag='LOC_BUILDING_STAVE_CHURCH_DESCRIPTION' AND Language='ru_RU';

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: This building is half normal cost.)' WHERE Tag='LOC_BUILDING_STAVE_CHURCH_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || ' Получает беспланый морской юнит ближнего боя, всякий раз когда основывает или покоряет новый город на побережье. Корабли не сдерживаются закрытыми границами и не высылаются в нейтральные воды, когда начинается война.' 
WHERE Tag='LOC_TRAIT_LEADER_THUNDERBOLT_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Не имеет ограничений по технологиям.' 
WHERE Tag='LOC_UNIT_NORWEGIAN_LONGSHIP_DESCRIPTION' AND Language='ru_RU';



-- America
UPDATE LocalizedText SET Text= Text || ' Все наземные боевые юниты получают +1 к радиусу обзора, стоимость клеток снижена на 20% при покупке за золото.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_FOUNDING_FATHERS_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] После возведения вашей первой киностудии, строители смогут создавать большинство уникальных улучшений, доступных другим цивилизациям.' 
WHERE Tag='LOC_BUILDING_FILM_STUDIO_DESCRIPTION' AND Language='ru_RU';



-- Egypt
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] +5 к [ICON_STRENGTH] боевой мощи на родной территории. Может двигаться после атаки.' 
WHERE Tag='LOC_UNIT_EGYPTIAN_CHARIOT_ARCHER_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  После открытия Средневековых ярмарок получает +4[ICON_GreatWork_Relic] ячейки для реликвий в Столице. После Гуманизма получает 1 бесплатную [ICON_GreatWork_Relic] реликвию за каждый город с Чудесами Античности и Древнего мира.' 
WHERE Tag='LOC_TRAIT_LEADER_MEDITERRANEAN_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  Города с хотя бы одним чудом любой эры получают +20% к [ICON_PRODUCTION] скорости создания районов и чудес. Поймы не препятствуют размещению районов и Чудес.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_ITERU_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Получает +1 к [ICON_FAITH] вере и +1 к [ICON_CULTURE] культуре от всех клеток пустыни без пойм.' 
WHERE Tag='LOC_IMPROVEMENT_SPHINX_DESCRIPTION' AND Language='ru_RU';



-- Spain
UPDATE LocalizedText SET Text= Text || ' +50% к [ICON_PRODUCTION] скорости создания Священных мест.' 
WHERE Tag='LOC_TRAIT_LEADER_EL_ESCORIAL_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Миссии больше не уничтожают леса или джунгли. +1 к [ICON_SCIENCE] науке от всех бонусов за соседство.' 
WHERE Tag='LOC_IMPROVEMENT_MISSION_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' +5 [ICON_GOLD] золота в виде бонуса за соседство Центров коммерции с Чудесами природы.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_TREASURE_FLEET_DESCRIPTION' AND Language='ru_RU';


-- France
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Можно строить после изучения Драмы и поэзии. +1 к [ICON_HOUSING] жилью. Захватывает соседние клетки с помощью культуры. Начинает вырабатывать очки [ICON_TOURISM] туризма после изучения Гуманизма.' 
WHERE Tag='LOC_IMPROVEMENT_CHATEAU_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= ' +1 уровень дипломатического доступа. Может обучать шпионов сразу после изучения астрологии. +100% к [ICON_PRODUCTION] скорости создания шпионов. Автоматически встречает другие цивилизации, сразу же после того как они открывают Астрологию.' 
WHERE Tag='LOC_TRAIT_LEADER_FLYING_SQUADRON_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Екатерина может обучать шпионов сразу после открытия Астрологии.' 
WHERE Tag='LOC_TECH_CASTLES_DESCRIPTION' AND Language='ru_RU';

-- UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Players who befriend France can build Chateaus.)' WHERE Tag='TRAIT_CIVILIZATION_WONDER_TOURISM_DESCRIPTION' ;



-- Brazil

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] +3% к [ICON_FOOD] росту населения во всех городах за каждый Уличный карнавал.' 
WHERE Tag='LOC_DISTRICT_STREET_CARNIVAL_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || ' Может создать уникальный проект: "Бразильская революция", который даёт большой прирост к очкам [ICON_GREATPErson] Великих любей, а так же позволяет создавать вырубки красного дерева, вырабатывающие +2 [ICON_GOLD] золота на клетках джунглей.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_AMAZON_DESCRIPTION' AND Language='ru_RU';


-- Scythia
UPDATE LocalizedText SET Text='Все войска получают +5 [ICON_STRENGTH] к боевой мощи в бою против повреждённых юнитов. Юниты восстанавливают 25 очков здоровья за каждое убийство.' 
WHERE Tag='LOC_TRAIT_LEADER_KILLER_OF_CYRUS_DESCRIPTION' AND Language='ru_RU';



-- India

UPDATE LocalizedText SET Text= Text || ' Получает 30 бесплатных очков [ICON_FAITH] веры в начале игры. Количество зависит от скорости игры.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_DHARMA_DESCRIPTION' AND Language='ru_RU';

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Ступенчатые колодцы расположенные рядом с городом обеспечивают жилье, эквивалентное источнику пресной воды.' 
WHERE Tag='LOC_IMPROVEMENT_STEPWELL_DESCRIPTION' AND Language='ru_RU';




-- AZTEC
UPDATE LocalizedText SET Text= Text || '[NEWLINE]Строители начинают с уменьшенным на 1 количеством зарядов. После изучения Божественного права, становится доступен Темпло Майор, который отнимает у города -4 [ICON_FOOD] пищи каждый ход, но возвращает рабочим дополнительный заряд. Так же добавляет +50% [ICON_PRODUCTION] к скорости создания Тлачтлей и обеспечивает бесплатными рабочими после постройки Развлекательного коплекса.' 
WHERE Tag='LOC_TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS_DESCRIPTION' AND Language='ru_RU';


UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] Обслуживает стену, обеспечивая защиту и позволяя центру города совершать обстрелы, даже если фактические стены отсутствуют.' 
WHERE Tag='LOC_BUILDING_TLACHTLI_DESCRIPTION' AND Language='ru_RU';



-- DEBUG
UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Civ_Text_ru_RU';
