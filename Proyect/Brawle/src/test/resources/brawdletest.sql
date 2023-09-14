SET MODE MYSQL;

DROP TABLE IF EXISTS LEGENDS_WEAPONS;
DROP TABLE IF EXISTS GAMES_USERS;
DROP TABLE IF EXISTS LEGENDS_RACES;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS GAMES;
DROP TABLE IF EXISTS LEGENDS;
DROP TABLE IF EXISTS GENDERS;
DROP TABLE IF EXISTS WEAPONS;
DROP TABLE IF EXISTS YEARS;
DROP TABLE IF EXISTS RACES;
DROP TABLE IF EXISTS ROLES;


CREATE TABLE RACES(
    NAME VARCHAR(30) PRIMARY KEY NOT NULL
);

CREATE TABLE GENDERS(
    NAME VARCHAR(10) PRIMARY KEY NOT NULL
);

CREATE TABLE YEARS(
    NUM INT PRIMARY KEY NOT NULL
);

CREATE TABLE LEGENDS(
    ID INT AUTO_INCREMENT,
    NAME VARCHAR(20) NOT NULL,
    GENDER_NAME VARCHAR(10) NOT NULL,
    YEAR_NUM INT NOT NULL,
    CONSTRAINT PK_LEGENDS PRIMARY KEY(ID),
    CONSTRAINT FK_LEGENDS_GENDERS FOREIGN KEY(GENDER_NAME) REFERENCES GENDERS(NAME),
    CONSTRAINT FK_LEGENDS_YEARS FOREIGN KEY(YEAR_NUM) REFERENCES YEARS(NUM),
    CONSTRAINT UNIQUE_NAME UNIQUE(NAME)
);

CREATE TABLE LEGENDS_RACES(
    LEGEND_ID INT NOT NULL,
    RACE_NAME VARCHAR(30) NOT NULL,
    CONSTRAINT PK_LEGENDS_RACES PRIMARY KEY(LEGEND_ID, RACE_NAME),
    CONSTRAINT FK_LEGENDS_RACES_LEGENDS FOREIGN KEY(LEGEND_ID) REFERENCES LEGENDS(ID),
    CONSTRAINT FK_LEGENDS_RACES_RACES FOREIGN KEY(RACE_NAME) REFERENCES RACES(NAME)
);

CREATE TABLE WEAPONS(
    NAME VARCHAR(20) NOT NULL,
    CONSTRAINT PK_WEAPONS PRIMARY KEY(NAME)
);

CREATE TABLE LEGENDS_WEAPONS(
    LEGEND_ID INT NOT NULL,
    WEAPON_NAME VARCHAR(20) NOT NULL,
    CONSTRAINT PK_LEGENDS_WEAPONS PRIMARY KEY(LEGEND_ID, WEAPON_NAME),
    CONSTRAINT FK_LEGENDS_WEAPONS_LEYEND FOREIGN KEY(LEGEND_ID) REFERENCES LEGENDS(ID),
    CONSTRAINT FK_LEGENDS_WEAPONS_WEAPON FOREIGN KEY(WEAPON_NAME) REFERENCES WEAPONS(NAME)
);

CREATE TABLE GAMES(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    LEGEND_ID INT NOT NULL,
    CONSTRAINT FK_GAMES_USERS FOREIGN KEY(LEGEND_ID) REFERENCES LEGENDS(ID)
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
    DELETED TINYINT DEFAULT 0,
    CONSTRAINT UNIQUE_EMAIL UNIQUE(EMAIL),
    CONSTRAINT FK_ROLES_USERS FOREIGN KEY(ROLE_NAME) REFERENCES ROLES(NAME)
);

CREATE TABLE GAMES_USERS(
    GAME_ID INT NOT NULL,
    USER_ID INT NOT NULL,
    GUESSED INT DEFAULT '0',
    NUM_TRIES INT DEFAULT '0',
    CONSTRAINT PK_GAMES_USERS PRIMARY KEY(GAME_ID,USER_ID),
    CONSTRAINT FK_GAMES_GAMES_USERS FOREIGN KEY(GAME_ID) REFERENCES GAMES(ID),
    CONSTRAINT FK_USERS_GAMES_USERS FOREIGN KEY(USER_ID) REFERENCES USERS(ID)
);

INSERT INTO RACES(NAME) VALUES('Humanoid');
INSERT INTO RACES(NAME) VALUES('Fictional');
INSERT INTO RACES(NAME) VALUES('Animaloid');
INSERT INTO RACES(NAME) VALUES('Robotic');

INSERT INTO GENDERS(NAME) VALUES('Male');
INSERT INTO GENDERS(NAME) VALUES('Female');
INSERT INTO GENDERS(NAME) VALUES('Unknown');

INSERT INTO YEARS(NUM) VALUES(2014);
INSERT INTO YEARS(NUM) VALUES(2015);

INSERT INTO LEGENDS(ID, NAME, GENDER_NAME, YEAR_NUM) VALUES(1, 'Bödvar', 'Male', 2014);

INSERT INTO LEGENDS(ID, NAME, GENDER_NAME, YEAR_NUM) VALUES(2, 'Cassidy', 'Female', 2014);

INSERT INTO WEAPONS(NAME) VALUES('Grapple Hammer');
INSERT INTO WEAPONS(NAME) VALUES('Sword');
INSERT INTO WEAPONS(NAME) VALUES('Blasters');

INSERT INTO LEGENDS_WEAPONS(LEGEND_ID, WEAPON_NAME) VALUES(1, 'Grapple Hammer');
INSERT INTO LEGENDS_WEAPONS(LEGEND_ID, WEAPON_NAME) VALUES(1, 'Sword');

INSERT INTO LEGENDS_WEAPONS(LEGEND_ID, WEAPON_NAME) VALUES(2, 'Blasters');
INSERT INTO LEGENDS_WEAPONS(LEGEND_ID, WEAPON_NAME) VALUES(2, 'Grapple Hammer');

INSERT INTO LEGENDS_RACES(LEGEND_ID, RACE_NAME) VALUES(1, 'Humanoid');

INSERT INTO LEGENDS_RACES(LEGEND_ID, RACE_NAME) VALUES(1, 'Animaloid');

INSERT INTO LEGENDS_RACES(LEGEND_ID, RACE_NAME) VALUES(2, 'Humanoid');

INSERT INTO ROLES(NAME) VALUES('Admin');
INSERT INTO ROLES(NAME) VALUES('User');

INSERT INTO USERS(ID, EMAIL, NICK, PASSWORD, ROLE_NAME) VALUES(1, 'admin123@gmail.com', 'Admin', '1q2w3e4r', 'Admin');
INSERT INTO USERS(ID, EMAIL, NICK, PASSWORD, ROLE_NAME) VALUES(2, 'coso@gmail.com', 'Coso', 'CosoPassword', 'User');

INSERT INTO GAMES(ID, LEGEND_ID) VALUES(1, 1);
INSERT INTO GAMES(ID, LEGEND_ID) VALUES(2, 1);
INSERT INTO GAMES(ID, LEGEND_ID) VALUES(3, 1);

INSERT INTO GAMES_USERS(GAME_ID, USER_ID, GUESSED, NUM_TRIES) VALUES(1, 2, 1, 5);
INSERT INTO GAMES_USERS(GAME_ID, USER_ID, GUESSED, NUM_TRIES) VALUES(2, 2, 0, 8);
INSERT INTO GAMES_USERS(GAME_ID, USER_ID, GUESSED, NUM_TRIES) VALUES(1, 2, 1, 5);
INSERT INTO GAMES_USERS(GAME_ID, USER_ID, GUESSED, NUM_TRIES) VALUES(2, 2, 0, 8);