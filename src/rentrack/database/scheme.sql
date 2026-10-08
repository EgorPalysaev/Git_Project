--CREATE DATABASE data;
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS `user_name`;
DROP TABLE IF EXISTS `role_name`;
DROP TABLE IF EXISTS `user_role`;
DROP TABLE IF EXISTS `premise`;

 
CREATE TABLE `user_name`(					 --DROP TABLE <name> means delete table
	userID INTEGER PRIMARY KEY AUTOINCREMENT,		 --AUTO_INCREMENT means id++, AUTOINCREMENT means unique id also after deleting
	name varchar(32) NOT NULL,			 --VARCHAR() can encode under 256 symdols
	surname varchar(32) NOT NULL,			 --TEXT can encode under 2^16 symbols
	patronymic varchar(32) NOT NULL
);
INSERT INTO user_name (name, surname, patronymic) VALUES ('Egor', 'Palysaev', 'Aleksandrovich');

CREATE TABLE `role_name`(
	RoleID INTEGER PRIMARY KEY NOT NULL,
	Role VARCHAR(16) NOT NULL
);

INSERT INTO `role_name` VALUES (1, 'Tenant');
INSERT INTO `role_name` VALUES (2, 'Landlord');

CREATE TABLE user_role(
	user_role_ID INTEGER PRIMARY KEY,			--INT AUTO_INCREMENT doesnt working in sqlite
	Role VARCHAR(32) NOT NULL,
        `User` VARCHAR(32) NOT NULL
);
INSERT INTO user_roles(Role, `User`) VALUES ((SELECT Role FROM role_name WHERE RoleID = 1), (SELECT Name FROM user_name WHERE userID = 1));

CREATE TABLE premise(
	permiseID INTEGER AUTOINNCREMENT PRIMARY KEY NOT NULL,
	specification TEXT DEFAULT NULL,
	start_rent DATE DEFAULT CURRENT_TIMESTAMP,
	end_rent DATE DEFAULT NULL
);
