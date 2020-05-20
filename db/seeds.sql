
-- markets
USE abas30xkmx6amb7u;
-- USE markit_db;

-- markets
INSERT INTO markets (id, market_name, createdAt, updatedAt) VALUES ("1012150", "Pike Place Market - Microsoft Commons Farmers Market", current_time(), current_time());
INSERT INTO markets (id, market_name, createdAt, updatedAt) VALUES ("1016799", "Maple Valley Farmers' Market", current_time(), current_time());
INSERT INTO markets (id, market_name, createdAt, updatedAt) VALUES ("1010884", "Whitehorse Farmers Market", current_time(), current_time());
INSERT INTO markets (id, market_name, createdAt, updatedAt) VALUES ("1009706", "Friday Farmers Market Everett Mall", current_time(), current_time());
INSERT INTO markets (id, market_name, createdAt, updatedAt) VALUES ("1000666", "Kirkland Wedneseday Market", current_time(), current_time());

-- users, not vendors -- user ids 1 through 10
-- INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
-- ("shopper1","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Samantha", "Smith", "s.smith@test.com", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper2","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Sally", "Sandler", "s.sandler@test.com", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper3","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Susan", "Slate", "s.slate@test.com", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper4","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Sophia", "Stokes", "s.stokes@test.com", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper5","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Scarlett", "Shoemaker", "s.shoemaker@test.com", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper6","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Stella", "Snyder", "s.snyder@test.com", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper7","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Savannah", "Stoltz", "s.stoltz@test.com", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper8","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Sarah", "Stanford", "s.stanford@test.com", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper9","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Serenity", "Stewart", "s.stewart@test.com", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, createdAt, updatedAt) VALUES 
("shopper10","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Stephanie", "Swift", "s.swift@test.com", current_timestamp(), current_timestamp());

USE abas30xkmx6amb7u;
-- users, not vendors, favorite markets -- user 1 likes market 1; user 2 likes 1,2; user 3 likes 1,2,3; user 4 likes 1,2,3,4; user 5 likes 1,2,3,4,5
-- user 6 likes 1,2; user 7 likes 2,3; user 8 likes 3,4; user 9 likes 3,4, user 10 likes nothing
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 1, 1012150);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 2, 1012150);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 2, 1016799);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 3, 1012150);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 3, 1016799);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 3, 1010884);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 4, 1012150);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 4, 1016799);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 4, 1010884);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 4, 1009706);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 1012150);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 1016799);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 1010884);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 1009706);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 5, 1000666);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 6, 1012150);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 6, 1016799);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 7, 1016799);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 7, 1010884);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 8, 1009706);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 8, 1010884);

-- users who are vendors -- user ids 11 through 15
INSERT INTO users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor1","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Victor", "Victoria", "v.victoria@test.com", "Victors Bakery", "bakery@test.com", "(206) 999-8888", "2069998888", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor2","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Vladimir", "Vader", "v.vader@test.com", "Vladimirs Produce", "produce@test.com", "(206) 777-6666", "2067776666", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor3","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Vicki", "Vale", "v.vale@test.com", "Vickis Jewelry", "jewelry@test.com", "(206) 555-4444", "2065554444", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor4","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Veronica","vanDoorn", "v.vandoorn@test.com", "Veronicas Candles", "candles@test.com", "(206) 333-2222", "2063332222", current_timestamp(), current_timestamp());
INSERT INTO users (username, password, first_name, last_name, email, vendor_name, vendor_email, vendor_phone, bus_lic, createdAt, updatedAt) VALUES 
("vendor5","$2b$10$XdWwqBIXqIdc3gUXUNpo6OMMUslzEax/N.ymahcf84gtKWwZ/XNz2", "Vance", "Venus", "v.venus@test.com", "Vances Flowers", "flowers@test.com", "(206) 111-0000", "2061110000", current_timestamp(), current_timestamp());

-- vendors products -- vendor 11 has one product, vendor 12 has two, vendor 13 has 3, 14 has 4, 15 has 5
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Beaded Necklace Strings","Variety item",15,"Pricing starts at $15.00. Many colors, lengths and styles to choose from!","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829070/kbw1jkzokbyrte73nzh8.jpg",current_time(),current_time(),13);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Clay Butterfly Earrings","handmade from Fimo clay",25,"blues shown, other colors available","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829317/j53xeyluvn0dav0rwjgu.jpg",current_time(),current_time(),13);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Bracelet","hammered copper",40,"local artisan","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829653/rxnldhvdfsnyt3gt6slf.jpg",current_time(),current_time(),13);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Jewelry Box","hammered copper",125,"rustic, beautiful and functional","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829687/ufjnsuizczm1im4x0qk2.jpg",current_time(),current_time(),13);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Beeswax Candles","Pillar style",15,"3 sizes","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829166/unc3r2pmbzhoazggni71.jpg",current_time(),current_time(),14);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Beeswax Candles","Taper Style",12.5,"Priced per pair","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829228/k0rjrvbogz7pldp3kfoz.jpg",current_time(),current_time(),14);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Floral candle jar","variety styles and scents",17.5,"small burns 6 hours","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829566/hntmt8vwmd9aeyi0dypo.jpg",current_time(),current_time(),14);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Bell peppers","red, yellow, green",2.49,"price per each","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829282/b0rhvwpautatzzh5uztw.jpg",current_time(),current_time(),12);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Carrots","locally grown",1.49,"price per pound","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829400/e74fmmjue2twgtopsz6p.jpg",current_time(),current_time(),12);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Cherries","eastern washington orchard",3.99,"delivered daily!","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829428/bmlynxlxd9f3zzumdnv1.jpg",current_time(),current_time(),12);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Grapes","delivered daily",3.99,"price per pound","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829623/fm6tb77mnncbkqtoji4k.jpg",current_time(),current_time(),12);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Peaches","local crop",3.49,"large, sweet, juicy!","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829991/pagwc87iv1xqnbpbxa57.jpg",current_time(),current_time(),12);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Baby Spinach","local farm",5,"pre-washed, 8 oz container","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589830038/hp8dbd04mwhd7knppni8.jpg",current_time(),current_time(),12);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Sweet Potato","harvested locally",2,"price per pound","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589830083/rsfk0wlqfshzxnosrlkq.jpg",current_time(),current_time(),12);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Daffodils","spring blooms",5,"3 stems","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829490/j7atktpfextnfq16meqf.jpg",current_time(),current_time(),15);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Lillies","potted for longer blooms",27,"10-inch pot","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829790/ggtvx8wa3mhxf7wafc7a.jpg",current_time(),current_time(),15);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Tulips","spring blooms",5,"3 stems","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829538/pj0ctpr07dklakoyqjkr.jpg",current_time(),current_time(),15);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Vases","Small bouquet, 2 or 3 stems",15,"many sizes, pricing starts at $15","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589830141/plrqtnlbcyt2rscnxe6z.jpg",current_time(),current_time(),15);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Focaccia bread","italian herbs",10,"half-loafs available upon request","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829734/mkrt2gow7vsvfiktlfz4.jpg",current_time(),current_time(),11);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Macarons","Chocolate, key lime, raspberry and vanilla available",15,"price per dozen, one variety","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829839/zvklhqjzhifj4fel4clr.jpg",current_time(),current_time(),11);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Muffins","Blueberry, carrot cake, chocolate, lemon varieties",8,"half-dozen","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829895/d92tmewyd5bycd1cdw8h.jpg",current_time(),current_time(),11);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Organic Sourdough Bread","artfully finished",10,"baked fresh daily","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589829953/yizn9dbmfuquv10ouleh.jpg",current_time(),current_time(),11);
INSERT INTO products (`name`,`description`,`price`,`details`,`image`,`createdAt`,`updatedAt`,`userId`) VALUES
("Whole Grain Artisan Bread","Serve tonight!",6,"Gluten-free available on request, $9","https://res.cloudinary.com/dw69fw1u3/image/upload/v1589830189/itood20yv9l9c2y8njui.jpg",current_time(),current_time(),11);

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

-- vendors favorite markets
-- vendor 11 likes 2,3; vendor 12 likes 3,4; vendor 13 likes 4,5; vendor 14 likes 1,2,3; vendor 15 has no favorite market yet
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 11, 1016799);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 11, 1010884);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 12, 1010884);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 12, 1009706);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 13, 1009706);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 13, 1000666);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 14, 1012150);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 14, 1016799);
INSERT INTO userMarkets (createdAt, updatedAt, userId, marketId) VALUES (current_time(), current_time(), 14, 1010884);


-- vendors schedules at favorite markets
-- vendor 11 has 1 different dates at 1 favorite markets (1 total)
-- vendor 12 has 2 different dates at 2 favorite market2 (4 total)
-- no other vendors have dates yet
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-14 10:00:00", "2020-06-14 14:00:00",current_time(),current_time(), 1016799, 11);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-14 10:00:00", "2020-06-14 14:00:00",current_time(),current_time(), 1010884, 12);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-15 10:00:00", "2020-06-15 14:00:00",current_time(),current_time(), 1010884, 12);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-16 10:00:00", "2020-06-16 14:00:00",current_time(),current_time(), 1009706, 12);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-17 10:00:00", "2020-06-17 14:00:00",current_time(),current_time(), 1009706, 12);

INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-06 10:00:00", "2020-06-06 14:00:00",current_time(),current_time(), 1009706, 13);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-07 10:00:00", "2020-06-07 14:00:00",current_time(),current_time(), 1000666, 13);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-13 10:00:00", "2020-06-13 14:00:00",current_time(),current_time(), 1009706, 13);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-14 10:00:00", "2020-06-14 14:00:00",current_time(),current_time(), 1000666, 13);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-20 10:00:00", "2020-06-20 14:00:00",current_time(),current_time(), 1009706, 13);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-06-27 10:00:00", "2020-06-27 14:00:00",current_time(),current_time(), 1000666, 13);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-07-04 10:00:00", "2020-07-04 14:00:00",current_time(),current_time(), 1009706, 13);
INSERT INTO schedules (open_time, close_time, createdAt, updatedAt, marketId, userId) VALUES ("2020-07-11 10:00:00", "2020-07-11 14:00:00",current_time(),current_time(), 1000666, 13);