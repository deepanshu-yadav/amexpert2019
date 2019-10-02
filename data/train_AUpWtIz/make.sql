SET datestyle = dmy;
DROP TABLE IF EXISTS "campaign";
CREATE TABLE campaign
(
    campaign_id INT PRIMARY KEY,
    campaign_type TEXT,
    start_date DATE,
    end_date DATE
    

);

COPY campaign
	FROM  '/home/deepanshu/Documents/amexpert2019/data/train_AUpWtIz/campaign_data.csv' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "customer_details";
CREATE TABLE customer_details
(
    customer_id       INT PRIMARY KEY,
    age_range         TEXT ,
    marital_status    TEXT ,
    rented            INT ,
    family_size       TEXT ,
    no_of_children    TEXT ,
    income_bracket    INT
);


COPY customer_details
	FROM  '/home/deepanshu/Documents/amexpert2019/data/train_AUpWtIz/customer_demographics.csv' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "items";
CREATE TABLE items
(
    item_id       INT PRIMARY KEY,
    brand         INT ,
    brand_type    TEXT ,
    category      TEXT
);


COPY items
	FROM  '/home/deepanshu/Documents/amexpert2019/data/train_AUpWtIz/item_data.csv' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "coupon_item";
CREATE TABLE coupon_item
(
    coupon_id    INT,
    item_id      INT 
    --FOREIGN KEY (item_id) REFERENCES items(item_id)
);


COPY coupon_item
	FROM  '/home/deepanshu/Documents/amexpert2019/data/train_AUpWtIz/coupon_item_mapping.csv' (DELIMITER ',', FORMAT CSV, HEADER);

DROP TABLE IF EXISTS "customer_details";
CREATE TABLE customer_details
(
    customer_id       INT PRIMARY KEY,
    age_range         TEXT ,
    marital_status    TEXT ,
    rented            INT ,
    family_size       TEXT ,
    no_of_children    TEXT ,
    income_bracket    INT
);


COPY customer_details
	FROM  '/home/deepanshu/Documents/amexpert2019/data/train_AUpWtIz/customer_demographics.csv' (DELIMITER ',', FORMAT CSV, HEADER);

DROP TABLE IF EXISTS "transaction";
CREATE TABLE transaction
(
    trans_date   DATE ,
    customer_id        INT ,
    item_id            INT ,
    quantity           INT ,
    selling_price      NUMERIC ,
    other_discount     NUMERIC ,
    coupon_discount    NUMERIC
);


COPY transaction
	FROM  '/home/deepanshu/Documents/amexpert2019/data/train_AUpWtIz/customer_transaction_data.csv' (DELIMITER ',', FORMAT CSV, HEADER);






DROP TABLE IF EXISTS "train";
CREATE TABLE train
(
    id   INT PRIMARY KEY ,
    campaign_id          INT ,
    coupon_id            INT ,
    customer_id          INT ,
    redemption_status    INT 
    --FOREIGN KEY (campaign_id) REFERENCES campaign(campaign_id) ,
    --FOREIGN KEY (coupon_id) REFERENCES coupon_item(coupon_id) , 
    --FOREIGN KEY (customer_id) REFERENCES customer_details(customer_id)  
);


COPY train
	FROM  '/home/deepanshu/Documents/amexpert2019/data/train_AUpWtIz/train.csv' (DELIMITER ',', FORMAT CSV, HEADER);


SELECT * 
FROM transaction
INNER JOIN customer_details  ON transaction.customer_id = customer_details.customer_id
INNER JOIN items on transaction.item_id = items.item_id
INNER JOIN train on transaction.customer_id = train.customer_id


