CREATE DATABASE recipe_book;
USE recipe_book;
#------------------------------------------------------------------------
CREATE TABLE recipe (
recipe_id	    INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
title	        TEXT NOT NULL,
description    TEXT
);

CREATE TABLE ingredient (
ingredient_id	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
title	        TEXT NOT NULL,
description	TEXT
);

CREATE TABLE ingredient_count (
count_id	    INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
recipe_id	    INTEGER,
ingredient_id	INTEGER,
count_num	    REAL,
count_val	    TEXT,
FOREIGN KEY(ingredient_id) REFERENCES ingredient(ingredient_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(recipe_id) REFERENCES recipe(recipe_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tmp (
tmp_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
user_id INTEGER,
ingredient_id INTEGER,
count_num REAL,
count_val TEXT,
FOREIGN KEY(ingredient_id) REFERENCES ingredient(ingredient_id) ON DELETE CASCADE ON UPDATE CASCADE
);
#------------------------------------------------------------------------
INSERT INTO ingredient (ingredient_id, title, description) 
VALUES 
(1,
'Грибы вешенки',
'Довольно крупный гриб. Шляпка диаметром 5—15 (30) см, мясистая, сплошная, округлая, с тонким краем; форма уховидная,
 раковинообразная или почти круглая. У молодых грибов шляпка выпуклая и с завёрнутым краем, позднее —
 плоская или широковоронковидная с волнистым или лопастным краем. Поверхность шляпки гладкая, глянцевая, часто волнистая.
 При произрастании во влажных условиях шляпка гриба часто покрыта мицелиальным налётом. Цвет шляпки изменчивый,
 меняясь от тёмно-серого или буроватого у молодых грибов до пепельно-серого с фиолетовым оттенком у зрелых грибов,
 а с течением времени выцветая до беловатого, сероватого или жёлтоватого.
 Ножка короткая (иногда практически незаметная), плотная, сплошная, эксцентрическая или боковая, цилиндрическая, суженная к основанию,
 часто изогнутая, 2—5 см длиной и 0,8—3 см толщиной. Поверхность ножки белая, гладкая; у основания буроватая и слегка войлочная.
 У старых грибов ножка становится очень жёсткой. Пластинки средней частоты и редкие, 3—15 мм шириной, тонкие, нисходящие по ножке,
 около ножки с анастомозами (перемычками); у молодых грибов беловатые, с возрастом желтеющие или сереющие.
 Споровый порошок белый или розоватый. Споры 8—13 × 3—4 мкм, гладкие, цилиндрические, удлинённо-яйцевидные, бесцветные.
 Мякоть белая, плотная, у молодых грибов мягкая и сочная, позднее жёсткая и волокнистая (особенно в ножке), без выраженного запаха.
 Вкус описывается как приятный, с привкусом аниса, благодаря присутствию бензальдегида.'
),
(2,
'Лук репчатый',
'Многолетнее травянистое растение, вид рода Лук (Allium) семейства Луковые (Alliaceae), широко распространённая овощная культура.'
),
(3,
'Вода',
'Питьевая вода представляет собой воду из какого-либо источника, очищенную от микроорганизмов и вредных примесей.
 Пригодность воды для питья при её обеззараживании перед подачей в водопровод оценивается по количеству кишечных палочек на литр воды,
 поскольку кишечные палочки распространены и достаточно устойчивы к антибактериальным средствам, и если кишечных палочек будет мало,
 то будет мало и других микробов. Если кишечных палочек не больше, чем 3 на литр, вода считается пригодной для питья.'
),
(4,
'Соль',
'В приготовлении пищи соль употребляется как важная специя. Соль имеет хорошо знакомый каждому человеку характерный вкус,
 без которого пища кажется пресной. Такая особенность соли обусловлена физиологией человека, но люди зачастую потребляют соли больше,
 чем необходимо для физиологических процессов. Сейчас существует множество экзотических сортов соли: копчёная французская, четверговая соль,
 чёрная лавовая, гималайская чёрная кала намак и санчал, перуанская розовая, гималайская розовая (добывается вручную в горах Гималаи,
 в основном в Пакистане и пр.); в некоторых ресторанах (например, в таиландском курортном Пхукете) существует даже специальность
 «солевой сомелье». В соли, поступающей в продажу, содержание NaCl составляет от 97 % (второй сорт) до 99,7 % (экстра),
 остальная доля приходится на различные примеси (сульфат натрия, хлорид калия и др.), а также зачастую добавки.
 Чаще всего добавляют йодиды и карбонаты, а в последние годы фториды. Добавка фторидов используется для профилактики зубных заболеваний.
 С 1950-х годов добавлять фторид в соль стали в Швейцарии.'
),
(5,
'Сахар',
'Распространённый продовольственный товар. Основной компонент сахара — сахароза. Но кроме неё продукт может содержать различные примеси.
 В белом сахаре допускается их содержание до 0,25 %, в рафинированном — до 0,1 %.'
),
(6,
'Гвоздика(Приправа)',
'Пряность, представляющая собой высушенные нераскрывшиеся бутоны (цветочные почки) тропического гвоздичного дерева (Syzygium aromaticum)
 из рода Сизигиум, иногда относимого к роду Евгения, семейства миртовых (Myrtaceae). Главным образом в кулинарии гвоздика применяется
 для приготовления маринадов (грибных, фруктово-ягодных, мясных, овощных, реже рыбных).
 Смеси пряностей, в которые входит гвоздика, используются в кондитерском, рыбоконсервном и колбасном производствах.
 Для приготовления сладких блюд (компотов, пудингов, кондитерских изделий) используется гвоздика или самостоятельно или в смеси с корицей.
 Лучше использовать головки (шляпки) гвоздики. В смеси с чёрным перцем гвоздика применяется при приготовлении тушёного мяса,
 баранины, свиных и мясных жирных фаршей, мясных крепких бульонов, а также соусов, подаваемых к домашней птице (курице, индейке).
 В этом случае для усиления жгучего качества пряности можно использовать только черешки. Время закладки гвоздики в различные блюда различается:
 в маринады — в процессе их приготовления вместе с другими компонентами; бульоны, супы, компоты — за 3—5 минут до готовности.
 Свой вкус и аромат гвоздика передает одинаково хорошо как горячим, так и холодным блюдам, но если вкус остаётся почти неизменным,
 то аромат при повышенной температуре быстро улетучивается. Поэтому для определения момента введения гвоздики в блюдо необходимо
 следовать простому правилу: чем более тонкий аромат необходимо получить, тем позже необходимо закладывать гвоздику.
 Там же, где закладка должна быть осуществлена до тепловой обработки, необходимо быть осторожным в дозировке, особенно в кондитерских изделиях.
 Противопоказана закладка гвоздики в блюда с длительной тепловой обработкой и ранней закладкой пряности, например, в плов.'
),
(7,
'Черный перец(горошек)',
'Чёрный перец, получается из подходящих к стадии созревания или ещё слегка недозревших ягод многолетнего вьющегося растения,
 вид рода Перец (Piper) семейства Перечные (Piperaceae). Способствует пищеварению и улучшает аппетит. Употребляется для супов,
 подливок, соусов, овощных салатов, маринадов, приготовления всех видов мяса, рыбы, томатов, консервированных овощей.'
),
(8,
'Черный душистый перец(горошек)',
'Душистый перец горошек — высушенный недозревший плод вечнозеленого тропического дерева — пименты.
 Душистый перец в виде горошка получается в результате сушки сине-зеленых ягод пименты. Специя из перца горошка острая, жгучая,
 придает особый аромат мясным блюдам, соусам и маринадам. Им ароматизируют консервы, добавляют в горчицу.
 Перец может быть отдельной специей или стать частью пряной смеси. Перемалывать перец стоит за несколько минут до подачи блюда,
 так как аромат быстро выветривается.'
),
(9,
'Лавровый лист',
'Лавро́вый лист — листья лавра благородного, использующиеся в кулинарии как пряность.
 В первые блюда лавровый лист добавляют за 5 минут до окончания их приготовления, во вторые блюда — за 10.
 По окончании приготовления блюда лавровый лист удаляют из него, во избежание появления нежелательной горечи.
 Порошок из лаврового листа добавляют в готовые соусы температурой до 40 °C. Лавровый лист добавляют в консервы.'
),
(10,
'Уксус(9%)',
'Продукт со значительным содержанием уксусной кислоты, традиционно получаемый в результате микробиологического синтеза с помощью
 уксуснокислых бактерий из пищевого спиртосодержащего сырья. Вещество, известное с глубокой древности.
 Бесцветная или слабо окрашенная прозрачная жидкость с резко-кислым вкусом и специфическим ароматом.
 Уксус делится на натуральный и синтетический. Широко применяется в кулинарии в качестве приправы.'
),
(11,
'Растительное масло',
'Продукты, извлекаемые из растительного сырья и состоящие из триглицеридов жирных кислот и сопутствующих им веществ
 (фосфолипиды, свободные жирные кислоты, воски, стеролы, вещества, придающие окраску и др.).
 Растительные масла являются важным пищевым продуктом. При относительно низкой себестоимости они обладают высокой пищевой ценностью,
 многие содержат незаменимые питательные вещества. Физиологической нормой потребления растительного масла считается 9-10 кг в год на человека,
 в виде пищевого продукта или в составе других жировых продуктов (маргарина, майонеза и др.).
 Растительные масла принято называть по виду исходного сырья, из которого они получены.'
),
(12,
'Говядина',
'Мясо домашних коров и быков (волов). Мясо молодняка называется телятина. В западноевропейской кулинарии строго различают мясо коров,
 быков и волов. Говядина является источником высококачественного белка и питательных веществ.'
),
(13,
'Помидор',
'Плоды томата употребляют в пищу свежими, варёными, жареными, консервированными, вялеными, из них готовят томат-пасту, томат-пюре,
 томатный сок, кетчуп и другие соусы, лечо. В Испании популярны холодные томатные супы — гаспачо, сальморехо.
 Наиболее богаты ликопином и другими питательными веществами сушёные томаты, которые добавляют в супы (как, например, чернослив).
 За 4—10 дня сушки на солнце томаты черри теряют 88 % своего веса, а крупноплодные помидоры — до 93 %.
 Чтобы получить килограмм сушёных томатов, требуется от 8 до 14 кг свежих плодов.'
),
(14,
'Перец болгарский',
'Зелёные и красные плоды перца используют в свежем и консервированном виде для фарширования (мясом и овощами), для приготовления лечо,
 как приправу для заправки супов, для приготовления блюд с тушёным мясом, различных национальных блюд, овощных салатов, соусов.
 Перец можно мариновать, запекать на гриле и солить.'
),
(15,
'Перец ласточка',
'Штамбовое полураскидистое растение, высотой 45 — 60 см. Плоды имеют конусовидную форму и плотную кожицу.
 Вес плода доходит до 100 г. Стенки толщиной до 7 мм. Цвет плода зависит от степени зрелости: салатовый — в технической,
 и красный — в биологической. Технологические и вкусовые качества зрелых плодов отличные.
 Этот перец подходит для консервирования и употребления в кулинарии, а также в свежем виде.
 Плотная кожица защищает плоды от повреждения при транспортировке и легких заморозков осенью,
 когда перец других сортов с более нежной кожей повреждается. Сладкий перец Ласточка ценится за повышенную пластичность:
 он с легкостью приспосабливается к капризам российской погоды. Также плотная кожица способствует долгому хранению урожая.'
),
(16,
'Картофель',
'Картофель варят как очищенным, так и неочищенным («в мундире»), что позволяет сохранить максимум полезных веществ.
 Его также готовят на углях или на пару, тушат, жарят во фритюре и без него. Картофель используется как в простых,
 так и в изысканных блюдах — для приготовления картофельного салата, картофельного пюре, супов, закусок вроде чипсов, дижестивов и даже десертов.
 В современной Исландии популярна водка, сделанная из картофеля. При стандартном пищевом рационе картофель —
 один из основных поставщиков калия в организм. Однако, чтобы сохранить содержащиеся в нём ценные вещества,
 нужно научиться правильно его готовить. Варить картофель рекомендуется в небольшом количестве воды:
 при варке в неё переходит бо́льшая часть витаминов. Также перед приготовлением не стоит держать картофель в воде в течение долгого времени.
 После долгого хранения на свету клубни зеленеют и становятся токсичными, непригодными к употреблению.'
),
(17,
'Перец чили',
'Семена и прожилки — это самая острая часть перца, поэтому если есть необходимость снизить остроту блюда, то их удаляют.
 Если кожица перцев слишком толстая, то её тоже желательно убрать. Маленькие плоды обжаривают на предварительно разогретой сковородке,
 переворачивая их, пока они не потемнеют и не размякнут. Также перцы можно опалить на газовой конфорке или запечь на сильном огне в духовке.
 Когда перцы почернеют, их кладут в пластиковый пакет или миску, закрытую пищевой плёнкой, и оставляют на 15 минут.
 После этого кожица легко отходит, и её легко можно снять руками.'
),
(18,
'Морковь',
'Корни и плоды дикой и культурной моркови могут быть использованы как пряность. Плоды, обладающие жгучим пряным вкусом,
 употребляют как приправу к кушаньям, используют в маринадах, ликёро-наливочном производстве.
 Испытаны и одобрены в качестве пряности при обработке рыбы. Плоды могут найти применение в консервной промышленности.
 Корнеплоды культурной моркови используют в пищу в сыром и варёном виде для приготовления первых и вторых блюд, пирогов, цукатов,
 маринадов, консервов, детских пюре и др. Из моркови получают морковный сок и каротин.
 У современных немецких и французских крестьян древний обычай хранить медовую морковь (так лучше сохраняются все полезные вещества)
 на случай болезни превратился в традиционное приготовление для каждого члена семьи одной такой моркови,
 подаваемой к столу как новогодний десерт: в наступающем году она якобы обеспечит хорошее здоровье.
 Ботва моркови содержит много витамина C: в 100 г листьев его 70 мг, в корнеплоде его не более 5 мг на 100 г.
 Для сохранения витамина C в корнеплоде рекомендуется варить морковь неочищенной и целиком, а после варки удалить кожицу.'
),
(19,
'Фасоль',
'Большинство разновидностей ядовито в сыром виде. Перед варкой фасоль рекомендуется замачивать в воде (8-10 часов).
 Это целесообразно делать по двум причинам: процесс замачивания размягчает бобы и возвращает им влагу, что уменьшает время варки;
 при замачивании в воде растворяются олигосахариды (сахара, которые не перевариваются в человеческом теле),
 вызывающие газообразование и осложняющие процесс пищеварения.'
),
(20,
'Паприка(Приправа)',
'Порошкообразная пряность из сладких (нежгучих или слабожгучих) сортов стручкового перца (Capsicum annuum).
 Это ароматный порошок, ярко-красного цвета, который обладает сладковатым вкусом с горчинкой.'
),
(21,
'Черный перец(Молотый)',
'Чёрный перец, получается из подходящих к стадии созревания или ещё слегка недозревших ягод многолетнего вьющегося растения,
 вид рода Перец (Piper) семейства Перечные (Piperaceae). Способствует пищеварению и улучшает аппетит. Употребляется для супов,
 подливок, соусов, овощных салатов, маринадов, приготовления всех видов мяса, рыбы, томатов, консервированных овощей.'
),
(22,
'Чеснок',
'Популярная овощная культура у многих народов по всему миру, что объясняется острым вкусом и характерным запахом,
 связанным с наличием в составе растения органических сульфидов (тиоэфиров). Дольки луковицы («зубчики») используются
 в качестве посевного материала, употребляются в пищу (в сыром или приготовленном виде, как приправа).
 Листья, стрелки и цветоносы также съедобны, употребляются в основном у молодых растений.'
),
(23,
'Петрушка',
'Листья и корни петрушки в сушёном и в свежем виде широко применяются для ароматизации в кулинарии и консервной промышленности.
 Получаемое из плодов и листьев эфирное масло используется при консервировании.
 Петрушка обладает пряным запахом, вкус — сладковато-пряный и терпкий.
 Более всего она используется для приготовления блюд из овощей, различных салатов и супов из мяса.
 Мелко нарезанную зелень или тёртый корень добавляют к отварной рыбе, дичи (главным образом птице), к майонезам и блюдам из картофеля.
 Во французской кухне популярна вымытая и обсушенная зелень петрушки, обжаренная в растительном масле.
 Ещё тёплой её подают к блюдам из рыбы и мяса.'
),
(24,
'Кукурузная мука',
'Кукурузная мука — мука из кукурузных зёрен, прошедших предварительную очистку, удаление оболочки и зародыша.
 Таким образом получают муку кукурузную обойную, крупного и тонкого помола.
 Мука наилучшего качества получается из белозёрной кукурузы. Жёлтозёрные сорта придают муке цветную окраску.
 Кукурузную муку применяют для приготовления каш, лепёшек, выпечки хлебобулочных изделий.'
),
(25,
'Сливки',
'Молочный продукт, получаемый из цельного молока путём сепарации жировой фракции.
 Используются для изготовления сливочного масла, сметаны, мороженого, потребляются в свежем виде.
 Сливки используют для изготовления сметаны и сливочного масла, а также приготовления разнообразных кулинарных изделий.
 Сливки входят в рецептуру некоторых супов-пюре, соусов, сладких блюд и кондитерских изделий.
 Жирные сливки легко и быстро взбиваются в густую пену и используются преимущественно для приготовления сладких блюд и кондитерских изделий.'
),
(26,
'Яблоки',
'Сочный плод яблони, который употребляется в пищу в свежем и запеченном виде, служит сырьём в кулинарии и для приготовления напитков.'
),
(27,
'Мука',
'Продукт питания, получаемый в результате перемалывания зёрен различных сельскохозяйственных культур, преимущественно злаковых.
 Мука применяется для выпечки хлеба, блинов, пирогов, при изготовлении пельменей, хлебобулочных, кондитерских
 (торты, кексы, печенья, вафли, пряники) и макаронных изделий, комбикормов, для приготовления клейстера и соусов.
 Также мука используется для панировки, например, рыбы или котлет. Рекомендуется просеивать муку перед использованием для подсушивания,
 разрыхления и обогащения воздухом, необходимым для хорошего брожения.'
),
(28,
'Сметана(домашняя)',
'Жидкий кисломолочный продукт белого цвета густой консистенции, получаемый из сливок и закваски.
 По степени жирности варьируется от 10 до обычно 30 (реже 58) %. Сметана в восточноевропейской (русской, украинской, белорусской)
 кухне — это наиболее популярный соус к первым блюдам (щам, борщу, солянке, окрошке, рассольнику, супу-лапше, другим супам),
 к блинам, оладьям и сырникам, к пельменям и вареникам, к голубцам и фаршированному перцу.
 Замечательное блюдо — отварной или тушёный молодой картофель, политый сметаной и посыпанный укропом.
 Сметану часто используют при тушении мяса (бефстроганов) и овощей. Хорошо известны караси в сметане, в сметане часто жарят также окуней и щук.
 Грибы в сметане — ещё одно весьма популярное блюдо. Сметаной заправляют салаты, особенно из свежих овощей;
 ею заменяют майонез в таких традиционных салатах как оливье или сельдь под шубой. Сметану часто используют при выпечке,
 добавляя её в тесто и готовя на её основе сметанный крем для тортов. Она часто входит как компонент в пудинги, запеканки и пироги-сметанники.
 Сметаной заправляют также творог и реже фрукты и ягоды, её подают к печёным яблокам.
 В эстонской кухне крайне популярны сельдяные закуски в сметане: сильд хапукоорега (сельдама),
 её используют для заправки традиционной молдавской мамалыги и супа «чорба», а также при приготовлении греческого
 и балканского мясного блюда «мусака». В кухнях северокавказских народов на основе сметаны готовят разнообразные острые соусы.'
),
(29,
'Грибы',
'Существует множество съедобных грибов, выращиваемых и собираемых во всём мире. Грибы обладают специфическими вкусом и запахом,
 некоторые из них являются деликатесами и имеют очень высокую цену.'
),
(30,
'Кориандр(Приправа)',
'Семена кориандра находят широкое применение как пряность для ароматизации и витаминизации колбас, сыра, мясных и рыбных консервов,
 маринадов (прежде всего, для мяса, а также солений и ликёров), добавляются при выпечке бородинского хлеба, кондитерских и кулинарных изделий,
 а также при изготовлении некоторых сортов пива и ликёров (в Германии). Плоды можно использовать при солении мяса, особенно свинины.'
),
(31,
'Уксус яблочный',
'Яблочный уксус – это кислота, образующаяся в процессе брожения яблочного сока. На первом этапе образуется сидр – яблочное вино,
 а на втором этапе уксусные бактерии взаимодействуют с кислородом и окисляют напиток, образуя уксус.'
),
(32,
'Лук репчатый красный',
'Красный лук – это разновидность репчатого лука. Он отличается красно-фиолетовой кожурой и белой мякотью с оттенками пурпурного.
 Луковицы небольшого размера, и их вкус мягкий, сладковатый без характерной горечи.'
),
(33,
'Укроп',
'Укроп обладает сильным пряным освежающим вкусом и запахом. Используется в свежем, сушеном или соленом виде.
 Для консервирования овощей, приготовления ароматного уксуса используется укроп в фазе цветения или плодоношения.
 Сушеный укроп употребляется в различных смесях пряностей и для приготовления блюд.
 Молодые листья укропа используют как вкусовую ароматическую приправу к горячим и холодным блюдам, солят и сушат впрок;
 зелень и плоды — для отдушки кондитерских изделий, чая, маринадов, солений, квашеной капусты.
 Растение содержит фитонциды и при засолке овощей не только придает им специфический вкус, но и предохраняет от плесени и порчи.
 Эфирное масло укропа широко применяют в пищевой, консервной, ликеро-водочной и мыловаренной промышленности.'
),
(34,
'Крабовые палочки',
'Вид продуктов, которые создаются искусственно из обработанного рыбного белка сурими или измельчённого мяса белой рыбы.
 По форме и цвету напоминает мясо крабьей клешни или ноги.
 В основном крабовые палочки используются в салатах как недорогой заменитель настоящего крабового мяса или как недорогой источник рыбного белка.
 Они зачастую входят в состав популярных роллов «Калифорния». Могут стать горячей закуской, например, приготовленные в кляре.
 А также используются как самостоятельная готовая закуска, в виде снэков.'
),
(35,
'Кукуруза консервированная',
'Консервы, вырабатываемые из сахарной кукурузы желтозерных и белозерных сортов, залитой раствором сахара и соли.'
),
(36,
'Яйца',
'Распространённый пищевой продукт. В силу доступности в настоящее время самыми распространёнными в употреблении являются куриные яйца,
 хотя любые птичьи яйца могут быть употреблены в пищу человеком. Кроме этого, существует практика употребления яиц некоторых рептилий
 (например, черепах). Несмотря на пищевую ценность яиц, их потребление может нанести вред здоровью в связи с возможностью заражения
 сальмонеллой или аллергией на яичные белки. В целях предупреждения инфекций (сальмонеллёзы) предпочтительно использовать яйца
 после тепловой обработки. Безопасное употребление в пищу сырых яиц основано на том, что белок сворачивается при температуре 63 °C,
 в то время как сальмонеллы погибают уже при 55 °C. Яйцо, выдержанное должное время в этом интервале температур,
 можно употреблять как отдельное блюдо или в составе майонеза, гоголь-моголя, крема тирамису и др. Перед тем как приготовить яйцо,
 его необходимо промыть, чтобы очистить яйцо от грязи и вредных организмов. Промывается яйцо тёплой водой температуры порядка 45 °C.
 При промывке яйца тёплой водой внутри него создаётся давление, которое препятствует проникновению внутрь бактерий и частичек грязи.
 При использовании холодной воды эффект от промывания водой может быть обратным. Использование яиц водоплавающих птиц имеет ряд ограничений.
 Обработка яйца, используемого для приготовления блюд, осуществляется в отведённом месте в специальных промаркированных ёмкостях
 в следующей последовательности: тёплым раствором кальцинированной соды (1—2 %), раствором хлорамина (0,5 %) или другими разрешёнными
 для этих целей моющими и дезинфицирующими средствами, после чего ополаскивают холодной проточной водой.
 Чистое яйцо выкладывают в чистую промаркированную посуду.'
),
(37,
'Сыр',
'Пищевой продукт в виде твёрдой или полутвёрдой массы, получаемый в процессе сыроделия из заквашиваемого особым способом молока.'
),
(38,
'Майонез',
'Холодное блюдо, приготовленное из растительного масла, яичного желтка, горчицы, уксуса (или лимонного сока), соли и сахара.'
);
#------------------------------------------------------------------------
INSERT INTO recipe (recipe_id, title, description)
VALUES 
(
1,
'Маринованые вешанки',
'Грибы хорошо помыть, нарезать или оставить целыми - как предпочитаете. 
При дальнейшей термической обработке грибы уменьшатся в объеме. 
Чеснок мелко нарезать. Вскипятить воду, добавить все специи. 
Добавить уксус и растительное масло. 
В кастрюлю добавить все грибы и варить 25 минут. 
Все специи можно поместить в маленький заварничек для чая, очень удобно потом их удалить, 
чтобы не попадались при еде. 
Вешенки можно кушать, как только они полностью остынут. 
Будет ещё вкуснее, если их охладить в холодильнике. 
Подавать маринованные вешенки с луком и мелко нарезанным укропом.'
),
(
2,
'Бограч',
'Заранее отрезал грамм 300 от говядины и отварил бульона. 
Остальную часть мяса нарезал порционно и посыпав паприкой оставил отдыхать. 
Помидоры обесшкуриваем. Картошку нарезаем крупными дольками. 
Лук репчатый - полукольцами. Морковку - кружочками. 
Прокалив масло, закидываем лук, обжариваем. 
Затем добавляем пару столовых ложек паприки в масло и лук, и сразу размешиваем. 
В это дело кидаем наше мясо. (Мясо из бульона тоже.). 
Затем морковку. Через какое-то время грузим остальные овощи. Перцы. 
Фасоль, помидоры. Перемешиваем, солим чутка. 
И заливаем бульоном так, чтобы только-только покрывало, должно быть очень густо, как гуляш. 
Кидаем острый перец и закрываем крышкой. 
Убавляем огонь, пусть парится-тушится, пока у вас сила воли не кончится)) 
Самое время выпить стопочку и заняться картошкой и чесноком. 
Минут через 40-60 открываем казан, докидываем картошку, доливаем оставшийся бульон. 
Выправляем на соль и закрываем снова. 
Когда картошка сварится, добавляем чеснок и петрушку. Все готово!'
),
(
3,
'Банош',
'Сначала приготовим грибную зажарку. Грибы моем, режем.
На сковороде разогреваем растительное масло. Жарим грибы, помешивая, на среднем огне 20 минут. 
Приступаем к приготовлению баноша. Выливаем сметану в кастрюлю. Можно немного развести водой. 
Сметану нужно брать домашнюю, так как магазинная, скорее всего, свернется при кипячении. 
Доводим сметану до кипения. Убавляем огонь до слабого (но так, чтобы сметана продолжала кипеть). 
Тонкой струйкой, интенсивно размешивая ДЕРЕВЯННОЙ ложкой или лопаткой, всыпаем кукурузную муку. 
Солим и продолжаем варить банош и непрерывно размешивать по кругу. 
Примерно через 5-8 минут на поверхности выступит масло. Снимаем банош с огня. 
Посыпаем банош грибной поджаркой и сразу же подаем на стол.'
),
(
4,
'Крабовый салат',
'Яйца вымыть, выложить в казанок, залить холодной водой, посолить, довести до кипения. 
Сварить вкрутую на среднем огне (10 минут). 
Открыть баночку кукурузки, слить жидкость. 
Твердый сыр натереть на терке. 
Яйца очистить, нарезать кубиками. 
Крабовые палочки нарезать. 
Все ингредиенты выложить в миску, можно по вкусу посолить. Добавить майонез. Перемешать.'
);
#------------------------------------------------------------------------
INSERT INTO ingredient_count (count_id, recipe_id, ingredient_id, count_num, count_val)
VALUES
#Маринованые вешанки
(1, 1, 1, 700, 'грамм'),
(2, 1, 22, 5, 'зубчиков'),
(3, 1, 3, 150, 'мл'),
(4, 1, 4, 1, 'ч.ложка'),
(5, 1, 5, 1.5, 'ч.лошки'),
(6, 1, 8, 4, 'шт'),
(7, 1, 7, 10, 'шт'),
(8, 1, 9, 2, 'шт'),
(9, 1, 6, 2, 'шт'),
(10, 1, 30, 1, 'ч.ложки'),
(11, 1, 31, 3, 'ст.ложки'),
(12, 1, 11, 3, 'ст.ложки'),
(13, 1, 32, NULL, NULL),
(14, 1, 33, NULL, NULL),
    
#Бограч
(15, 2, 12, 1, 'кг'),
(16, 2, 13, 4, 'шт'),
(17, 2, 14, 3, 'шт'),
(18, 2, 15, 4, 'шт'),
(19, 2, 16, NULL, NULL),
(20, 2, 17, 1, 'шт'),
(21, 2, 18, 3, 'шт'),
(22, 2, 2, 4, 'шт'),
(23, 2, 19, NULL, NULL),
(24, 2, 11, NULL, NULL),
(25, 2, 3, NULL, NULL),
(26, 2, 20, NULL, NULL),
(27, 2, 4, NULL, NULL),
(28, 2, 21, NULL, NULL),
(29, 2, 22, NULL, NULL),
(30, 2, 23, NULL, NULL),

#Банош
(31, 3, 24, 250, 'грамм'),
(32, 3, 28, 900, 'мл'),
(33, 3, 3, 200, 'мл'),
(34, 3, 4, 1.5, 'ч.ложки'),
(35, 3, 29, 200, 'грамм'),
(36, 3, 11, 4, 'ст.ложки'),

#Крабовый салат
(37, 4, 34, 240, 'грамм'),
(38, 4, 35, 340, 'грамм'),
(39, 4, 36, 4, 'шт'),
(40, 4, 37, 200, 'грамм'),
(41, 4, 38, 150, 'грамм'),
(42, 4, 4, NULL, NULL);