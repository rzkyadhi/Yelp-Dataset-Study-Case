/* Create the Database */
CREATE DATABASE YELP_AND_THE_WEATHER

/* Choose the Database */
USE DATABASE YELP_AND_THE_WEATHER

/* CREATE SCHEMA */
CREATE SCHEMA STAGING;
CREATE SCHEMA ODS;
CREATE SCHEMA DWH;


/* CHOOSE SCHEMA*/
USE SCHEMA STAGING

/* CREATE TABLE TEMPERATURE*/
CREATE TABLE TEMPERATURE_DEGREE_F(
    date_temp DATE,
    min_temp FLOAT,
    max_temp FLOAT,
    normal_min FLOAT,
    normal_max FLOAT,
    PRIMARY KEY (date_temp)
)

/* SELECT TOP 10 FROM TEMPERATURE_F*/
SELECT * FROM TEMPERATURE_F LIMIT 10;

/* CREATE TABLE PRECIPITATION_INCH*/
CREATE TABLE PRECIPITATION_INCH(
    date_prec DATE,
    precipitation FLOAT,
    precipitation_normal FLOAT,
    PRIMARY KEY (date_prec)
)

/* SELECT TOP 10 FROM PRECIPITATION_INCH */
SELECT * FROM PRECIPITATION_INCH LIMIT 10;

/* CREATE TABLE YELP_BUSINESS */
CREATE OR REPLACE TABLE YELP_BUSINESS(
    business_id STRING,
    name_business VARCHAR(200),
    address_business VARCHAR(200),
    city_business VARCHAR(100),
    state_business STRING,
    postal_code_business STRING,
    latitude_business FLOAT,
    longitude_business FLOAT,
    stars_business INT,
    review_count_business INT,
    is_open_business INT,
    attributes TEXT,
    categories TEXT,
    hours TEXT,
    PRIMARY KEY (business_id)
)

/* CREATE TABLE YELP_CHECKIN*/
CREATE TABLE YELP_CHECKIN(
    business_id_checkin STRING,
    date STRING,
    PRIMARY KEY (business_id_checkin),
    FOREIGN KEY (business_id_checkin) REFERENCES YELP_BUSINESS(business_id)
)

/* CREATE TABLE YELP_USER */
CREATE TABLE YELP_USER(
    user_id STRING,
    name_user VARCHAR(100),
    review_count_user INT,
    yelping_since_user STRING,
    useful_user INT,
    funny_user INT,
    cool_user INT,
    elite_user STRING,
    friends_user INT,
    PRIMARY KEY (user_id)
)

/* CREATE TABLE YELP_TIP */
CREATE TABLE YELP_TIP(
    user_id_tip STRING,
    business_id_tip VARCHAR,
    text_tip TEXT,
    date_tip STRING,
    compliment_count INT,
    PRIMARY KEY (user_id_tip),
    FOREIGN KEY (user_id_tip) REFERENCES YELP_USER(user_id)
)

/* CREATE TABLE YELP_REVIEW */
CREATE TABLE YELP_REVIEW(
    review_id STRING,
    user_id STRING,
    business_id STRING,
    stars_review INT,
    useful_review INT,
    funny_review INT,
    cool_review INT,
    text_review TEXT,
    date_review STRING,
    PRIMARY KEY (review_id),
    FOREIGN KEY (user_id) REFERENCES YELP_USER(user_id),
    FOREIGN KEY (business_id) REFERENCES YELP_BUSINESS(business_id)
)