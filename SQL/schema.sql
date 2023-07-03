DROP DATABASE IF EXISTS BRAWLE;
CREATE DATABASE BRAWLE;
USE BRAWLE;

DROP TABLE IF EXISTS LEYENDS_WEAPONS;
DROP TABLE IF EXISTS GAMES_USERS;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS GAMES;
DROP TABLE IF EXISTS GENDERS;
DROP TABLE IF EXISTS WEAPONS;
DROP TABLE IF EXISTS YEARS;
DROP TABLE IF EXISTS RACES;
DROP TABLE IF EXISTS ROLES;
DROP TABLE IF EXISTS LEYENDS;

CREATE TABLE RACES(
    NAME VARCHAR(15) PRIMARY KEY NOT NULL
);

CREATE TABLE GENDERS(
    NAME VARCHAR(10) PRIMARY KEY NOT NULL
);

CREATE TABLE YEARS(
    NUM INT PRIMARY KEY NOT NULL
);

CREATE TABLE LEYENDS(
    ID INT AUTO_INCREMENT,
    NAME VARCHAR(20) NOT NULL,
    RACE_NAME VARCHAR(15) NOT NULL,
    GENDER_NAME VARCHAR(10) NOT NULL,
    YEAR_NUM INT NOT NULL,
    CONSTRAINT PK_LEYENDS PRIMARY KEY(ID),
    CONSTRAINT FK_LEYENDS_RACES FOREIGN KEY(RACE_NAME) REFERENCES RACES(NAME),
    CONSTRAINT FK_LEYENDS_GENDERS FOREIGN KEY(GENDERS_NAME) REFERENCES GENDERS(NAME),
    CONSTRAINT FK_LEYENDS_YEARS FOREIGN KEY(YEAR_NUM) REFERENCES YEARS(NUM),
    CONSTRAINT UNIQUE_NAME UNIQUE(NAME)
);

CREATE TABLE WEAPONS(
    NAME VARCHAR(20) NOT NULL,
    CONSTRAINT PK_WEAPONS PRIMARY KEY(NAME)
);

CREATE TABLE LEYENDS_WEAPONS(
    LEYEND_ID INT NOT NULL,
    WEAPON_NAME VARCHAR(20),
    CONSTRAINT PK_LEYENDS_WEAPONS PRIMARY KEY(LEYEND_ID, WEAPON_NAME),
    CONSTRAINT FK_LEYENDS_WEAPONS_LEYEND FOREIGN KEY(LEYEND_ID) REFERENCES LEYENDS(ID),
    CONSTRAINT FK_LEYENDS_WEAPONS_WEAPON FOREIGN KEY(WEAPON_NAME) REFERENCES WEAPONS(NAME)
);

CREATE TABLE GAMES(
    ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    LEYEND_ID INT NOT NULL,
    CONSTRAINT FK_GAMES_USERS FOREIGN KEY(LEYEND_ID) REFERENCES LEYENDS(ID)
);

CREATE TABLE ROLES(
  NAME VARCHAR(10) PRIMARY KEY NOT NULL
);

CREATE TABLE USERS(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    EMAIL VARCHAR(80) NOT NULL,
    NICK VARCHAR(50) NOT NULL,
    PASSWORD VARCHAR (255) NOT NULL,
    ROLE_NAME VARCHAR(10) NOT NULL,
    CONSTRAINT UNIQUE_EMAIL UNIQUE(EMAIL),
    CONSTRAINT FK_ROLES_USERS FOREIGN KEY(ROL_NAME) REFERENCES ROLES(NAME)
);

CREATE TABLE GAMES_USERS(
    GAME_ID INT NOT NULL,
    USER_ID INT NOT NULL,
    GUESSED INT,
    NUM_TRIES INT DEAFULT '0',
    CONSTRAINT PK_GAMES_USERS PRIMARY KEY(GAME_ID,USER_ID),
    CONSTRAINT FK_GAMES_GAMES_USERS FOREIGN KEY(GAME_ID) REFERENCES GAMES(ID),
    CONSTRAINT FK_USERS_GAMES_USERS FOREIGN KEY(USER_ID) REFERENCES USERS(ID)
);

CREATE VIEW GAME_ALL AS 
SELECT L.ID, L.NAME, R.NAME AS RACE, G.NAME AS GENDER, Y.NUM AS YEAR, W.NAME AS WEAPON_1, W.NAME AS WEAPON_2 
FROM LEYENDS AS L, RACES AS R, GENDERS AS G, YEARS AS Y, WEAPON AS W, LEYENDS_WEAPONS AS LW
WHERE 
;