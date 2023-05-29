-- https://docs.spring.io/spring-boot/docs/current/reference/html/howto.html#howto.data-initialization.using-basic-sql-scripts

-- userToLoadData roles
INSERT INTO roles (name)
VALUES ('ADMIN');
INSERT INTO roles (name)
VALUES ('MODERATOR');
INSERT INTO roles (name)
VALUES ('USER');

-- some test users
INSERT INTO users (age, full_name, level, password, username, is_active)
VALUES (28, 'Admin Adminov', 'ADVANCED', 'c913a18156216753ae76a971fcdc5122c889107f70bc278927a73e9010085009c4b689074ac561a1', 'admin', true);

INSERT INTO users (age, full_name, level, password, username, is_active)
VALUES (29, 'Moderator Moderatorov', 'INTERMEDIATE', 'c913a18156216753ae76a971fcdc5122c889107f70bc278927a73e9010085009c4b689074ac561a1', 'moderator', true);

INSERT INTO users (age, full_name, level, password, username, is_active)
VALUES (30, 'UserRoles Userov', 'BEGINNER', 'c913a18156216753ae76a971fcdc5122c889107f70bc278927a73e9010085009c4b689074ac561a1', 'userToLoadData', true);

INSERT INTO users (age, full_name, level, password, username, is_active)
VALUES (33, 'Ivan Ivanov', 'BEGINNER', 'c913a18156216753ae76a971fcdc5122c889107f70bc278927a73e9010085009c4b689074ac561a1', 'ivan', true);
-- userToLoadData roles
-- admin
INSERT INTO users_roles (`user_id`, `roles_id`)
VALUES (1, 1);
INSERT INTO users_roles (`user_id`, `roles_id`)
VALUES (1, 2);
INSERT INTO users_roles (`user_id`, `roles_id`)
VALUES (1, 3);
-- moderator
INSERT INTO users_roles (`user_id`, `roles_id`)
VALUES (2, 2);
INSERT INTO users_roles (`user_id`, `roles_id`)
VALUES (2, 3);
-- userToLoadData
INSERT INTO users_roles (`user_id`, `roles_id`)
VALUES (3, 3);
-- userToLoadData 2
INSERT INTO users_roles (`user_id`, `roles_id`)
VALUES (4, 3);
INSERT INTO users_roles (`user_id`, `roles_id`)
VALUES (4, 2);
INSERT INTO users_roles (`user_id`, `roles_id`)
VALUES (4, 1);

-- categories
INSERT INTO categories (id, description, name)
VALUES ('1', 'Tracks for pedestrians.', 'PEDESTRIAN');
INSERT INTO categories (id, description, name)
VALUES ('2', 'Tracks for cars.', 'CAR');
INSERT INTO categories (id, description, name)
VALUES ('3', 'Tracks for motorcycles.', 'MOTORCYCLE');
INSERT INTO categories (id, description, name)
VALUES ('4', 'Tracks for bicycles.', 'BICYCLE');


-- routes
INSERT INTO routes (name, description, region, level, author_id)
VALUES
    ('Връх Кумата',
     'Един от най-удобните изходни пунктове за изкачване на Черни връх (2290 м) във Витоша е хижа Кумата.
    Оттук преходът е сравнително лек и не толкова натоварен, колкото маршрутите от хотел Морени или от хижа Алеко.
    Хижата е достъпна с автомобил по всяко време на годината, което също обуславя туристическия маршрут от нея като един
    от най-популярните към първенеца на Витоша. Освен това не е и много дълъг – около 2 часа. До хижа Кумата се достига по
    20-километров автомобилен път от квартал Бояна в София. Може и с пешеходен преход от Златните мостове или селата в подножието.
    Туристическата маркировка е отлична и трудно може да се объркате. Следва се синята лентова, която през почти цялото време се движи
    заедно със зимната стълбова маркировка. Освен всичко пътеката е доста отъпкана и ясна. Вода има на хижата, както и в местността Конярника,
    който се намира в началото. След това има чак в заслона на Черни връх, но имайте предвид, че ако правите прехода през седмицата,
    може да не е отворен. Лятно време е хубаво да се запасите, защото се движим изцяло на открито по платото. Теренът е мек почвен,
    а горе се върви покрай резерват Торфено бранище, което значи, че може да има по-мочурливи места във влажните периоди. Имайте предвид,
    че високите части на Витоша много често са ветровити и дори долу да ви е топло, задължително носете ветровка.',
     'Blagoevgrad',
     'BEGINNER', 1);


INSERT INTO routes (name, description, region, level, author_id)
VALUES
    ('Веломаршрут „ВелоЕрул“',
     'Кръговият веломаршрут “ВелоЕрул” е чудесна инициатива, реализирана от Трънско туристическо дружество в края на лятото на 2019 г. Един маршрут за всеки! По-голямата част от него е подходяща за всякакви колоездачи, включително такива без опит, които обичат да карат сред природата. Предвиден е и сегмент, който включва спускания за по-опитните. Освен села и красиви планински гледки, по трасето (и на кратки отбивки от него) има няколко манастира, два интересни музея и дори две био ферми. Със сигурност ще се заплените от красотата на този край по склоновете на Ерулска планина, които обикаляме по черни и асфалтови пътища, горски пътеки и селски райони. Достигаме и до най-високото населено място в община Трън, намиращо се на около 1200 м. надморска височина – село Ерул.',
     'Blagoevgrad',
     'INTERMEDIATE', 1);

INSERT INTO routes (name, description, region, level, author_id)
VALUES
    ('хижа Алеко – връх Черни връх',
     'Туристическият маршрут до връх Черни връх в този GPS трак е с изходен пункт хижа Алеко и е един от най-популярните подходи за най-високия връх на Витоша. Черни връх е, може би, най-изкачваният връх в България, тъй като се намира само на няколко километра от София, а и също така, понеже преходът до горе е сравнително лесен, особено ако тръгнем от хотел Морени. В случая нашата отправна точка е хижа Алеко. Оттук пътеката е малко по-кратка, но за сметка на трудността. В този трак ще минем по червената маркировка, която криволичи, за да може наклонът на изкачване да бъде сравнително малък. За по-правия маршрут може да прочетете тук. Общата денивелация е близо 500 м.',
     'Blagoevgrad',
     'ADVANCED', 1);

INSERT INTO routes (name, description, region, level, author_id)
VALUES
    ('АЕК "Етъра" – връх Шипка',
     'По маршрута от Етъра до връх Шипка срещнах няколко смесени групи от възрастни с деца. Това потвърждава впечатлението ми, че маршрутът е подходящ и за тях. Началото на пътеката е точно срещу входа на комплекс „Етъра“, от другата страна на пътя. Първите стъпки са сякаш в нищото, но само след малко се влиза в гората, където пътеката е ясна и прави маркировката почти излишна. А тя е отлична и почти през целия преход е синя и зелена. Към края ползваме шосето на Шипченския проход само със сини маркери, а за капак може да се качим и без маркировка по стъпалата до паметника на връх Шипка, ако имаме още крака.След първоначалното изкачване в гората над Етъра, излизаме на асфалтиран път, който преминава покрай Соколския манастир. Скоро след него пътят става черен, а след това преминава в пътека. След час и половина пресичаме асфалтов път и отново продължаваме в гората. До излизане на шосето на прохода ни остават още около 1 час и 15 минути, а оттам до връх Шипка е само половин час. Има две чешми по пътя. Първата е малко след Соколския манастир, точно на пътеката. Другата е в подножието на върха, за която трябва да се отделите от пътеката. Разбира се, на паркинга под върха може да си купите вода от заведенията, ако се наложи. Маршрутът ви осигурява доста сянка, освен в последния пасаж по шосето, но той е кратък.',
     'Blagoevgrad',
     'BEGINNER', 1);


INSERT INTO routes (name, description, region, level, author_id)
VALUES
    ('Аладжа манастир – Златни пясъци – жълт',
     'Туристическият маршрут от Алажда манастир до плажът на Златни пясъци е една хубава ободряваща разходка през горските пътеки на Природен парк Златни пясъци. Началото му е от чешмата на паркинга на Аладжа манастир, откъдето тръгват и останалите няколко прехода. Нито един от тях не е тежък и изключение не прави нашият, който следва жълтата маркировка. На свой ред тя е много добра и не ви дава шанс да се изгубите. Изминава се за не повече от час и половина спокоен ход и е вторият най-къс в местността след този по синия. Ние го направихме в двете посоки, за да се разтъпчем повече и така се получава много добре. На отиване е надолнище, което значи, че ако искате някакво натоварване трябва да го изминете и наобратно.

Тръгва се по малка, застлана с плочи пътека, докато стигнем заграден двор, където свършва асфалта, на чиято ограда можем да прочетем изповедта на гората. Малко след това достигаме до първата беседка по пътя, от която се разкрива гледка към морето, но за жалост клоните на отсрещните дървета са израсли прекалено много и закриват голяма част от нея. Тръгваме надолу по ясно различимата пътека, която остава такава през целия преход. Не след дълго достигаме до първия разклон, където завиваме надясно. Малко преди чешмата “Свети Седмочисленици” минаваме през една малко по-голяма стръмнинка, която може да е препятствие единствено при много влажна почва.

Край чешмата има изградени маси с пейки, където всеки може да почине и да хапне, заобиколен от няколко дървета с интересна форма. По време на почивката може да се запознаете и с кратка история на чешмата, написана на табела до нея.

Стотина метра по-късно е вторият разклон, по-който отново поемаме надясно. Оттук започва бавно и постепенно слизане към Златни пясъци. След няколко крачки се натъкнахме на красива естествена градинка край пътеката, осеяна с минзухари. Продължаваме само надолу и на следващия разклон поемаме вляво, към ресторант Горски кът. Минаваме покрай него и излизаме на обширен паркинг. Прекосяваме го и тръгваме по следващата застлана с камъни пътека, която ни отвежда точно до КПП-то на комплекса. От него вървим само надолу и след преминаване покрай няколко хотела се намираме на плажа, където ще се полюбуваме на морето.',
     'Blagoevgrad',
     'ADVANCED', 1);

INSERT INTO routes_categories VALUES (1,1);
INSERT INTO routes_categories VALUES (1,2);
INSERT INTO routes_categories VALUES (2,1);
INSERT INTO routes_categories VALUES (2,2);
INSERT INTO routes_categories VALUES (2,3);
INSERT INTO routes_categories VALUES (3,1);
INSERT INTO routes_categories VALUES (3,2);
INSERT INTO routes_categories VALUES (4,1);
INSERT INTO routes_categories VALUES (4,2);
INSERT INTO routes_categories VALUES (4,3);
INSERT INTO routes_categories VALUES (4,4);
INSERT INTO routes_categories VALUES (5,1);
INSERT INTO routes_categories VALUES (5,2);



INSERT INTO pictures(title, url, author_id, route_id)
VALUES ('Kumata', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630581072/d47iy8kxv6qni8euhojk.jpg', 1, 1);

INSERT INTO pictures(title, url, author_id, route_id)
VALUES ('Kumata', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630581072/d47iy8kxv6qni8euhojk.jpg', 1, 1);

INSERT INTO pictures(title, url, author_id, route_id)
VALUES ('Velo Erul', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630581418/tqhjrinmsb69ev7upg0q.jpg', 1, 2);

INSERT INTO pictures(title, url, author_id, route_id)
VALUES ('Velo Erul 2', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630582448/oowojgn4lagybkvv20jb.jpg', 1, 2);

INSERT INTO pictures(title, url, author_id, route_id)
VALUES ('Aleko', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630582596/tclvroyrkcfbz98yklmc.jpg', 1, 3);

INSERT INTO pictures(title, url, author_id, route_id)
VALUES ('Aleko 2', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630582767/ukdmkxyvlnani3hzaafi.jpg', 1, 3);

INSERT INTO pictures(title, url, author_id, route_id)
VALUES ('Shipka', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630583376/en6lxhaddbvhf1ksybbu.jpg', 1, 4);

INSERT INTO pictures(title, url, author_id, route_id)
VALUES ('Shipka 2', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630583467/koncyanx4gqwzt9vxgx4.jpg', 1, 4);


 INSERT INTO pictures(title, url, author_id, route_id)
 VALUES ('Aladja Manastir', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630583842/qabnwpgq3pp1cui19nn5.jpg', 1, 5);

INSERT INTO pictures(title, url, author_id, route_id)
VALUES ('Aladja Manastir 2', 'http://res.cloudinary.com/ch-cloud/image/upload/v1630584095/aznlgfzoxpuvl5belukb.jpg', 1, 5);