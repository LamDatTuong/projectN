USE cuahanggame;
CREATE TABLE `User`(
    `userID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `userName` LINESTRING NOT NULL,
    `email` LINESTRING NOT NULL,
    `createAt` LINESTRING NOT NULL,
    `lastLoginbigint` LINESTRING NOT NULL,
    `status` LINESTRING NOT NULL
);
ALTER TABLE
    `User` ADD INDEX `user_userid_index`(`userID`);
CREATE TABLE `Admin`(
    `adminID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `lastLogin` DATETIME NOT NULL
);
CREATE TABLE `Customer`(
    `costumerID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `phone` BIGINT NOT NULL,
    `city` BIGINT NOT NULL
);
CREATE TABLE `Invoice`(
    `invoiceID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `totalAmount` DOUBLE NOT NULL,
    `invoiceDate` DATETIME NOT NULL
);
CREATE TABLE `Payment`(
    `paymentID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `paymentMethod` LINESTRING NOT NULL,
    `paymentDate` DATETIME NOT NULL,
    `status` LINESTRING NOT NULL
);
CREATE TABLE `Review`(
    `reviewID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `rating` BIGINT NOT NULL,
    `comment` MULTILINESTRING NOT NULL,
    `reviewDate` DATETIME NOT NULL
);
CREATE TABLE `Cart`(
    `cartID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `quantity` BIGINT NOT NULL,
    `createAt` DATETIME NOT NULL,
    `totalPrice` DOUBLE NOT NULL
);
CREATE TABLE `Product`(
    `productID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` LINESTRING NOT NULL,
    `decripstion` MULTILINESTRING NOT NULL,
    `price` DOUBLE NOT NULL,
    `publisher` LINESTRING NOT NULL,
    `releaseDate` DATETIME NOT NULL,
    `platform` LINESTRING NOT NULL,
    `imageUrl` LINESTRING NOT NULL,
    `trailerUrl` LINESTRING NOT NULL,
    `status` LINESTRING NOT NULL
);
CREATE TABLE `Category`(
    `categoryID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` LINESTRING NOT NULL,
    `description` MULTILINESTRING NOT NULL
);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_productid_foreign` FOREIGN KEY(`productID`) REFERENCES `Category`(`categoryID`);
ALTER TABLE
    `Customer` ADD CONSTRAINT `customer_costumerid_foreign` FOREIGN KEY(`costumerID`) REFERENCES `Review`(`reviewID`);
ALTER TABLE
    `Invoice` ADD CONSTRAINT `invoice_invoiceid_foreign` FOREIGN KEY(`invoiceID`) REFERENCES `Payment`(`paymentID`);
ALTER TABLE
    `Customer` ADD CONSTRAINT `customer_costumerid_foreign` FOREIGN KEY(`costumerID`) REFERENCES `Cart`(`cartID`);
ALTER TABLE
    `Review` ADD CONSTRAINT `review_reviewid_foreign` FOREIGN KEY(`reviewID`) REFERENCES `Product`(`productID`);
ALTER TABLE
    `User` ADD CONSTRAINT `user_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `Admin`(`adminID`);
ALTER TABLE
    `Customer` ADD CONSTRAINT `customer_costumerid_foreign` FOREIGN KEY(`costumerID`) REFERENCES `Invoice`(`invoiceID`);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_productid_foreign` FOREIGN KEY(`productID`) REFERENCES `Invoice`(`invoiceID`);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_productid_foreign` FOREIGN KEY(`productID`) REFERENCES `Cart`(`cartID`);
ALTER TABLE
    `User` ADD CONSTRAINT `user_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `Customer`(`costumerID`);