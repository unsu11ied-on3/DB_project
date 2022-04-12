CREATE TABLE Roles(
role_id DECIMAL(12) PRIMARY KEY,
name    VARCHAR(25) NOT NULL
);

CREATE TABLE Users(
user_id       DECIMAL(12)  PRIMARY KEY,
first_name    VARCHAR(25)   NOT NULL,
last_name     VARCHAR(25)   NOT NULL,
login         VARCHAR(25),
passwords     VARCHAR(25)  NOT NULL,
city          VARCHAR(25),
email         VARCHAR(50)   NOT NULL,
address	VARCHAR(50)
);

ALTER TABLE Users ADD COLUMN  code VARCHAR(50);
ALTER TABLE Users ALTER login SET NOT NULL;


CREATE TABLE User_role(
role_id  DECIMAL(12),
FOREIGN KEY (role_id ) REFERENCES Roles(role_id ),
user_id  DECIMAL(12), 
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Coupon(
code       VARCHAR(50),
sales       DECIMAL(5)   	 
);
ALTER TABLE Coupon ADD PRIMARY KEY (code);


CREATE TABLE delivery_company(
company          	VARCHAR(50) PRIMARY KEY,
price   INT      NOT NULL,
numbers_of_day   	DECIMAL(3) NOT NULL
);

CREATE TABLE Order_Cart(
order_cart_id  DECIMAL(12),
total_price	INT,
order_status VARCHAR(50)  NOT NULL,
date_from DATE  NOT NULL,
user_id    	DECIMAL(12),
FOREIGN KEY (user_id) REFERENCES Users(user_id),
company	VARCHAR(50),
FOREIGN KEY (company) REFERENCES delivery_company(company)
);
ALTER TABLE Order_Cart ADD PRIMARY KEY (order_cart_id );


CREATE TABLE Payment(
payment_id     DECIMAL(12) PRIMARY KEY,
order_cart_id           DECIMAL(12),
FOREIGN KEY (order_cart_id) REFERENCES Order_cart(order_cart_id ),
user_id           DECIMAL(12),
FOREIGN KEY (user_id) REFERENCES Users(user_id ),
card_number   DECIMAL(16),
date_from        DATE,
total_price        INT
);


CREATE TABLE Product_photo(
photo_id DECIMAL(12) PRIMARY KEY,
url           TEXT 
);

CREATE TABLE Categories(
category_id  DECIMAL(12)  PRIMARY KEY,
category_name VARCHAR(25) NOT NULL,
description VARCHAR(25)	    NOT NULL
);
ALTER TABLE Categories DROP COLUMN description;

CREATE TABLE Subcategory(
subcategory_id DECIMAL(12) PRIMARY KEY,
name VARCHAR(50)   NOT NULL,
category_id  DECIMAL(12) ,
FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Author(
author_id DECIMAL(12) PRIMARY KEY,
author_name TEXT
);

CREATE TABLE Products(
product_id   DECIMAL(12) PRIMARY KEY,
name           VARCHAR(255) NOT NULL,
author_id     DECIMAL(12),
FOREIGN KEY (author_id) REFERENCES Author(author_id),
price             INT NOT NULL,
photo_id       DECIMAL(12) ,
FOREIGN KEY (photo_id) REFERENCES Product_photo(photo_id),
subcategory_id  DECIMAL(12), 
FOREIGN KEY (subcategory_id ) REFERENCES Subcategory(subcategory_id )
);
ALTER TABLE Products RENAME COLUMN name TO product_name;
ALTER TABLE Products ALTER photo_id DROP NOT NULL;




CREATE TABLE Order_details(
quantity          INT,
order_cart_id DECIMAL(12) ,
FOREIGN KEY (order_cart_id)  REFERENCES Order_cart(order_cart_id),
product_id      DECIMAL(12),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Roles(role_id, name)
VALUES (1, 'Administrator'),(2,'Moderator'),(3,'User'),(4,'Guest');

INSERT INTO Users(user_id,first_name, last_name, login, passwords, city, address, email)
VALUES
(10, 'Lita', 'Gianotti', 'lgianotti9', 'sM0XaPhd', 'Nur-Sultan','ул. Пушкина 76, кв. 23', 'lgianotti9@jugem.jp'),
(11, 'Leon', 'Masser', 'lmassera', 'LMkjXVX70', 'Kokshetau','ул. Пушкина 100', 'lmassera@weebly.com'),
(12, 'Dorise', 'McLese', 'dmcleseb', 'eUedpalY', 'Shymkent','ул. Пушкина 13, кв. 55' ,'dmcleseb@wordpress.org'),
(13, 'Garald', 'Racine', 'gracinec', 'gba3uawou', 'Semey', 'ул. Пушкина 11, кв. 39' , 'gracinec@arstechnica.com'),
(14, 'Saxon', 'Bault', 'sbaultd', 'OH6M71', 'Kyzylorda','ул. Абая 72, кв. 23','sbaultd@ebay.co.uk'),
(15, 'Pattie', 'Bradwell', 'pbradwelle', 'ADYAKQ', 'Kokshetau','ул. Абая 64, кв. 6','pbradwelle@123-reg.co.uk'),
(16, 'Davita', 'Giottini', 'dgiottinif', 'kDM5vZ', 'Nur-Sultan','ул. Абая 10, кв. 3', 'dgiottinif@intel.com'),
(17, 'Daveta', 'Boone', 'dbooneg', '3qODAfpS', 'Kokshetau','ул. Абая 1, кв. 76', 'dbooneg@google.pl'),
(18, 'Archie', 'Ipsly', 'aipslyh', 'dqB2ef', 'Aktobe','ул. Абая 54, кв. 149', 'aipslyh@wikipedia.org'),
(19, 'Laurianne', 'Mattack', 'lmattacki', 'Owst7CmP', 'Kokshetau','ул. Байтурсынова 55, кв. 100' ,'lmattacki@gravatar.com'),
(20, 'Carmon', 'Hercules', 'cherculesj', 'kHDi90fQ4', 'Aktobe','ул. Момышулы 64, кв. 5', 'cherculesj@businesswire.com'),
(21, 'Brandyn', 'Chace', 'bchacek', 'st2rFXB', 'Nur-Sultan','ул. Момышулы 12, кв. 86', 'bchacek@thetimes.co.uk'),
(22, 'Ernest', 'Hundell', 'ehundelll', 'ZRgjxvquRCS', 'Nur-Sultan','ул. Пушкина 63, кв. 12', 'ehundelll@wikimedia.org'),
(23, 'Sonny', 'Gullick', 'sgullickm', 'qtW87MkkQ', 'Semey','ул. Момышулы 22, кв. 98', 'sgullickm@cmu.edu'),
(24, 'Eveleen', 'MacColm', 'emaccolmn', 'Kyzylorda', 'Aktobe','ул. Момышулы 87, кв. 213', 'emaccolmn@ifeng.com'),
(25, 'Noni', 'Kyd', 'nkydo', 'lG5LV60g1aO', 'Semey','ул. Байтурсынова 11, кв. 150', 'nkydo@admin.ch'),
(26, 'Thea', 'Caldecot', 'tcaldecotp', 'nkDZXo', 'Nur-Sultan','ул. Момышулы 86, кв. 223', 'tcaldecotp@last.fm'),
(27, 'Aubert', 'Jiroutka', 'ajiroutkaq', 'FPjqWX8Qt', 'Nur-Sultan','ул. Пушкина 87, кв. 9', 'ajiroutkaq@jigsy.com'),
(28, 'Odo', 'Greatreax', 'ogreatreaxr', 'RGWhhHIyId', 'Nur-Sultan','ул. Момышулы 59, кв. 52', 'ogreatreaxr@apache.org'),
(29, 'Joeann', 'Holborn', 'jholborns', 'sCQlSAZ', 'Nur-Sultan','ул. Момышулы 29, кв. 54','jholborns@china.com.cn'),
(30, 'Cicily', 'Head', 'cheadt', 'dYbZiaMQROE', 'Kokshetau','ул. Сейфуллина 72', 'cheadt@senate.gov'),
(31, 'Gretal', 'Philipsohn', 'gphilipsohnu', '915UpH', 'Semey','ул. Сейфуллина 12, кв. 52', 'gphilipsohnu@google.com.hk'),
(32, 'Constanta', 'Merman', 'cmermanv', 'A0SzCZ8As1i', 'Nur-Sultan','ул. Пушкина 23, кв. 8','cmermanv@trellian.com'),
(33, 'Ree', 'Le Estut', 'rleestutw', 'rIBN86roOABR', 'Kyzylorda','ул. Сейфуллина 2, кв. 62', 'rleestutw@weibo.com'),
(34, 'Arnie', 'Bembrigg', 'abembriggx', 'GzDXmK70ZWe', 'Nur-Sultan','ул. Сейфуллина 76, кв. 74', 'abembriggx@uiuc.edu'),
(35, 'Norbert', 'Gocke', 'ngockey', 'qCXlqLTDF6vY', 'Semey','ул. Сейфуллина 56, кв. 12', 'ngockey@sun.com'),
(36, 'Lissie', 'Gerardin', 'lgerardinz', 'Kyzylorda', 'Shymkent','ул. Панфилова 64, кв. 65', 'lgerardinz@istockphoto.com'),
(37, 'Germana', 'Blincko', 'gblincko10', 'RcNYK3tSJC', 'Kokshetau','ул. Панфилова 6, кв. 23', 'gblincko10@umich.edu'),
(38, 'Ame', 'Moynham', 'amoynham11', 'bJMepgnwVad', 'Kyzylorda', 'ул. Кенесары 115, кв. 233',  'amoynham11@foxnews.com'),
(39, 'Reggis', 'Fotheringham', 'rfotheringham12', '0Ww52vRzt', 'Kokshetau', 'ул. Ауэзова 11, кв. 56', 'rfotheringham12@simplemachines.org'),
(40, 'Dionisio', 'Cymper', 'dcymper13', 'u1o8pV4fN', 'Aktobe','ул. Панфилова 12А, кв. 63', 'dcymper13@flickr.com'),
(41, 'Kellen', 'Christophle', 'kchristophle14', 'q7DJOk', 'Nur-Sultan', 'ул. Богенбай батыр 11, кв. 56','kchristophle14@tuttocitta.it'),
(42, 'Orsa', 'Orehead', 'oorehead15', 'axMg1wID', 'Nur-Sultan','ул. Панфилова 51, кв. 2', 'oorehead15@yellowbook.com'),
(43, 'Krystalle', 'Bitterton', 'kbitterton16', 'MtLV6o4A1qJ', 'Kokshetau','ул. Панфилова 23', 'kbitterton16@wiley.com'),
(44, 'Sutherlan', 'Scully', 'sscully17', 'VB2iEHyZBF0', 'Kokshetau','ул. Уалиханова 12, кв. 15','sscully17@taobao.com'),
(45, 'Essie', 'Healks', 'ehealks18', 'MSgPrgObipG', 'Kokshetau','ул. Ауэзова 62, кв. 75', 'ehealks18@jiathis.com'),
(46, 'Raf', 'Petrakov', 'rpetrakov19', '9uRcY5vDfpQ', 'Semey','ул. Уалиханова 52, кв. 23','rpetrakov19@prnewswire.com'),
(47, 'Reina', 'Weatherburn', 'rweatherburn1a', 'rGVcMvuy', 'Kokshetau', 'ул. Кенесары 1', 'rweatherburn1a@hatena.ne.jp'),
(48, 'Carolus', 'Yateman', 'cyateman1b', 'XYGCSt1ir', 'Kokshetau','ул. Уалиханова 52, кв. 52', 'cyateman1b@indiatimes.com'),
(49, 'Alina', 'Clingan', 'aclingan1c', 'BL0n3w', 'Semey','ул. Уалиханова 75, кв. 2', 'aclingan1c@liveinternet.ru'),
(50, 'Erinna', 'Bartoli', 'ebartoli1d', 'EQpi8xygh', 'Semey','ул. Ауэзова 70', 'ebartoli1d@purevolume.com'),
(51, 'Mildred', 'Daouse', 'mdaouse1e', 'unD3UjuxY7kn', 'Kyzylorda', 'ул. Богенбай батыр 105','mdaouse1e@yandex.ru'),
(52, 'Olimpia', 'Blanchard', 'oblanchard1f', 'IdZz061imlgZ', 'Almaty','ул. Желтоксан 22, кв. 32','oblanchard1f@ucoz.com'),
(53, 'Adolf', 'Lightowler', 'alightowler1g', 'VvtkpHkJe', 'Kokshetau', 'ул. Ауэзова 111, кв. 14','alightowler1g@1688.com'),
(54, 'Stafford', 'Kubala', 'skubala1h', 'wrG0ecZ8', 'Aktobe','ул. Желтоксан 76, кв.123', 'skubala1h@ft.com'),
(55, 'Bobinette', 'Wearden', 'bwearden1i', '9bjsAYpQ6', 'Kokshetau','ул. Желтоксан 51, кв. 35', 'bwearden1i@japanpost.jp'),
(56, 'Vere', 'Gowdy', 'vgowdy1j', 'Nga20ya87', 'Aktobe','ул. Желтоксан 52, кв. 172', 'vgowdy1j@dmoz.org'),
(57, 'Dawna', 'Rayner', 'drayner1k', 'CYgMlQ0EOw2k', 'Almaty','ул. Желтоксан 23, кв. 63', 'drayner1k@webnode.com'),
(58, 'Felipe', 'Anelay', 'fanelay1l', 'QjieKsGwhnE', 'Semey','ул. Желтоксан 22, кв. 132', 'fanelay1l@webeden.co.uk'),
(59, 'Mill', 'Boome', 'mboome1m', 'ApSZZCZBYj', 'Semey','ул. Желтоксан 12, кв. 76','mboome1m@gov.uk'),
(60, 'Mordy', 'Garaghan', 'mgaraghan1n', 'vw3MUcXW', 'Semey', 'ул. Богенбай батыр 113, кв.12','mgaraghan1n@about.com'),
(61, 'Susan', 'Fessions', 'sfessions1o', 'MBF6HGZa', 'Aktobe', 'ул. Ауэзова 88, кв. 77','sfessions1o@barnesandnoble.com'),
(62, 'Pearl', 'Field', 'pfield1p', 'iC6Oc28ZxLv', 'Nur-Sultan','ул. Желтоксан 74, кв. 162', 'pfield1p@slate.com'),
(63, 'Domeniga', 'Liversedge', 'dliversedge1q', 'EjxqFdV8ac', 'Aktobe','ул. Желтоксан 92, кв. 23', 'dliversedge1q@dedecms.com'),
(64, 'Filberto', 'Durnall', 'fdurnall1r', 'RZ5rRRjdn0my', 'Nur-Sultan', 'ул. Шокай 11, кв. 55', 'fdurnall1r@kickstarter.com'),
(65, 'Nanete', 'Laidlaw', 'nlaidlaw1s', 'p10sRMX0R6', 'Nur-Sultan','ул. Женис 12, кв. 22', 'nlaidlaw1s@vk.com'),
(66, 'Janot', 'Ashford', 'jashford1t', 'MkhZlRz', 'Semey','ул. Женис 42, кв. 12', 'jashford1t@ed.gov'),
(67, 'Nicky', 'Eglinton', 'neglinton1u', 'aKVcqrQlO', 'Kokshetau','ул. Женис 72, кв. 23', 'neglinton1u@nymag.com'),
(68, 'Iseabal', 'Bubbear', 'ibubbear1v', 'NEhhrBy', 'Kokshetau','ул. Женис 72, кв. 81', 'ibubbear1v@senate.gov'),
(69, 'Sauncho', 'Gordon', 'sgordon1w', 'ahJhv9', 'Semey','ул. Женис 27, кв. 12', 'sgordon1w@php.net'),
(70, 'Rosemarie', 'Saberton', 'rsaberton1x', 'hUsJSL3G', 'Shymkent','ул. Женис 73, кв. 122', 'rsaberton1x@jugem.jp'),
(71, 'Perceval', 'Renols', 'prenols1y', 'wj8wzc5JYJ', 'Nur-Sultan','ул. Женис 72, кв. 62', 'prenols1y@vk.com'),
(72, 'Nickolai', 'Franklin', 'nfranklin1z', 'lsfvFDW9ws3t', 'Kokshetau','ул. Женис 83 кв. 12', 'nfranklin1z@toplist.cz'),
(73, 'Wye', 'Deadman', 'wdeadman20', 'HDkBfxqouqu', 'Kokshetau','ул. Женис 72, кв. 23', 'wdeadman20@drupal.org'),
(74, 'Berti', 'Kingsmill', 'bkingsmill21', 'DfMZP4EeoN', 'Kokshetau','ул. Женис 13, кв. 74', 'bkingsmill21@canalblog.com'),
(75, 'Liz', 'Enric', 'lenric22', 'RZsAfMX1R9x', 'Semey','ул. Женис 78, кв. 213', 'lenric22@unesco.org'),
(76, 'Katina', 'Coakley', 'kcoakley23', 'JdAg7bI6', 'Kokshetau','ул. Ауэзова 62, кв. 125', 'kcoakley23@tripadvisor.com'),
(77, 'Ferdy', 'Bluett', 'fbluett24', 'HLTQgrO', 'Nur-Sultan', 'ул. Шокай 35, кв. 51', 'fbluett24@shop-pro.jp'),
(78, 'Devon', 'Francesconi', 'dfrancesconi25', 'tA5il0ILMr', 'Kokshetau','ул. Женис 15, кв. 72', 'dfrancesconi25@mayoclinic.com'),
(79, 'Omero', 'Surcomb', 'osurcomb26', '0LtzjOL','Shymkent','ул. Женис 74, кв. 12','osurcomb26@mlb.com'),
(80, 'Boycie', 'Hankard', 'bhankard27', '4s1PuyhE', 'Kokshetau', 'ул. Ауэзова 15, кв. 51','bhankard27@over-blog.com'),
(81, 'Darsey', 'Linner', 'dlinner28', 'g0GL9Ul', 'Shymkent','ул. Женис 62, кв. 231', 'dlinner28@slashdot.org'),
(82, 'Gaby', 'Saker', 'gsaker29', 'dnICulhz', 'Aktobe','ул. Женис 92, кв. 13', 'gsaker29@slate.com'),
(83, 'Penelope', 'Addison', 'paddison2a', 'sRfwQ0k', 'Kokshetau','ул. Женис 85, кв. 62', 'paddison2a@xing.com'),
(84, 'Myles', 'Kern', 'mkern2b', '2G8PGLk7', 'Shymkent','ул. Женис 16, кв. 23', 'mkern2b@ameblo.jp'),
(85, 'Robbie', 'Keepin', 'rkeepin2c', 'YCW8YT4oQEpd', 'Kokshetau','ул. Женис 62, кв. 13', 'rkeepin2c@cnn.com'),
(86, 'Nevins', 'Sapey', 'nsapey2d', 'HjqzkvQpnV42', 'Kokshetau', 'ул. Бокейханова 62, кв. 95','nsapey2d@bloomberg.com'),
(87, 'Adriana', 'Parysowna', 'aparysowna2e', '4frGLuY1', 'Almaty','ул. Женис 62, кв. 193', 'aparysowna2e@creativecommons.org'),
(88, 'Daniele', 'Toderbrugge', 'dtoderbrugge2f', 'vL7dCMkV', 'Nur-Sultan', 'ул. Бокейханова 51, кв. 25','dtoderbrugge2f@howstuffworks.com'),
(89, 'Cy', 'Lias', 'clias2g', 'TX41Wn', 'Aktobe','ул. Бокейхана 12, кв. 16' , 'clias2g@spotify.com'),
(90, 'Lurleen', 'Snipe', 'lsnipe2h', 'ULJvCuAuu', 'Nur-Sultan','ул. Бокейханова 112, кв. 56'
 ,'lsnipe2h@lycos.com'),
(91, 'Katleen', 'Gierke', 'kgierke2i', 'oUvqqiaaa', 'Kokshetau','ул. Женис 82, кв. 153', 'kgierke2i@amazon.com'),
(92, 'Esmeralda', 'Bacup', 'ebacup2j', 'wHFEKdDqGZ', 'Nur-Sultan', 'ул. Шокай 11','ebacup2j@google.com.au'),
(93, 'Auguste', 'Laugherane', 'alaugherane2k', '2P5zbhzTQu', 'Kokshetau', 'ул. Амангельды 12, кв. 36','alaugherane2k@geocities.com'),
(94, 'Enid', 'Bragginton', 'ebragginton2l', 'dY9TB9V', 'Almaty', 'ул. Амангельды 12, кв. 36',
'ebragginton2l@pagesperso-orange.fr'),
(95, 'Judye', 'Stirtle', 'jstirtle2m', 'QreC3wdPl0oV', 'Semey','ул. Женис 62, кв. 213', 'jstirtle2m@imdb.com'),
(96, 'Nady', 'Tremblett', 'ntremblett2n', 'a0uX7E8ke', 'Semey','ул. Бокейханова 31, кв. 35','ntremblett2n@japanpost.jp'),
(97, 'Krisha', 'Archibald', 'karchibald2o', 'IKWcxmW', 'Almaty','ул. Женис 12, кв. 243', 'karchibald2o@si.edu'),
(98, 'Lynnet', 'Rogge', 'lrogge2p', 'dnX8MLvx', 'Semey','ул. Аль-Фараби 12', 'lrogge2p@cnn.com'),
(99, 'Felicity', 'Pittaway', 'fpittaway2q', '6TusW85Hk', 'Nur-Sultan','ул. Уалиханова 62', 'fpittaway2q@vimeo.com'),
(100, 'Mano', 'Feenan', 'mfeenan2r', 'W9QKNDV3', 'Kokshetau', 'ул. Амангельды 112, кв. 58','mfeenan2r@wordpress.org'),  
(101, 'Rockey', 'Bunclark', 'rbunclark2s', 'Gb66K3ViCe', 'Kokshetau', 'ул. Торайгырова 101, кв. 56','rbunclark2s@redcross.org'),
(102, 'Dorry', 'Westcarr', 'dwestcarr2t', 'V7JXtlV', 'Kokshetau','ул. Бокейханова 58, кв. 79', 'dwestcarr2t@php.net'),
(103, 'Cordi', 'Clac', 'cclac2u', 'asndkzK9F', 'Nur-Sultan','ул. Бокейханова 1, кв. 165', 'cclac2u@java.com'),
(104, 'Arleyne', 'Caslin', 'acaslin2v', 'bIIxhy', 'Shymkent','ул. Бокейханова 16, кв. 23', 'acaslin2v@moonfruit.com'),
(105, 'Pattie', 'Bein', 'pbein2w', '41MX6IcdNL', 'Semey','ул. Аль-Фараби 112' , 'pbein2w@is.gd'),
(106, 'Avram', 'Kall', 'akall2x', 'kqVC8zQlvWPP', 'Shymkent','ул.Аль-Фараби 12, кв. 183','akall2x@google.com.br'),
(107, 'Elisabet', 'Gwatkin', 'egwatkin2y', 'k6P8ifq1Lm', 'Almaty','ул. Бокейханова 12','egwatkin2y@amazon.com'),
(108, 'Kelila', 'Nower', 'knower2z', 'BHXL9FxArAeN', 'Nur-Sultan','ул. Уалиханова 52, кв. 25', 'knower2z@blogs.com'),
(109, 'Madge', 'Phette', 'mphette30', 'Xcoj0ssRN3', 'Nur-Sultan','ул. Бокейханова 72, кв. 89', 'mphette30@aol.com'),
(110, 'Leonelle', 'Mulholland', 'lmulholland31', '7kP4eXnDet', 'Shymkent', 'ул. Амангельды 111, кв. 24', 'lmulholland31@blog.com');




INSERT INTO User_role
VALUES
(1,10),(1,11),(1,12),(2,13),(2,14),(2,15),(2,16),(2,17),
(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),
(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),
(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),
(3,60),(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(3,69),(3,70),(3,71),(3,72),(3,73),
(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(3,86),(3,87),
(3,88),(3,89),(3,90),(3,91),(3,92),(3,93),(3,94),(3,95),(3,96),(3,97),(3,98),(3,99),(3,100),
(3,101),(3,102),(3,103),(3,104),(3,105),(3,106),(3,107),(3,108),(3,109),(3,110);


INSERT INTO Coupon( code, sales)
VALUES
('35434', 1), ('08749', 2), ('742542', 3),
('02327', 4), ('55612', 5), ('93534', 6),
('53435', 7), ('554547', 8), ('308759', 9),
('642343', 10), ('912444', 11), ('71536', 12),
('646507', 13), ('50438', 14), ('355413', 15),
('86354', 16), ('66836', 17), ('93562', 18), 
('07087', 19), ('70351', 20), ('68231', 21),
('9568', 22), ('7546', 23), ('55675', 24),
('6888', 25), ( '946549', 26), ('8639', 27),
('8965', 28), ('23212', 29), ('62073', 30),
('44542', 31), ( '330446', 32), ( '0754', 33),
('07734', 34), ( '680658', 35), ( '17405', 36),
('59343', 37), ( '5478774', 38), ( '175786', 39),
('7565', 40), ( '64368', 41), ( '368369', 42),
('98646', 43), ( '26184', 44), ( '66166', 45),
('05409', 46), ( '046581', 47), ( '13682', 48),
('2309', 49), ( '626397', 50), ( '32594', 51),
( '9851', 52), ( '62564', 53), ( '765867', 54),
('57578', 55), ( '4416', 56), ( '77365', 57),
('873490', 58), ( '757343', 59), ( '775461', 60),
( '5510', 61), ( '884082', 62), ( '27093', 63),
( '85892', 64), ( '296814', 65), ( '5030', 66),
( '6906', 67), ( '199043', 68), ( '8073', 69),
('7249', 70), ( '60818', 71), ( '6668', 72),
( '85787', 73), ( '46087', 74), ( '81365', 75),
( '0626', 76), ( '04680', 77), ( '54005', 78),
( '87362', 79), ( '704509', 80), ( '75422', 81),
( '5410', 82), ( '14618', 83), ( '44807', 84),
( '1384', 85), ( '36648', 86), ( '0488', 87),
( '56733', 88), ( '35660', 89), ('11486', 90),
( '81653', 91), ('70827', 92), ('59679', 93),
( '63682', 94), ('5279', 95), ('2226', 96),
( '973904', 97), ('343680', 98), ('13708', 99),( '73495', 100);
DROP TABLE Coupon;

INSERT INTO delivery_company(company , price , numbers_of_day )
VALUES 
('DHL', 1500, 7), ('KazPost', 500, 14), ('Avis_Logistics', 2100, 3), ('Exline', 1700, 5);

INSERT INTO Categories(category_id,category_name )
VALUES
(1,'Books'),(2,'Chancellery'),(3,'Souvenirs');


INSERT INTO Subcategory(subcategory_id ,name, category_id)
VALUES
(11,'Novel',1),(12, 'Fantasy. Mysticism',1),(13, 'Manga and comics', 1),
(14,'Prose', 1),(15,'Militants. Detectives. Thrillers',1),(16, 'Literature for children',1) ,
(17, 'The science', 1),(18,'Encyclopedias. Guides', 1),(19,'Personal effectiveness' , 1),
(20,'Technical literature', 1 ),(21,'Books in foreign languages',1),
(22,'Satchels, backpacks, bags, pencil cases, Shoe bags',2),
(23,'Notepads, notebooks',2),(24,'Handles',2),(25,'Pencils, crayons',2),
(26,'Everything for the office',2),(27,'Markers, markers, proofreaders',2),
(28,'Notebooks and covers',2),(29,'Stationery sets',2),
(30,'Paints and brushes',2),(31,'Erasers, rulers, scissors, sharpeners, aprons',2),
(32, 'Glue, Scotch' , 2),(33, 'Albums'  ,2),(34, 'Plasticine' ,2),(35, 'Paper and cardboard',2),
(36, 'Ready-made tools, compasses', 2),(37,'Diaries',2),
(38, 'Home and accessories' ,3), (39, 'Masks, antiseptics' , 3), (40, 'Eco-goods', 3),
(41, 'Clothing and accessories' ,3),(42,'Collectible figures' ,3), 
(43,'Greeting cards, gift bags, packaging',3);

INSERT INTO Author(author_id ,author_name)
VALUES
(100,'С. Э. Кинг'),
(101,'Дж. Дэшнер'),
(102,'Дж. Р. Р. Толкин'),
(103,'О. Боуден'),
(104,'Х. Блэк'),
(105,'Д. Грин'),
(106,'С. Джио'),
(107,'Э. Скотт'),
(108,'Х. Аракава'),
(109,'Снайдер С.'),
(110,'Х. Ли'),
(111,'Х. Хоссейни'),
(112,'Г. Гарсиа Маркес'),
(113,'И. Стоун'),
(114,'Д. Киз'),
(115,'А. Кристи'),
(116,'М. Омер'),
(117,'Н. С. Жукова'),
(118,'К. Краутер'),
(119,'Р. Сандерсон'),
(120,'Э. Н. Веркин'),
(121,'А. де Сент-Экзюпери'),
(122,'Д. Синсеро'),
(123,'К. Макгонигал'),
(124,'Н. Вуйчич'),
(125,'С. Хокинг'),
(126,'В. К. Мюллер'),
(127,'АСТ – издательство'),
(128,'Я. И. Перельман'),
(129,'Р. Т. Кийосаки'),
(130,'Б. Трейси'),
(131,'Ф. Найт'),
(132,'М. Мэнсон'),
(133,'Ч. Уинг'),
(134,'И. А. Шерешевский'),
(135,'П. Крафт'),
(136,'Ш. Бекмуханбетова'),
(137,'И. В. Юдаев'),
(138,'Ta-Nehisi Coates'),
(139,'Walter Tevis'),
(140,'Barack Obama'),
(141,'Wizards RPG Team'),
(142,'Matthew McConaughey'),
(143,'Matt Haig'),
(144,'Ruth Ware'),
(145,'Amor Towles'),
(146,'LEMBU'),
(147,'Sun Eight'),
(148,'Seventeen'),
(149,'Эксмо'),
(150,'TIELING'),
(151,'Tratto'),
(152,'STABILO'),
(153,'Борлар'),
(154,'STAEDTLER'),
(155,'Erich Krause'),
(156,'InFolio'),
(157,'STAEDTLER'),
(158,'Hatber'),
(159,'Greenwich Line'),
(160,'Be Smart'),
(161,'Yiwu Hanmio Trade'),
(162,'SYLOON'),
(163,'ЛУЧ'),
(164,'Artberry'),
(165,'Milan'),
(166,'ПВА'),
(167,'Crown'),
(168,'Академия Холдинг'),
(169,'Mary Beth'),
(170,'My Little Pony'),
(171,'Трансформеры'),
(172,'My Flame Lifestyle'),
(173,'Erik'),
(174,'SUZHOU HENGRUN'),
(175,'Tengri People'),
(176,'Premial'),
(177,'Cards for you and me'),
(178,'ЛАКАРТ ДИЗАЙН'),
(179,'ECOFFEE CUP'),
(180,'Funko');

INSERT INTO Product_photo(photo_id,url)
VALUES
(1000,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/1/0/1026883191.jpg'),
(1001,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/c/o/cover1__w600_135_333.jpg'),
(1002,'https://simg2.marwin.kz/media/catalog/product/cache/08ac36f8e739f37f4a6e83b514532086/c/o/cover1__w600_39_377.jpg'),
(1003,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/6/0/6008563357.jpg'),
(1004,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/f/u/fullimage_19_73.jpg'),
(1005,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/c/o/cover1_36_4.jpg'),
(1006,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/6/0/atlas_mira_politicheskie_i_fizicheskie_karty.jpg'),
(1007,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/f/u/fullimage_19_124.jpg'),
(1008,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/c/o/cover4_28_329.jpg'),
(1009,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/1/0/10505680_0.jpg'),
(1010,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/c/o/cover1__w600_57_218.jpg'),
(1011,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/f/u/fullimage_19_91.jpg'),
(1012,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/c/o/cover1_60_881.jpg'),
(1013,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/c/o/skott_e_ne_day_mne_upast_2.jpg'),
(1014,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/f/u/fullimage_19_115.jpg'),
(1015,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/6/a/snayder_s_i_dr_djoker_80_let_znamenitomu_zlodeyu_delyuks.jpg'),
(1016,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/migrated/article/22564/20_tn3.jpg'),
(1017,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/1/0/10440770_0.jpg'),
(1018,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/c/o/cover1__w600_135_627.jpg'),
(1019,'https://simg2.marwin.kz/media/catalog/product/cache/08ac36f8e739f37f4a6e83b514532086/6/0/omer_m_zajivo_v_temnote.jpg'),
(1020,'https://simg2.marwin.kz/media/catalog/product/cache/69236b3c6fe5a36c2425d919ec770b32/c/o/cover1__w600_135_300.jpg'),
(1021,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/d/s/ryukzak_lembu_po_motivam_van_goga.jpg'),
(1022,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/migrated/article/15264/50_tn3.jpg  '),
(1023,'https://simg2.marwin.kz/media/catalog/product/cache/08ac36f8e739f37f4a6e83b514532086/c/o/bloknot_upravlyay_vremenem.jpg '),
(1024,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/h/t/ruchka_sharikovaya_donut.jpg '),
(1025,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/f/i/ruchka_sharikovaya_fox.png '),
(1026,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/s/t/st_22674_2824_2824-12_assort.jpg '),
(1027,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/1/0/ejednevnik_datirovannyy_2021_infolio_140h200_mm_352_str_gentlemen.jpg '),
(1028,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/s/t/st_28877_70_6-2_boss-original-pastel_wallet_front-view_c.jpg'),
(1029,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/3/7/3704873.jpg'),
(1030,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/migrated/article/16749/10_tn3.jpg '),
(1031,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/migrated/article/14442/64_tn3.jpg'),
(1032,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/3/7/3777182_1_.jpg '),
(1033,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/9/6/9605.jpg '),
(1034,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/migrated/article/16915/42_tn3.jpg '),
(1035,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/migrated/article/21614/10_tn3.jpg'),
(1036,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/1/_/dnevnik_universalnye_girl_collection_a5_48_l_girl_collection_murlyka.png'),
(1037,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/migrated/article/22185/23_tn3.jpg '),
(1038,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/1/1/tetrad_obshchaya_infolio_study_120_l_kletka_kolcevoy_mehanizm_no_way.png'),
(1039,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/1/6/1600_1_119.jpg '),
(1040,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/6/0/600b9beb70b092ec479801ae04032bc2.png'),
(1041,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/8/7/8719481030452.jpg '),
(1042,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/4/7/47447120_images_11213619927.jpg '),
(1043,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/1/1/pled_vyazanyy_jeltyy_127x152_sm.jpg '),
(1044,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/8/7/8719481031114.jpg '),
(1045,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/m/a/maska_tekstilnaya_mnogorazovaya_dlya_lica_ok_2.jpg'),
(1046,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/1/_/salfetki_vlajnye_s_antibakterialnym_effektom_premial_15_sht.png '),
(1047,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/migrated/article/20661/13_tn3.jpg'),
(1048,'https://simg2.marwin.kz/media/catalog/product/cache/08ac36f8e739f37f4a6e83b514532086/s/c/figurka_funko_pop_bobble_star_wars_mandalorian_the_child_48740.png'),
(1049,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/5/0/5050293385556_1_org_zoom.jpg'),
(1050,'https://simg2.marwin.kz/media/catalog/product/cache/ecd051e9670bd57df35c8f0b122d8aea/f/u/fun2225_1.jpg');

INSERT INTO Products(product_id,product_name,author_id,price,photo_id, subcategory_id)
VALUES
(100, 'Кладбище домашних животных', 100 , 1850 , 1001, 12),
(101,'Бегущий в Лабиринте. Испытание огнем. Лекарство от смерти', 100, 4200, NULL, 12),
(102,'Властелин колец',102, 2890,NULL, 12),
(103, 'Ловец снов',100, 2400,NULL,12),
(104, '11/22/63',100, 2705, NULL , 12),
(105, 'Assassin’s Creed. Ренессанс',103,2505, 1009, 12),
(106, 'Злой король',104,2100,1010, 12),
(107, 'Виноваты звёзды',105, 2490, 1011,11),
(108, 'Все цветы Парижа',106, 2055,1012, 11),
(109, 'Не дай мне упасть', 107, 2340,1013, 11),
(110, 'Ежевичная зима', 106,1000,1014, 11),
(111, 'Назад к тебе ',106 ,1950, NULL  , 11),
(112, 'Стальной Алхимик. Кн. 1',108,5700,1000, 13),
(113, 'Стальной Алхимик. Кн. 2',108,5200,NULL,13),
(114, 'Стальной Алхимик. Кн. 3',108,5200,NULL,13),
(115,'Бэтмен, Который Смеётся',109,5350,NULL,13),
(116, 'Джокер. 80 лет знаменитому злодею',109,5600,1015,13),
(117, 'Убить пересмешника',110, 1500,1016,14),
(118, 'И эхо летит по горам ',  111, 4330 ,NULL, 14),
(119, 'Сто лет одиночества',  112, 2330 ,1017, 14),
(120, 'Жажда жизни', 113, 1300,NULL, 14),
(121, 'Цветы для Элджернона ', 114,1000,1018,14),
(122, 'Рождество Эркюля Пуаро',115, 4000,NULL, 15),
(123, 'Десять негритят',115, 1000,NULL, 15),
(124, 'Смерть на Ниле',115,1000,1002, 15),
(125, 'Заживо в темноте',116, 2500,1019, 15),
(126, 'Внутри убийцы',116, 2500,1008, 15),
(127, 'Букварь',117, 1300,NULL, 16),
(128,  'Ночные сказки',118, 2800,NULL, 16), 
(129,  'Заколдованный лес',119, 1400, 1003,16),
(130, 'Советы по выживанию в школе',120, 2000,NULL, 16), 
(131, 'Маленький принц',121, 1000,NULL, 16),
(132, 'Не ной. Только тот, кто перестал сетовать на судьбу, может стать богатым',122, 3200,NULL, 17), 
(133, 'Сила воли. Как развить и укрепить',123, 4400,NULL, 17),  
(134, 'Жизнь без границ. Путь к потрясающе счастливой жизни',124, 2300,1004, 17), 
(135, 'Краткая история времени',125, 4100,1020,17), 
(136, 'Вселенная Стивена Хокинга',125, 5150,1005,17), 
(137,  'Англо-русский, русско-английский словарь для учащихся. 75 000 слов и словосочетаний с практической транскрипцией в обеих частях. Грамматический справочник',126, 1000,NULL, 18), 
(138, 'Самый полный англо-русский русско-английский',126, 3000,NULL, 18),
(139, 'Англо-русский русско-английский словарь',127, 1000, NULL,18),  
(140, 'Карта мира физическая, политическая',127, 700,1006, 18), 
(141, 'Знаете ли вы арифметику?',128, 3000, NULL,18), 
(142,' Квадрант денежного потока', 129,4900,NULL, 19),
(143, ' Выйди из зоны комфорта. Измени свою жизнь. 21 метод повышения личной эффективности', 130,4000,NULL, 19),
(144, ' Продавец обуви. История компании Nike', 131,4450,1007,19),
(145, ' Всё хреново. Книга о надежде', 132,2600,NULL, 19),
(146, ' Тонкое искусство пофигизма. Парадоксальный способ жить счастливо', 132 ,2600,NULL, 19),
(147, 'Как работает ваш дом ',  133, 6900,NULL, 20),
(148, 'Конструирование гражданских зданий ',  134, 3600,NULL, 20),
(149, 'Автомобили ',  135, 3000,NULL, 20),
(150, 'Сварка и резка металлов и пластмасс. Учебное пособие',  136, 2500,NULL, 20),
(151, 'Возобновляемые источники энергии. Учебник',  137, 14000,NULL, 20),
(152, 'Between the World and Me',  138, 5500,NULL, 21),
(153, 'The Queen’s Gambit',  139, 4500,NULL, 21),
(154, 'A Promised Land' ,  140, 11000,NULL, 21),
(155, 'Tasha’s Cauldron of Everything',  141, 13000,NULL, 21),
(156, 'Greenlights ',  142, 8000 ,NULL, 21),
(157, 'The Midnight Library',  143, 6500,NULL, 21),
(158, 'One by One',  144, 7000,NULL, 21),
(159, 'A Gentleman in Moscow',  145, 5000,NULL, 21),
(160,  'Рюкзак "По мотивам Ван Гога"',  146, 6000,1020, 22),
(161, 'Рюкзак подростковый голографический "Sun Eight"',  147, 13000,NULL, 22),
(162, 'Рюкзак школьный "Sun Eight". Черный.',  147, 7700,NULL, 22),
(163, 'Мешок для обуви. Мир динозавров',  148, 1300,NULL, 22),
(164, 'Рюкзак "Сердечко"',  146, 7800,NULL, 22),
(165, 'Ежедневник №1, ч/б Делай! ',  149, 2500,1021, 23),
(166, 'Блокнот креативный с черными страницами (мягкая обложка) Black Note',  149, 1850,NULL, 23),
(167, 'Блокнот. Управляй временем!',  149, 2400,1023, 23),
(168, 'Блокнот. Black&White Note.',  149, 2450,NULL, 23),
(169, 'Блокнот для записей А5, 96 л., Funny Stories. Дизайн 2',  149, 3400,NULL, 23),
(170, 'Ручка шариковая Donut',  150, 530,1024, 24),
(171,  'Ручка со стираемыми чернилами с 2-мя ластиками 2шт + ластик в блистере',  151, 1990,NULL, 24),
(172,  'Ручка STABILO Point 88 Pastel (8 штук)',  152, 2100,NULL, 24),
(173,  'Ручка STABILO bille 508N X синяя',  152, 590,NULL, 24),
(174, 'Ручка шариковая Fox',  150, 540,1025, 24),
(175, 'Мелки восковые STABILO yippy?wax (24 шт)',  152, 850,1026, 25),
(176, 'Карандаши цветные STABILO color (18шт) в картонной коробке',  152, 2450,NULL, 25),
(177, ' Мел цветной в наборе - 14шт. "Борлар" асфальтовые',  153, 760,NULL, 25),
(178, 'Карандаш механический STABILO со сменными грифелями в блистере',  152, 850,NULL, 25),
(179, 'Карандаши Noris eco в блистере 7 шт.',  154, 1660,NULL, 25),
(180, 'Папка файловая пластиковая ErichKrause® Classic, c 20 карманами, A4, черный',  155, 450,NULL, 26),
(181, 'Ежедневник, датированный 2021, Infolio, 140х200 мм, 352 стр., Gentlemen',  156, 7600,1027, 26),
(182, 'Папка текстильная на молнии, вертикальная с ручкой Meow, А4',  155, 2200,NULL, 26),
(183, 'Папка на молнии пластиковая с ручками Diagonal Neon, A3, ассорти',  155, 2000,NULL, 26),
(184, 'Портфель пластиковый Attache, A4, серый',  155, 810,NULL, 26),
(185, 'Маркер STABILO BOSS Pastel (6 штуки)',  152, 3400,1028, 27),
(186, 'Фломастер STABILO Trio A-Z (18шт)',  152, 2230,NULL, 27),
(187, 'Арт-маркеры Сalligraphy duo 12 штук',  157, 3800,NULL, 27),
(188, 'Фломастер STABILO Power (24шт)',  152, 3735,NULL, 27),
(189, 'Маркер-Pen STABILO Cappi black',  152, 445,NULL, 27),
(190, 'Тетрадь "Hatber", 12л, А5, клетка, на скобе, серия "Зелёная" (20 шт)',  158, 750,NULL, 28),
(191, 'Тетрадь 48л. А5, клетка, ЛАЙТ, кожзам, Greenwich Line "Florence", бирюзовый',  159, 1730,NULL, 28),
(192, 'Тетрадь для конспектов А4, 96л. Клетка. Графит. Дизайн 5',  149, 850,1029, 28),
(193, 'Тетрадь общая, Be Smart, 40 л., точки, скрепка. "Storm", волна',  160, 1300,NULL, 28),
(194, 'Тетрадь предметная 48л. Greenwich Line "Color theory" - Химия',  159, 400, NULL, 28),
(195, 'Тетрадь общая, Infolio Study, 120 л., клетка, кольцевой механизм. "No way"',  156, 3300,1038, 28),
(196, 'Стаканчик под канцелярские принадлежности',  161, 330,NULL, 29),
(197, 'Канцелярский набор Панда степлер/антистеплер/карандаши/ластик/линейка/ручка/точилка/',  162, 3500,NULL, 29),
(198,  'Набор для рисования Staedtler Mixed Sketching',  157, 5000,NULL, 29),
(199,  'Набор канцелярский Student set (карандаш, ручка, линейка, точилка, ластик)',  157, 1400,NULL, 29),
(200,  'Набор для черчения Mars',  157, 3400,1030, 29),
(201,  'Акварель перламутровая 12цв. без кисти',  163, 750,NULL, 30),
(202, 'Кисти для акварели и гуаши, пони, 4 штуки',  164, 900,NULL, 30),
(203, 'Краски акварельные ArtBerry 18 цветов с УФ защитой яркости',  165, 950,NULL, 30),
(204,  'Краски акварельные ArtBerry 12 цветов с УФ защитой яркости, с палитрой и кистью',  165, 950,NULL, 30),
(205,  'Краски акриловые художественные 12 цветов',  165, 2500,1031, 30),
(206,  'Кисти ErichKrause для акварели и гуаши/пони+щетина, 4 шт.',  155, 880,NULL, 30),
(207,  'Ножницы Standard 17 см',  155, 650,NULL, 31),
(208,  'Набор 3 ластика Drive, в блистере',  155, 650,NULL, 31),
(209,  'Линейка пластиковая Pastel, 15 см, фиолетовый, в флоупаке',  155, 220,NULL, 31),
(210,  'Ластик в пластиковом футляре ErichKrause® Shell',  155, 280,NULL, 31),
(211,  'Линейка пластиковая Clear, 30 см, прозрачный, в флоупаке',  155, 350,NULL, 31),
(212,  'Набор ластиков Rubber 6 шт',  165, 680,NULL, 31),
(213,  'Набор линеек 4 шт. желтые',  165, 1340,NULL, 31),
(214,  'Точилка с ластиком COMPACT Sunse',  165, 1500,1032, 31),
(215,  'Лента двусторонняя клейкая 12mmх10m',  155, 550,NULL, 32),
(216,  'Клей-карандаш Noris Club 20 гр.',  157, 650,NULL, 32),
(217,  'Клей ПВА-М 125гр., в цветном флаконе',  166, 350,1039, 32),
(218,  'Лента клейкая 8,4mmx12m',  165, 890,NULL, 32),
(219,  'Клей-карандаш Crown "Expert", 22г',  167, 450,NULL, 32),
(220,  'Альбом для рисования 40л А4 "Автомобиль и всплеск цвета"',  168, 650,NULL, 33),
(221,  'Альбом для рисования 40л. Гребень. Счастливый мопс',  147, 850,NULL, 33),
(222,  'Альбом для рисования 20 л А4 MGL',  168, 350,1033, 33),
(223,  'Бумага для акварели в папке Promenade, А3, 10 листов',  155, 880,NULL, 33),
(224,  'Альбом для эскизов на спирали Абстракция, 170х170 мм, 40 листов',  155, 450,1040, 33),
(225,  'Пластилин скульптурный, 300 г, (серого цвета)',  163, 550,1037, 34),
(226,  'Пластилин Флуоресцентный 10 цв.(в блистере)',  163, 990,NULL, 34),
(227,  'Пластилин перламутровый 8 цветов',  163, 880,NULL, 34),
(228,  'Пластилин "Люкс" 12 цветов',  163, 1500,NULL, 34),
(229,  'Пластилин "Престиж" 12 цв.',  163, 1500,NULL, 34),
(230,  'Картон цветной 10 цветов 10 листов (2метр) А4 Mary Beth',  169, 305,NULL, 35),
(231,  'Бумага цветная двухсторонняя мелованная 8 л. 8 цв. Скрепка. Супер – авто',  149, 350,NULL, 35),
(232,  'Бумага цветная Artberry двусторонняя мелованная В5 10 листов/20 цветов',  164, 590,NULL, 35),
(233,  'Картон цветной Erich Krause мелованный А4 10 листов, 10 цветов',  155, 690,NULL, 35),
(234,  'Картон цветной Artberry двусторонний мелованный В5 10 листов/20 цветов',  154, 690,NULL, 35),
(235,  'Картон цветной 16 цветов 16 листов (2 мет) А4 My Little Pony',170 ,750,NULL, 35),
(236,  'Набор Noris geo starter',  157, 3500,NULL, 36),
(237,  'Циркуль школьный',  157, 1850,NULL, 36),
(238,  'Набор для черчения S-COOL, 3 предм.',  155, 1450,NULL, 36),
(239,  'Циркуль 550 50 metallic violet',  157, 1900,NULL, 36),
(240,  'Готовальня University 140мм., 5 предметов',  155, 3000,NULL, 36),
(241,  'Дневник школьный, для старших классов, Infolio Study, 170х215 мм, 48 л',  156, 2200,1035, 36),
(242,  'Дневник универсальные, "Girl collection" А5, 48 л, Girl collection. Мурлыка',  149, 2200,1036, 36),
(243,  'Дневник школьный "Винтажный мотоцикл"',  168, 440,NULL, 37),
(244,  'Дневник 1-11 кл. 48л. (твердый) "Two kitties"',  159, 2200,NULL, 37),
(245,  'Дневник для младшей школы Transformers 6',  171, 900,NULL, 37),
(246,  'Cвеча ароматическая "Super Duper". Фиги',  172, 5700,1041, 38),
(247,  'Подушка декоративная HI',  173, 11000,1042, 38),
(248,  'Плед вязаный. Желтый. 127X152 см',  174, 11200,1043, 38),
(249,  'Свеча ароматическая "Love is the answer". Сандал',  172, 7500,1044, 38),
(250,  'Маска текстильная многоразовая для лица "ОК 2"',  175, 1300,1045, 39),
(251,  'Салфетки влажные с антибактериальным эффектом Premial 15 шт.',176, 250,1046, 39),
(252,  'Стакан "Jack O’Toole", 400 мл.',179, 6000,NULL, 40),
(253,  'Брелок Funko Pocket POP! Keychain: Marvel: Spider-Man: Far From Home:SpiderMan(StealthSuit)39362-PDQ',180, 3600,1050, 42),
(254,  'Фигурка Funko POP! Bobble: Star Wars: Mandalorian: The Child 48740',180, 9000,1048, 42),
(255,  'Брелок Deadpool',173, 1500,1049, 42),
(256,  'Открытка поздравительная "Следуй за мечтой"',178, 580,NULL, 43),
(257,  'Открытка Лакарт Больше чем Кит Настоящий мужчина',178, 1400,NULL, 43),
(258,  'Открытка «Космос»',177, 980,1047, 43);




INSERT INTO Order_Cart(order_cart_id, order_status, date_from , user_id ,company)
VALUES
(1000, 'executed','2020-06-23',10, 'KazPost'),(1001,'not executed','2020-11-25',101, 'DHL'),
(1002,'executed','2020-02-12', 51, 'Exline'), 
(1003,'executed','2019-12-5', 63, 'Avis_Logistics'),(1004,'executed','2019-12-17',23, 'DHL'),
(1005,'not executed','2020-11-18', 41,'KazPost'),(1006,'executed','2020-01-23',97, 'Exline'),
(1007,'not executed','2020-11-15',53 ,'Exline'),(1008,'not executed','2020-11-20',105, 'DHL'),
(1009,'not executed','2020-10-30', 16,'KazPost'),
(1010,'not executed','2020-10-29',77, 'Exline'),
(1011,'executed','2019-10-12', 45, 'Exline'),(1012,'not executed','2020-11-26', 98, 'KazPost'),
(1013,'not executed','2020-11-15', 37, 'KazPost'),(1014,'not executed','2020-11-21', 66, 'Avis_Logistics'),
(1015,'executed','2020-10-29', 52, 'DHL'),(1016,'not executed','2020-11-22' ,71,'KazPost'),
(1017,'not executed','2020-11-23',26,'DHL'),(1018,'not executed', '2020-11-11', 40, 'DHL'),
(1019,'executed','2020-09-20',31,'Avis_Logistics'),(1020,'not executed', '2020-11-11',42, 'DHL'),
(1021,'not executed', '2020-11-25', 50, 'KazPost'),(1022,'executed','2020-08-02', 81, 'DHL'),
(1023,'not executed', '2020-11-21', 39, 'Avis_Logistics'),
(1024,'not executed', '2020-10-30', 88, 'Avis_Logistics'),
(1025,'not executed', '2020-11-11', 41, 'Avis_Logistics'),
(1026,'not executed', '2020-11-20', 67, 'KazPost'),
(1027,'executed','2020-08-28', 75,'Avis_Logistics'),
(1028,'not executed', '2020-10-31', 20, 'Exline'),
(1029,'executed','2019-02-20', 58, 'DHL'),
(1030,'not executed', '2020-11-09', 91, 'Exline');

INSERT INTO Order_details(quantity, order_cart_id ,product_id )
VALUES
(1, 1000,100 ),(1, 1000,101 ),(1, 1000,102 ),
(1, 1001,112 ),(1, 1001,113 ),(1, 1001,114 ),
(1, 1002,120 ),(1, 1002,121),
(2, 1003,130),
(1, 1004,140 ),(1, 1004,141 ),(1, 1004,142),(1, 1004,143 ),
(1, 1005,155 ),(1, 1005,156),
(2, 1006,106),
(1, 1007,160),(1,1007,163),(3,1007,209),
(1, 1008,218 ),(2, 1008,215 ),(2, 1008,237 ),(4, 1008,228 ),(2, 1008,214 ),
(2, 1009,234),
(2, 1010,207 ),(1, 1010,216 ),(10, 1010,190 ),
(1, 1011,214 ),(1, 1011,221),
(1, 1012,213 ),(2, 1012,229 ),(1, 1012,194),(1, 1012,195),
(1, 1013,162),
(1, 1014,239 ),(1, 1014,240),
(3, 1015,188),(50,1015,191),(1,1015,184),
(1, 1016,233 ),(2, 1016,228 ),(2, 1016,209),(1, 1016,200),
(1, 1017,161),
(1, 1018,120 ),(1, 1018,200 ),(2, 1018,156 ),
(1, 1019,128 ),(1, 1019,192 ),
(1, 1020,143 ),(1, 1020,231 ),(1, 1020,200 ),(3, 1020,190 ),(1, 1020,130 ),(2, 1020,222 ),
(1, 1021,230 ),(2, 1021,210 ),
(1, 1022,231 ),(1, 1022,150 ),(1, 1022,175 ),(2, 1022,230 ),(1, 1022,176 ),
(2, 1023,251 ),
(1, 1024,133 ),(1, 1024,123 ),(2, 1024,215 ),
(1, 1025,112 ),(1, 1025,178 ),
(1, 1026,219 ),(1, 1026,140 ),(3, 1026,205 ),
(1, 1027,160 ),
(1, 1028,170 ),(2, 1028,170 ),
(1, 1029,191 ),(1, 1029,142 ),(2, 1029,233 ),
(1, 1030,178 ),(1, 1030,251 ),(1, 1030,121 ),(1, 1030,170 );

UPDATE order_cart SET total_price=T2.total_price_cart_id FROM (SELECT order_cart_id, SUM(Total_in_Cart ) AS total_price_cart_id
FROM (SELECT order_details.order_cart_id, order_details.quantity * products.price AS Total_in_Cart FROM order_details INNER JOIN products ON order_details.product_id = products.product_id) AS newTable GROUP BY order_cart_id) as T2 where order_cart.order_cart_id=T2.order_cart_id;


UPDATE Order_Cart SET total_price = total_price + delivery_company.price
FROM delivery_company
WHERE delivery_company.company = order_cart.company;


INSERT INTO Payment(payment_id , user_id, card_number, order_cart_id)
VALUES
(10000,10,  3549887409263946, 1000),
(10001,101,3581461539404421,1001),
(10002,51,  3581461539404421, 1002),
(10003,63,  5163146826316658, 1003),
(10004,23,  3549394722835161, 1004),
(10005,41,  3570970955996523, 1005),
(10006,97,  3534695009101532, 1006),
(10007,53,  3568325147657315, 1007),
(10008,105,5100175881368748, 1008),
(10009,16, 3583308147821231, 1009),
(10010,77, 3559678165261662, 1010),
(10011,45, 3528102369937041, 1011),
(10012,98, 3543867650114812,1012),
(10013,37, 3572417950394930, 1013),
(10014,66, 3531780370712928, 1014),
(10015,52, 4911737411045039, 1015),
(10016,71, 3572047347747241, 1016),
(10017,26, 5100143332470950, 1017),
(10018,40, 3529696252722385, 1018),
(10019,31, 3551732135653041, 1019),
(10020,42, 5048378801408710, 1020),
(10021,50, 3578993104743614, 1021),
(10022,81, 3528136275895968, 1022),
(10023,39, 5100174641130746, 1023),
(10024,88, 3589889031430290, 1024),
(10025,41, 3552308972250305, 1025),
(10026,67, 4041599920781097, 1026),
(10027,75, 3541691792604536, 1027),
(10028,20, 3570264912682768, 1028),
(10029,58, 6380951389721599, 1029),
(10030,91, 3564278019707854, 1030);


UPDATE Payment SET total_price = order_cart.total_price
FROM Order_cart
WHERE Payment.order_cart_id = Order_cart.order_cart_id;

UPDATE Payment  SET  date_from = order_cart.date_from
FROM Order_cart
WHERE Payment.order_cart_id = Order_cart.order_cart_id;


/*
SELECT Users.first_name, Users.last_name, Products.product_name, Products.price
FROM Users INNER JOIN Order_cart ON Users.user_id = Order_cart.user_id
INNER JOIN Order_details on Order_cart.order_cart_id = Order_details.order_cart_id
INNER JOIN Products on Order_details.product_id = Products.product_id
WHERE price = (SELECT MIN (price) FROM Products)
OR price = (SELECT MAX (price) FROM Users INNER JOIN Order_cart ON Users.user_id = Order_cart.user_id
INNER JOIN Order_details on Order_cart.order_cart_id = Order_details.order_cart_id
INNER JOIN Products on Order_details.product_id = Products.product_id)
ORDER BY Products.price;

SELECT * FROM products
WHERE product_name LIKE 'Н%';


SELECT * FROM order_cart WHERE date_from BETWEEN '2020-11-01' AND '2020-11-30';

SELECT Author.author_name, COUNT (Products) AS BooksCount
FROM products
INNER JOIN Author ON Author.author_id = products.author_id
INNER JOIN subcategory ON products.subcategory_id = subcategory.subcategory_id
INNER JOIN categories ON subcategory.category_id = categories.category_id
WHERE categories.category_name = 'Books'
GROUP by Author.author_name
ORDER by BooksCount DESC;

SELECT subcategory.name, COUNT (Products) AS BooksCount
FROM products
INNER JOIN subcategory ON products.subcategory_id = subcategory.subcategory_id
INNER JOIN categories ON subcategory.category_id = categories.category_id
WHERE categories.category_name = 'Books'
GROUP by subcategory.subcategory_id
ORDER by BooksCount DESC;

SELECT products.product_name, Product_photo.url
FROM products
LEFT JOIN product_photo ON products.photo_id = product_photo.photo_id;

SELECT products.product_name, Product_photo.url
FROM products
RIGHT JOIN product_photo ON products.photo_id = product_photo.photo_id;


SELECT products.product_name, Subcategory.name , Categories.category_name
FROM products
INNER JOIN Subcategory ON products.subcategory_id = subcategory.subcategory_id
INNER JOIN Categories ON subcategory.category_id = Categories.category_id
WHERE Categories.category_name = 'Books' AND LENGTH(product_name)  < 12
ORDER BY LENGTH(product_name) DESC;
*/

DROP TABLE order_details;
DROP TABLE products;
DROP TABLE author;
DROP TABLE subcategory;
DROP TABLE categories;
DROP TABLE product_photo;
DROP TABLE payment;
DROP TABLE order_cart;
DROP TABLE delivery_company;
DROP TABLE user_role;
DROP TABLE users;
DROP TABLE roles;
