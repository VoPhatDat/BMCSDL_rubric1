-- USER
CREATE TABLE USERS (
    user_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name      VARCHAR2(30) NOT NULL,
    email          VARCHAR2(40) NOT NULL,
    phone          VARCHAR2(15),
    password_raw   VARCHAR2(80)
);

--PRODUCTS
CREATE TABLE PRODUCTS (
    product_id     VARCHAR2(5) PRIMARY KEY,
    product_name   VARCHAR2(100) NOT NULL,
    price          NUMBER(10,2) CHECK (price > 0),
    description    VARCHAR2(200)
);

--ORDERS
CREATE TABLE ORDERS (
    order_id       VARCHAR2(5) PRIMARY KEY,
    user_id        NUMBER NOT NULL,
    product_id     VARCHAR2(5) NOT NULL,
    created_at     DATE DEFAULT SYSDATE,
    CONSTRAINT fk_orders_user FOREIGN KEY (user_id) REFERENCES USERS(user_id),
    CONSTRAINT fk_orders_product FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id)
);

--DELETE Table
DROP TABLE ORDERS;
DROP TABLE PRODUCTS;
DROP TABLE USERS;

--ADD Data
INSERT INTO USERS (full_name,  email, phone, password_raw) VALUES ('Nguyen Van A', 'a@example.com', '0123456789', 'abc123');
INSERT INTO USERS (full_name, email, phone, password_raw) VALUES ('Tran Thi B', 'b@example.com', '0988888888', 'mypassword');
INSERT INTO USERS (full_name, email, phone, password_raw) VALUES ('Le Van C', 'c@example.com', '0909090909', 'pass123');

INSERT INTO PRODUCTS (product_id, product_name, price, description) VALUES ('P0001', 'Laptop ASUS', 15000000, 'Laptop vãn ph?ng');
INSERT INTO PRODUCTS (product_id, product_name, price, description) VALUES ('P0002', 'iPhone 15', 28000000, 'Ði?n tho?i cao c?p');
INSERT INTO PRODUCTS (product_id, product_name, price, description) VALUES ('P0003', 'AirPods Pro 2', 5500000, 'Tai nghe ch?ng ?n');

INSERT INTO ORDERS (order_id, user_id, product_id) VALUES ('O0001', 1, 'P0001');
INSERT INTO ORDERS (order_id, user_id, product_id) VALUES ('O0002', 2, 'P0002');
INSERT INTO ORDERS (order_id, user_id, product_id) VALUES ('O0003', 1, 'P0003');

--VIEW ALL
SELECT * FROM USERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;


--ADD NEW COLUMN FOR STATUS ENCRYPT
ALTER TABLE USERS ADD password_enc RAW(2000);


