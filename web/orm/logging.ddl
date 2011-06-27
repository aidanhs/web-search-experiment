ALTER TABLE Session DROP FOREIGN KEY FKSession127534;
ALTER TABLE Session DROP FOREIGN KEY FKSession936860;
ALTER TABLE Event DROP FOREIGN KEY FKEvent366748;
ALTER TABLE Result_Event DROP FOREIGN KEY FKResult_Eve33494;
ALTER TABLE Result_Event DROP FOREIGN KEY FKResult_Eve164561;
ALTER TABLE Event DROP FOREIGN KEY FKEvent781773;
ALTER TABLE Result_Topic DROP FOREIGN KEY FKResult_Top378803;
ALTER TABLE Result_Topic DROP FOREIGN KEY FKResult_Top716888;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Session;
DROP TABLE IF EXISTS Topic;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS Result;
DROP TABLE IF EXISTS Result_Event;
DROP TABLE IF EXISTS Result_Topic;
CREATE TABLE Event (ID int(11) NOT NULL AUTO_INCREMENT, SessionID int(11) NOT NULL, ResultID int(11), Time time NOT NULL, Seq int(11) NOT NULL, Name varchar(255), Query varchar(255), Direction int(11), Url varchar(255), Discriminator varchar(255) NOT NULL, PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Session (ID int(11) NOT NULL AUTO_INCREMENT, TopicID int(11) NOT NULL, UserID int(11) NOT NULL, ElapsedTime time, PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Topic (ID int(11) NOT NULL AUTO_INCREMENT, Name varchar(255), PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE `User` (ID int(11) NOT NULL AUTO_INCREMENT, Name varchar(255), PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Result (ID int(11) NOT NULL AUTO_INCREMENT, Title varchar(255), Url varchar(255), Description varchar(255), Rank int(11) NOT NULL, PRIMARY KEY (ID)) type=InnoDB;
CREATE TABLE Result_Event (ResultID int(11) NOT NULL, EventID int(11) NOT NULL, PRIMARY KEY (ResultID, EventID)) type=InnoDB;
CREATE TABLE Result_Topic (ResultID int(11) NOT NULL, TopicID int(11) NOT NULL, PRIMARY KEY (ResultID, TopicID)) type=InnoDB;
ALTER TABLE Session ADD INDEX FKSession127534 (UserID), ADD CONSTRAINT FKSession127534 FOREIGN KEY (UserID) REFERENCES `User` (ID);
ALTER TABLE Session ADD INDEX FKSession936860 (TopicID), ADD CONSTRAINT FKSession936860 FOREIGN KEY (TopicID) REFERENCES Topic (ID);
ALTER TABLE Event ADD INDEX FKEvent366748 (ResultID), ADD CONSTRAINT FKEvent366748 FOREIGN KEY (ResultID) REFERENCES Result (ID);
ALTER TABLE Result_Event ADD INDEX FKResult_Eve33494 (ResultID), ADD CONSTRAINT FKResult_Eve33494 FOREIGN KEY (ResultID) REFERENCES Result (ID);
ALTER TABLE Result_Event ADD INDEX FKResult_Eve164561 (EventID), ADD CONSTRAINT FKResult_Eve164561 FOREIGN KEY (EventID) REFERENCES Event (ID);
ALTER TABLE Event ADD INDEX FKEvent781773 (SessionID), ADD CONSTRAINT FKEvent781773 FOREIGN KEY (SessionID) REFERENCES Session (ID);
ALTER TABLE Result_Topic ADD INDEX FKResult_Top378803 (ResultID), ADD CONSTRAINT FKResult_Top378803 FOREIGN KEY (ResultID) REFERENCES Result (ID);
ALTER TABLE Result_Topic ADD INDEX FKResult_Top716888 (TopicID), ADD CONSTRAINT FKResult_Top716888 FOREIGN KEY (TopicID) REFERENCES Topic (ID);