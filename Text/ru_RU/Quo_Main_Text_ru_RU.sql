/*
    Created by Quo
*/
 

-- Configuration
UPDATE LocalizedText SET Text= 'Quo базовые Правила' WHERE Tag='LOC_RULESET_NAME' ;

UPDATE LocalizedText SET Text= 'Различные изменения баланса. См. Файл MyOptions в папке мода для настройки параметров.' WHERE Tag='LOC_RULESET_DESCRIPTION' ;



-- Scouts
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Разведчики создаются с уровнем 2. Они могут отправиться в прибрежные воды, как только вы изучите Навигацию по звездам.' WHERE Tag='LOC_UNIT_SCOUT_DESCRIPTION' ;

-- Settlers
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Убегает в ближайший город, если схвачен врагом.' WHERE Tag='LOC_UNIT_SETTLER_DESCRIPTION' ;



-- Musketmen
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется селитра для подготовки.' WHERE Tag='LOC_UNIT_MUSKETMAN_DESCRIPTION' ;


-- Encampment
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Военные лагеря становятся доступны после изучения свода законов. Для строительства стен теперь необходим военный лагерь.' WHERE Tag='LOC_DISTRICT_ENCAMPMENT_DESCRIPTION' ;


-- Siege
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Этот юнит имеет 2 очка перемещения. Радиус дальнобойной атаки увеличен на 3. Может атаковать сразу после передвижения.' WHERE Tag='LOC_UNIT_CATAPULT_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Этот юнит имеет 2 очка перемещения. Радиус дальнобойной атаки увеличен на 3. Может атаковать сразу после передвижения.' WHERE Tag='LOC_UNIT_BOMBARD_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Этот юнит имеет 2 очка перемещения. Радиус дальнобойной атаки увеличен на 3. Может атаковать сразу после передвижения.' WHERE Tag='LOC_UNIT_ARTILLERY_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Этот юнит может атаковать сразу после передвижения.' WHERE Tag='LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION' ;


UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Этот юнит можно построить только после изучения строительства.' WHERE Tag='LOC_UNIT_BATTERING_RAM_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Этот юнит больше нельзя строить. Во всем виноват Эд Бич!' WHERE Tag='LOC_UNIT_SIEGE_TOWER_DESCRIPTION' ;



-- Siege Promotions
UPDATE LocalizedText SET Text='[ICON_CAPITAL] Получает +1 к передвижению.' WHERE Tag='LOC_PROMOTION_EXPERT_CREW_DESCRIPTION' ;



-- Civil Engineering Civic
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не обеспечивает городские средства защиты.' WHERE Tag='LOC_CIVIC_CIVIL_ENGINEERING_DESCRIPTION' ;


-- City Center Adjacencies
UPDATE LocalizedText SET Text= '[ICON_CAPITAL] Позволяет разведчикам грузиться на корабли и потреблять [ICON_RESOURCE_FISH] рыбу. Городские центры получают +1 к [ICON_PRODUCTION] производству за каждые 2 соседние клетки океана.' WHERE Tag='LOC_TECH_CELESTIAL_NAVIGATION_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Городские центры получают +1 к [ICON_GOLD] золоту за каждые 2 соседние клетки океана.' WHERE Tag='LOC_TECH_SAILING_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Городские центры получают +1 к [ICON_GOLD] золоту за каждые 2 соседние клетки океана.' WHERE Tag='LOC_TECH_CARTOGRAPHY_DESCRIPTION' ;



-- Harbor
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Можно строить после изучения астрологии.' WHERE Tag='LOC_DISTRICT_HARBOR_DESCRIPTION' ;


-- Holy Site
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Накапливает +2 дополнительных очка [ICON_GreatPerson] Великих пророков каждый ход.' WHERE Tag='LOC_DISTRICT_HOLY_SITE_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Как и обычное Священное место, накапливает +2 дополнительных очка [ICON_GreatPerson] Великих пророков каждый ход.' WHERE Tag='LOC_DISTRICT_LAVRA_DESCRIPTION' ;


-- Entertainment Complex
-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: +5% [ICON_FOOD], [ICON_CULTURE], [ICON_GOLD], [ICON_SCIENCE], [ICON_PRODUCTION] or [ICON_FAITH] to this city per resource Expo in the Capital. To earn an Expo you must control more copies of a Luxury resource than any other player (minimum 3).)' WHERE Tag='LOC_DISTRICT_ENTERTAINMENT_COMPLEX_DESCRIPTION' ;
-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: +5% [ICON_FOOD], [ICON_CULTURE], [ICON_GOLD], [ICON_SCIENCE], [ICON_PRODUCTION] or [ICON_FAITH] to this city per resource Expo.)' WHERE Tag='LOC_DISTRICT_STREET_CARNIVAL_DESCRIPTION' ;





-- Aqueducts & Baths
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Предоставляет +2 к [ICON_FOOD] пище от плантаций и вырабатывает +1 очко [ICON_GreatPerson] Великого инженера. Свежую воду получают все города в радиусе 6 клеток от акведука.' WHERE Tag='LOC_DISTRICT_AQUEDUCT_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Обеспечивают +2 к [ICON_FOOD] пище от плантаций и вырабатывают +2 очка [ICON_GreatPerson] Великого инженера. Свежую воду получают все города в радиусе 6 клеток от бани.' WHERE Tag='LOC_DISTRICT_BATH_DESCRIPTION' ;


-- Walls
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Требуются казармы или конюшни в Военном лагере.' WHERE Tag='LOC_BUILDING_WALLS_DESCRIPTION' ;


-- Regional Buildings
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Это здание имеет удвоенный выход продукции от его номинальной мощности.' WHERE Tag='LOC_BUILDING_FACTORY_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Это здание имеет удвоенный выход продукции от его номинальной мощности.' WHERE Tag='LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Это здание предоставляет 3 единицы довольства.' WHERE Tag='LOC_BUILDING_ZOO_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Это здание имеет удвоенный выход продукции от его номинальной мощности.' WHERE Tag='LOC_BUILDING_POWER_PLANT_DESCRIPTION' ;





-- Stonehenge
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Можно построить только после изучения каменной кладки.' WHERE Tag='LOC_BUILDING_STONEHENGE_DESCRIPTION' ;

-- Hanging G
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] +1 к [ICON_FOOD] пище на всех клетках тропических лесов, находящихся в пределах города.' WHERE Tag='LOC_BUILDING_HANGING_GARDENS_DESCRIPTION';


UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_GREAT_LIGHTHOUSE_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_COLOSSUS_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_COLOSSEUM_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_GREAT_LIBRARY_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_MAHABODHI_TEMPLE_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_TERRACOTTA_ARMY_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_HAGIA_SOPHIA_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_ALHAMBRA_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_VENETIAN_ARSENAL_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_GREAT_ZIMBABWE_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_FORBIDDEN_CITY_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_RUHR_VALLEY_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_BOLSHOI_THEATRE_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_OXFORD_UNIVERSITY_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_BIG_BEN_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_EIFFEL_TOWER_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_BROADWAY_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_ESTADIO_DO_MARACANA_DESCRIPTION';
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL] Больше не требуется соседний район.' WHERE Tag='LOC_BUILDING_SYDNEY_OPERA_HOUSE_DESCRIPTION';

-- wonder era names
UPDATE LocalizedText SET Text= Text || ' (Древний мир)' WHERE Tag='LOC_BUILDING_HANGING_GARDENS_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Древний мир)' WHERE Tag='LOC_BUILDING_ORACLE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Древний мир)' WHERE Tag='LOC_BUILDING_PYRAMIDS_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Древний мир)' WHERE Tag='LOC_BUILDING_STONEHENGE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Эпоха атома)' WHERE Tag='LOC_BUILDING_ESTADIO_DO_MARACANA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Эпоха атома)' WHERE Tag='LOC_BUILDING_SYDNEY_OPERA_HOUSE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Античность)' WHERE Tag='LOC_BUILDING_COLOSSEUM_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Античность)' WHERE Tag='LOC_BUILDING_COLOSSUS_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Античность)' WHERE Tag='LOC_BUILDING_GREAT_LIBRARY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Античность)' WHERE Tag='LOC_BUILDING_GREAT_LIGHTHOUSE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Античность)' WHERE Tag='LOC_BUILDING_MAHABODHI_TEMPLE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Античность)' WHERE Tag='LOC_BUILDING_PETRA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Античность)' WHERE Tag='LOC_BUILDING_TERRACOTTA_ARMY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Промышленная эра)' WHERE Tag='LOC_BUILDING_BIG_BEN_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Промышленная эра)' WHERE Tag='LOC_BUILDING_BOLSHOI_THEATRE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Промышленная эра)' WHERE Tag='LOC_BUILDING_HERMITAGE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Промышленная эра)' WHERE Tag='LOC_BUILDING_OXFORD_UNIVERSITY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Промышленная эра)' WHERE Tag='LOC_BUILDING_RUHR_VALLEY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Средневековье)' WHERE Tag='LOC_BUILDING_ALHAMBRA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Средневековье)' WHERE Tag='LOC_BUILDING_CHICHEN_ITZA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Средневековье)' WHERE Tag='LOC_BUILDING_HAGIA_SOPHIA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Средневековье)' WHERE Tag='LOC_BUILDING_HUEY_TEOCALLI_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Средневековье)' WHERE Tag='LOC_BUILDING_MONT_ST_MICHEL_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Новое время)' WHERE Tag='LOC_BUILDING_BROADWAY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Новое время)' WHERE Tag='LOC_BUILDING_CRISTO_REDENTOR_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Новое время)' WHERE Tag='LOC_BUILDING_EIFFEL_TOWER_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Возрождение)' WHERE Tag='LOC_BUILDING_FORBIDDEN_CITY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Возрождение)' WHERE Tag='LOC_BUILDING_GREAT_ZIMBABWE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Возрождение)' WHERE Tag='LOC_BUILDING_POTALA_PALACE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Возрождение)' WHERE Tag='LOC_BUILDING_VENETIAN_ARSENAL_NAME' ;



-- Beliefs

UPDATE LocalizedText SET Text=' +1 к [ICON_PRODUCTION] производству от рыбацких лодок. +2% к [ICON_PRODUCTION] производству от гаваней в каждом городе, где распространен пантеон.' WHERE Tag='LOC_BELIEF_GOD_OF_THE_SEA_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +1 к [ICON_CULTURE] культуре от пастбищ. Разведывательные юниты игнорируют закрытые границы.' WHERE Tag='LOC_BELIEF_GOD_OF_THE_OPEN_SKY_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +1 к [ICON_CULTURE] культуре от всех плантаций. При основании города его границы получают 4 дополнительные клетки.' WHERE Tag='LOC_BELIEF_ORAL_TRADITION_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +1 к [ICON_FOOD] пище от всех плантаций. +3% к [ICON_PRODUCTION] производству от развлекательных комплексов в каждом городе, где распространен пантеон.' WHERE Tag='LOC_BELIEF_GODDESS_OF_FESTIVALS_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +2 к [ICON_PRODUCTION] производству от шахт на стратегических ресурсах. Показывает железо и селитру на карте.' WHERE Tag='LOC_BELIEF_GOD_OF_CRAFTSMEN_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +2 к [ICON_PRODUCTION] производству от шахт на редких и бонусных ресурсах. Показывает железо и селитру на карте.' WHERE Tag='LOC_BELIEF_STONE_CIRCLES_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +1 к [ICON_FOOD] пище от лагерей и +15% к [ICON_PRODUCTION] производству дальнобойных юнитов любой эпохи.' WHERE Tag='LOC_BELIEF_GODDESS_OF_THE_HUNT_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +2 к [ICON_Faith] вере от каменоломен и +200% к [ICON_PRODUCTION] скорости строительства Стоунхенджа.' WHERE Tag='LOC_BELIEF_STONE_CIRCLES_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' Границы расширяются на 15% быстрее. +1 к [ICON_TRADEROUTE] максимальному количеству торговых путей.' WHERE Tag='LOC_BELIEF_RELIGIOUS_SETTLEMENTS_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +40% к скорости [ICON_PRODUCTION] производства чудес света Древнего мира и Античности.' WHERE Tag='LOC_BELIEF_MONUMENT_TO_THE_GODS_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +1 к довольству в каждом центре города, расположенном у реки.' WHERE Tag='LOC_BELIEF_RIVER_GODDESS_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' +1 к [ICON_FAITH] вере от шахт на редких и бонусных ресурсах. Единовременно получаете 300 единиц [ICON_GOLD] золота.' WHERE Tag='LOC_BELIEF_RELIGIOUS_IDOLS_DESCRIPTION' ;

UPDATE LocalizedText SET Text=' Скорость роста всех городов увеличена на +10%. Столица получает +3 к [ICON_FOOD] пище.' WHERE Tag='LOC_BELIEF_FERTILITY_RITES_DESCRIPTION' ;


-- Governments
UPDATE LocalizedText SET Text='+1 ко всем доходам в Столице. +1 к [ICON_FAITH] вере за каждую смежную с Чудом клетку.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_AUTOCRACY' ;
UPDATE LocalizedText SET Text='+1 к [ICON_AMENITIES] в городе с районом. Поселенцы получают +2 [ICON_MOVEMENT].' WHERE Tag='LOC_GOVT_INHERENT_BONUS_CLASSREP' ;
UPDATE LocalizedText SET Text='+4 [ICON_STRENGTH] и +1 [ICON_MOVEMENT] по нейтральной территории для юнитов ближнего боя.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_OLIGARCHY' ;


UPDATE LocalizedText SET Text='+50% [ICON_PRODUCTION] для Священных мест. Покупка юнитов за [ICON_Faith].' WHERE Tag='LOC_GOVT_INHERENT_BONUS_THEOCRACY' ;
UPDATE LocalizedText SET Text='+2 [ICON_HOUSING] +1 [ICON_CULTURE] от ферм, в пределах 3 клеток от Военного лагеря.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_MONARCHY' ;
UPDATE LocalizedText SET Text='+2 [ICON_TRADEROUTE] торговых маршрута и +6 [ICON_GOLD] от оазисов.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_MERCHREP' ;


UPDATE LocalizedText SET Text='+4 к [ICON_STRENGTH] для всех юнитов. +2 к [ICON_RANGE] для дальнобойных юнитов.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_FASCISM' ;
UPDATE LocalizedText SET Text='+4 к [ICON_STRENGTH] при обороне. Все города получают средства защиты.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_COMMUNISM' ;
UPDATE LocalizedText SET Text='-50% [ICON_GOLD] от стоимости [ICON_GreatPerson]. "Культурная бомба" для районов.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_DEMOCRACY' ;



-- Friendships
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +25% к [ICON_PRODUCTION] производству Промышленных зон.' WHERE Tag='LOC_AGENDA_IRON_CROWN_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим строителям возводить Шато.' WHERE Tag='LOC_AGENDA_BLACK_QUEEN_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +1 к [ICON_TRADEROUTE] максимальному количеству торговых путей.' WHERE Tag='LOC_AGENDA_QUEEN_OF_THE_NILE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим строителям возводить Ступенчатые колодцы.' WHERE Tag='LOC_AGENDA_PEACEKEEPER_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим строителям возводить Зиккураты.' WHERE Tag='LOC_AGENDA_ALLY_OF_ENKIDU_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +2 к очкам влияния на города-государства за каждый ход.' WHERE Tag='LOC_AGENDA_WITH_YOUR_SHIELD_OR_ON_IT_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим кораблям лечиться за пределами дружественной территории.' WHERE Tag='LOC_AGENDA_LAST_VIKING_KING_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +25% к [ICON_PRODUCTION] скорости строительства Военных лагерей.' WHERE Tag='LOC_AGENDA_BUSHIDO_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +1 к [ICON_FOOD] пище в каждом городе.' WHERE Tag='LOC_AGENDA_ENTHUSIASTIC_DISCIPLE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет восстановить 10% от  очков Великого человека сразу же после его найма.' WHERE Tag='LOC_AGENDA_GREAT_PERSON_OBSESSED_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +2 к очкам влияния на города-государства за каждый ход.' WHERE Tag='LOC_AGENDA_DELIAN_LEAGUE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим городам при основании захватывать больше близлежащих земель.' WHERE Tag='LOC_AGENDA_WESTERNIZER_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим строителям возводить Миссии.' WHERE Tag='LOC_AGENDA_COUNTER_REFORMER_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +1 дополнительный заряд для строителей.' WHERE Tag='LOC_AGENDA_WONDER_OBSESSED_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +5% к [ICON_SCIENCE] науке и +2 к [ICON_GreatPerson] очкам Великого пророка каждый ход.' WHERE Tag='LOC_AGENDA_AYYUBID_DYNASTY_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает возможность созданным во время дружбы юнитам восстанавливать 10 HP всякий раз, когда они уничтожают врага.' WHERE Tag='LOC_AGENDA_BACKSTAB_AVERSE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим городам при основании получать бесплатную дорогу, если они находятся на расстоянии торгового пути.' WHERE Tag='LOC_AGENDA_OPTIMUS_PRINCEPS_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет сократить стоимость покупок за золото на 20%.' WHERE Tag='LOC_AGENDA_BIG_STICK_POLICY_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +25% к [ICON_PRODUCTION] скорости строительства Гаваней.' WHERE Tag='LOC_AGENDA_SUN_NEVER_SETS_DESCRIPTION' ;

-- dlc
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером дает +4 к [ICON_STRENGTH] боевой мощи для всех ваших юнитов.' WHERE Tag='LOC_AGENDA_TLATOANI_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим Военным лагерям захватывать территории при строительстве.' WHERE Tag='LOC_AGENDA_SAINT_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим строителям возводить Скотоводческие фермы.' WHERE Tag='LOC_AGENDA_PERPETUALLY_ON_GUARD_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет сократить недовольство войной в ваших городах на 50%.' WHERE Tag='LOC_AGENDA_SHORT_LIFE_GLORY_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Дружба с лидером позволяет вашим строителям возводить Пайридаезы.' WHERE Tag='LOC_AGENDA_BACKSTABBER_DESCRIPTION' ;
