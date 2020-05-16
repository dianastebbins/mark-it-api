USE markit_db;

-- markets
INSERT INTO Markets (market_id, createdAt, updatedAt) VALUES ("Pike Place Market", current_time(), current_time());
INSERT INTO Markets (market_id, createdAt, updatedAt) VALUES ("Maple Valley Weekend Market", current_time(), current_time());
INSERT INTO Markets (market_id, createdAt, updatedAt) VALUES ("Gold Bar Sunday Market", current_time(), current_time());
INSERT INTO Markets (market_id, createdAt, updatedAt) VALUES ("Mill Creek Saturday Market", current_time(), current_time());
INSERT INTO Markets (market_id, createdAt, updatedAt) VALUES ("Redmond Farmer Market", current_time(), current_time());

USE markit_db;
-- users, not vendors -- user ids 1 through 10
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper1","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Samantha", "Smith", "s.smith@test.com", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper2","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Sally", "Sandler", "s.sandler@test.com", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper3","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Susan", "Slate", "s.slate@test.com", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper4","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Sophia", "Stokes", "s.stokes@test.com", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper5","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Scarlett", "Shoemaker", "s.shoemaker@test.com", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper6","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Stella", "Snyder", "s.snyder@test.com", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper7","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Savannah", "Stoltz", "s.stoltz@test.com", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper8","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Sarah", "Stanford", "s.stanford@test.com", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper9","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Serenity", "Stewart", "s.stewart@test.com", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper10","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Stephanie", "Swift", "s.swift@test.com", current_timestamp(), current_timestamp());

USE markit_db;
-- users, not vendors, favorite markets -- user 1 likes market 1; user 2 likes 1,2; user 3 likes 1,2,3; user 4 likes 1,2,3,4; user 5 likes 1,2,3,4,5
-- user 6 likes 1,2; user 7 likes 2,3; user 8 likes 3,4; user 9 likes 3,4, user 10 likes nothing
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 1, 1);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 2, 1);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 2, 2);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 3, 1);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 3, 2);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 3, 3);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 4, 1);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 4, 2);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 4, 3);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 4, 4);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 1);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 2);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 3);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 4);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 5);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 6, 1);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 6, 2);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 7, 2);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 7, 3);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 8, 3);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 8, 4);

USE markit_db;
-- users who are vendors -- user ids 11 through 15
INSERT INTO Users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor1","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Victor", "Victoria", "v.victoria@test.com", "Victors Bakery", "bakery@test.com", "(206) 999-8888", "2069998888", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor2","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Vladimir", "Vader", "v.vader@test.com", "Vladimirs Produce", "produce@test.com", "(206) 777-6666", "2067776666", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor3","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Vicki", "Vale", "v.vale@test.com", "Vickis Jewelry", "jewelry@test.com", "(206) 555-4444", "2065554444", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor4","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Veronica","vanDoorn", "v.vandoorn@test.com", "Veronicas Candles", "candles@test.com", "(206) 333-2222", "2063332222", current_timestamp(), current_timestamp());
INSERT INTO Users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor5","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Vance", "Venus", "v.venus@test.com", "Vances Flowers", "flowers@test.com", "(206) 111-0000", "2061110000", current_timestamp(), current_timestamp());

USE markit_db;
-- vendors products -- vendor 11 has one product, vendor 12 has two, vendor 13 has 3, 14 has 4, 15 has 5
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("bakery item 1","bakery item 1 description",11.00,"bakery item 1 details",current_time(),current_time(),11);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("produce item 1","produce item 1 description",12.00,"produce item 1 details",current_time(),current_time(),12);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("produce item 2","produce item 2 description",12.12,"produce item 2 details",current_time(),current_time(),12);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("jewelry item 1","jewelry item 1 description",13.00,"jewelry item 1 details",current_time(),current_time(),13);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("jewelry item 2","jewelry item 2 description",13.13,"jewelry item 2 details",current_time(),current_time(),13);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("jewelry item 3","jewelry item 3 description",13.25,"jewelry item 3 details",current_time(),current_time(),13);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("candle item 1","candle item 1 description",14.00,"candle item 1 details",current_time(),current_time(),14);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("candle item 2","candle item 2 description",14.14,"candle item 2 details",current_time(),current_time(),14);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("candle item 3","candle item 3 description",14.25,"candle item 3 details",current_time(),current_time(),14);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("candle item 4","candle item 4 description",14.50,"candle item 4 details",current_time(),current_time(),14);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("flower item 1","flower item 1 description",15.00,"flower item 1 details",current_time(),current_time(),15);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("flower item 2","flower item 2 description",15.00,"flower item 2 details",current_time(),current_time(),15);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("flower item 3","flower item 3 description",15.00,"flower item 3 details",current_time(),current_time(),15);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("flower item 4","flower item 4 description",15.00,"flower item 4 details",current_time(),current_time(),15);
INSERT INTO Products (`name`,`description`,`price`,`details`,`createdAt`,`updatedAt`,`userId`) VALUES
("flower item 5","flower item 5 description",15.00,"flower item 5 details",current_time(),current_time(),15);

USE markit_db;
-- users, not vendors, favorite vendors -- user 1 likes 11;, user 2 likes 12; user 3 likes 13; user 4 likes 14; user 5 likes 15
-- user 6 likes 11,12,13; user 7 likes 13,14,15; user 9 likes all vendors; 
-- users 8 likes no vendors, to cover the case of likes some markets but no vendors.
-- user 10 likes no vendors, to cover the case of not liking any markets nor any vendors
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 1, 11);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 2, 12);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 3, 13);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 4, 14);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 4, 15);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 5, 11);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 5, 15);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 6, 11);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 6, 12);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 6, 13);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 7, 13);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 7, 14);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 7, 15);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 9, 11);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 9, 12);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 9, 13);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 9, 14);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 9, 15);

USE markit_db;
-- vendors favorite other vendors
-- vendor 11 likes 12,13; vendor 12 likes 13,14; vendor 13 likes 14,15; vendor 14 likes 11,12,13; vendor 15 has no other favorite other vendor
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 11, 12);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 11, 13);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 12, 13);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 12, 14);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 13, 14);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 13, 15);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 14, 11);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 14, 12);
INSERT INTO userfavorites (createdAt, updatedAt, userId, favoriteId) VALUES (current_time(), current_time(), 14, 13);

USE markit_db;
-- vendors favorite markets
-- vendor 11 likes 2,3; vendor 12 likes 3,4; vendor 13 likes 4,5; vendor 14 likes 1,2,3; vendor 15 has no favorite market yet
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 11, 2);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 11, 3);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 12, 3);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 12, 4);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 13, 4);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 13, 5);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 14, 1);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 14, 2);
INSERT INTO usermarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 14, 3);

USE markit_db;
-- vendors schedules at favorite markets
-- vendor 11 has 1 different dates at 1 favorite markets (1 total)
-- vendor 12 has 2 different dates at 2 favorite market2 (4 total)
-- no other vendors have dates yet
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-14 10:00:00", "2020-06-14 14:00:00",current_time(),current_time(), 2, 11);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-14 10:00:00", "2020-06-14 14:00:00",current_time(),current_time(), 3, 12);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-15 10:00:00", "2020-06-15 14:00:00",current_time(),current_time(), 3, 12);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-16 10:00:00", "2020-06-16 14:00:00",current_time(),current_time(), 4, 12);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-17 10:00:00", "2020-06-17 14:00:00",current_time(),current_time(), 4, 12);

