--############## start script for connection "main" #######
/*
 $$$$$$$$$$$ Attantion! Achtung! Vnimanie!


Attempt to alter a column uba_subject.name as (typeChanged: false, sizeChanged: true, allowNullChanged: false
Attempt to alter a column uba_user.trustedIP as (typeChanged: false, sizeChanged: true, allowNullChanged: false

 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 
*/

 
-- Create tables
--######################################
CREATE TABLE cdn_address (
	ID BIGINT NOT NULL PRIMARY KEY,
	addressType VARCHAR(32) NOT NULL, --Address type
	value VARCHAR(255) NOT NULL, --Address
	subjectID BIGINT NOT NULL, --Subject
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ADDR_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ADDR_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ADDR_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ADDR_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_adminunit (
	ID BIGINT NOT NULL PRIMARY KEY,
	parentAdminUnitID BIGINT NULL, --Parent
	code VARCHAR(16) NOT NULL, --Internal code
	name VARCHAR(128) NOT NULL, --Name
	fullName VARCHAR(255) NULL, --Full name
	adminUnitType VARCHAR(32) NOT NULL, --Admin unit type
	caption VARCHAR(1024) NULL, --Caption
	mi_unityEntity VARCHAR(64) NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ADMUNT_PARENTADMINUNITID_REF_ADMUNT FOREIGN KEY (PARENTADMINUNITID) REFERENCES cdn_adminunit(ID)	
	, CONSTRAINT FK_ADMUNT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ADMUNT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ADMUNT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ADMUNT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_bank (
	ID BIGINT NOT NULL PRIMARY KEY,
	MFO VARCHAR(16) NOT NULL, --Bank branch code
	code VARCHAR(16) NULL, --Bank organization code
	name VARCHAR(128) NOT NULL, --Name without quotes and ownership. For searching data.
	fullName VARCHAR(128) NOT NULL, --Full official bank name . For displaying in reports.
	phones VARCHAR(255) NULL, --Phones
	address VARCHAR(255) NULL, --Address
	countryID BIGINT NULL, --Registration country
	cityID BIGINT NULL, --City
	description VARCHAR(512) NOT NULL, --Description
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_BANK_COUNTRYID_REF_CNTR FOREIGN KEY (COUNTRYID) REFERENCES cdn_country(ID)	
	, CONSTRAINT FK_BANK_CITYID_REF_CITY FOREIGN KEY (CITYID) REFERENCES cdn_city(ID)	
	, CONSTRAINT FK_BANK_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_BANK_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_BANK_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_BANK_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_building (
	ID BIGINT NOT NULL PRIMARY KEY,
	streetID BIGINT NOT NULL, --Street
	postIndexID BIGINT NOT NULL, --Zip
	code VARCHAR(20) NOT NULL, --Code
	description VARCHAR(255) NULL, --Description
	buildingType VARCHAR(32) DEFAULT ('HOUSE') NOT NULL, --Type
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_BUILDING_STREETID_REF_STREET FOREIGN KEY (STREETID) REFERENCES cdn_street(ID)	
	, CONSTRAINT FK_BUILDING_POSTINDEXID_REF_POSTIDX FOREIGN KEY (POSTINDEXID) REFERENCES cdn_postindex(ID)	
	, CONSTRAINT FK_BUILDING_MI_DATA_ID_REF_BUILDING FOREIGN KEY (MI_DATA_ID) REFERENCES cdn_building(ID)	
	, CONSTRAINT FK_BUILDING_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_BUILDING_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_BUILDING_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_BUILDING_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_city (
	ID BIGINT NOT NULL PRIMARY KEY,
	parentAdminUnitID BIGINT NOT NULL, --Parent
	code VARCHAR(16) NOT NULL, --City code
	name VARCHAR(128) NOT NULL, --City name
	caption VARCHAR(255) NULL, --Caption
	description VARCHAR(255) NULL, --City description
	postalCode VARCHAR(64) NULL, --City postal code
	phoneCode VARCHAR(64) NULL, --City phone code
	cityTypeID BIGINT NULL, --City type
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CITY_PARENTADMINUNITID_REF_ADMUNT FOREIGN KEY (PARENTADMINUNITID) REFERENCES cdn_adminunit(ID)	
	, CONSTRAINT FK_CITY_CITYTYPEID_REF_CITYT FOREIGN KEY (CITYTYPEID) REFERENCES cdn_citytype(ID)	
	, CONSTRAINT FK_CITY_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CITY_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CITY_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CITY_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CITY_ID_REF_ADMUNT FOREIGN KEY (ID) REFERENCES cdn_adminunit(ID)	
);
--
CREATE TABLE cdn_citytype (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) NOT NULL, --Internal code of city type
	name VARCHAR(128) NOT NULL, --City type name
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CITYT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CITYT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CITYT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CITYT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_classifier (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(255) NOT NULL, --Code
	name VARCHAR(255) NOT NULL, --Name
	description VARCHAR(255) NULL, --Description
	orderByAttr VARCHAR(32) DEFAULT ('code') NULL, --Classifier item sort order
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CDNCLS_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNCLS_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNCLS_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNCLS_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_classifieritem (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(255) NOT NULL, --System code
	name VARCHAR(255) NOT NULL, --Name
	classifierID BIGINT NOT NULL, --Classifier
	parentID BIGINT NULL, --Parent
	hierarchyLevel INTEGER NULL, --Level
	mi_treePath VARCHAR(450) NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CDNCLSI_CLASSIFIERID_REF_CDNCLS FOREIGN KEY (CLASSIFIERID) REFERENCES cdn_classifier(ID)	
	, CONSTRAINT FK_CDNCLSI_PARENTID_REF_CDNCLSI FOREIGN KEY (PARENTID) REFERENCES cdn_classifieritem(ID)	
	, CONSTRAINT FK_CDNCLSI_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNCLSI_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNCLSI_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNCLSI_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_contact (
	ID BIGINT NOT NULL PRIMARY KEY,
	contactTypeID BIGINT NOT NULL, --Contact type
	value VARCHAR(255) NOT NULL, --Contact
	subjectID BIGINT NOT NULL, --Subject
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CONT_CONTACTTYPEID_REF_CONTTY FOREIGN KEY (CONTACTTYPEID) REFERENCES cdn_contacttype(ID)	
	, CONSTRAINT FK_CONT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CONT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CONT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CONT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_contacttype (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) NOT NULL, --Code
	name VARCHAR(128) NOT NULL, --Contact type name
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CONTTY_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CONTTY_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CONTTY_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CONTTY_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_corrindex (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) NOT NULL, --Code of correspondent index
	name VARCHAR(128) NOT NULL, --Name of correspondent index
	fullName VARCHAR(255) NOT NULL, --Full name of correspondent index
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CORIDX_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CORIDX_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CORIDX_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CORIDX_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_country (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) NOT NULL, --Internal code
	name VARCHAR(128) NOT NULL, --Name of the country
	fullName VARCHAR(255) NOT NULL, --Full official name of the country
	intCode INTEGER NOT NULL, --Digital code of the country
	symbol2 VARCHAR(2) NOT NULL, --2-character code of the country by ISO classification
	symbol3 VARCHAR(3) NOT NULL, --3-character code of the country by IOC classification
	description VARCHAR(255) NULL, --Country description
	phoneCode VARCHAR(64) NULL, --Country phone code
	currencyID BIGINT NULL, --Main currency of the country
	capitalID BIGINT NULL, --Capital of the country
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CNTR_CURRENCYID_REF_CURR FOREIGN KEY (CURRENCYID) REFERENCES cdn_currency(ID)	
	, CONSTRAINT FK_CNTR_CAPITALID_REF_CITY FOREIGN KEY (CAPITALID) REFERENCES cdn_city(ID)	
	, CONSTRAINT FK_CNTR_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CNTR_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CNTR_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CNTR_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CNTR_ID_REF_ADMUNT FOREIGN KEY (ID) REFERENCES cdn_adminunit(ID)	
);
--
CREATE TABLE cdn_currency (
	ID BIGINT NOT NULL PRIMARY KEY,
	intCode INTEGER NOT NULL, --Digital code of currency
	code3 VARCHAR(3) NOT NULL, --3-character code of currency
	name VARCHAR(65) NOT NULL, --Name of currency
	curMult INTEGER DEFAULT (100) NOT NULL, --Default multiplicity
	description VARCHAR(128) NOT NULL, --Description
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CURR_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CURR_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CURR_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CURR_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_department (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) NULL, --Code of the department
	name VARCHAR(128) NOT NULL, --Name of the department
	fullName VARCHAR(255) NULL, --Full official name of the department
	description VARCHAR(255) NULL, --Description of the department
	nameGen VARCHAR(128) NULL, --Department name in genitive case
	nameDat VARCHAR(128) NULL, --Department name in dative case
	fullNameGen VARCHAR(255) NULL, --Department full official name in genitive case
	fullNameDat VARCHAR(255) NULL, --Department full official name in dative case
	depTypeID BIGINT NULL, --Type of the department
	organizationID BIGINT NULL, --Parent external organization
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_DEP_DEPTYPEID_REF_DEPT FOREIGN KEY (DEPTYPEID) REFERENCES cdn_deptype(ID)	
	, CONSTRAINT FK_DEP_ORGANIZATIONID_REF_ORG FOREIGN KEY (ORGANIZATIONID) REFERENCES cdn_organization(ID)	
	, CONSTRAINT FK_DEP_MI_DATA_ID_REF_DEP FOREIGN KEY (MI_DATA_ID) REFERENCES cdn_department(ID)	
	, CONSTRAINT FK_DEP_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_DEP_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_DEP_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_DEP_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_deptype (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(32) NOT NULL, --Code of the department type
	name VARCHAR(100) NOT NULL, --Name of the department type
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_DEPT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_DEPT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_DEPT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_DEPT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_employee (
	ID BIGINT NOT NULL PRIMARY KEY,
	lastName VARCHAR(128) NOT NULL, --Employee last name
	firstName VARCHAR(128) NOT NULL, --Employee first name
	middleName VARCHAR(128) NULL, --Employee middle name
	description VARCHAR(255) NULL, --Employee description
	sexType VARCHAR(32) DEFAULT ('?') NOT NULL, --Employee's gender
	uniqNum VARCHAR(255) NULL, --Employee number
	suffix VARCHAR(30) NULL, --Suffix
	shortFIO VARCHAR(100) NOT NULL, --Example: A.O. Ivanov
	fullFIO VARCHAR(100) NOT NULL, --Example: Anton Olegovich Ivanov
	apply VARCHAR(100) NULL, --Describes how to treat to this person
	lastNameGen VARCHAR(128) NULL, --Employee last name in genitive case
	lastNameDat VARCHAR(128) NULL, --Employee last name in dative case
	firstNameGen VARCHAR(128) NULL, --Employee first name in genitive case
	firstNameDat VARCHAR(128) NULL, --Employee first name in dative case
	middleNameGen VARCHAR(128) NULL, --Employee middle name in genitive case
	middleNameDat VARCHAR(128) NULL, --Employee middle name in dative case
	shortFIOGen VARCHAR(256) NULL, --Employee short name in genitive case
	shortFIODat VARCHAR(256) NULL, --Employee short name in dative case
	fullFIOGen VARCHAR(512) NULL, --Employee full name in genitive case
	fullFIODat VARCHAR(512) NULL, --Employee full name in dative case
	applyGen VARCHAR(100) NULL, --Describes how to treat to this person in genitive case
	applyDat VARCHAR(100) NULL, --Describes how to treat to this person in dative case
	departmentID BIGINT NULL, --Department of external organization, which employee belongs
	organizationID BIGINT NOT NULL, --External organization, which employee belongs
	addrText TEXT NULL, --Formulation of the recipient, that will appear in the formation of outgoing document
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_EMP_DEPARTMENTID_REF_DEP FOREIGN KEY (DEPARTMENTID) REFERENCES cdn_department(ID)	
	, CONSTRAINT FK_EMP_ORGANIZATIONID_REF_ORG FOREIGN KEY (ORGANIZATIONID) REFERENCES cdn_organization(ID)	
	, CONSTRAINT FK_EMP_MI_DATA_ID_REF_EMP FOREIGN KEY (MI_DATA_ID) REFERENCES cdn_employee(ID)	
	, CONSTRAINT FK_EMP_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_EMP_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_EMP_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_EMP_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_language (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(255) NOT NULL, --ISO 639-1 code
	languageName VARCHAR(255) NOT NULL, --Language name
	nativeName VARCHAR(255) NOT NULL, --Native name (Endonym)
	isRTL SMALLINT(1) DEFAULT (0) NOT NULL CHECK (isRTL IN (0,1) ), --Is right-to-left
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CDNLNG_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNLNG_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNLNG_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNLNG_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_nationality (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) NOT NULL, --Nationality code
	name VARCHAR(128) NOT NULL, --Name of nationality
	nameM VARCHAR(128) NULL, --Nationality name for male
	nameF VARCHAR(128) NULL, --Nationality name for male
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CDN_NATIONALITY_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDN_NATIONALITY_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDN_NATIONALITY_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDN_NATIONALITY_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_orgaccount (
	ID BIGINT NOT NULL PRIMARY KEY,
	organizationID BIGINT NOT NULL, --Organization
	currencyID BIGINT NULL, --Currency of the account
	bankID BIGINT NULL, --Bank of the account
	code VARCHAR(29) NOT NULL, --Code of the account
	acctype VARCHAR(32) DEFAULT ('CORR') NOT NULL, --Type of the account
	description VARCHAR(512) NOT NULL, --Description
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ORGACC_ORGANIZATIONID_REF_ORG FOREIGN KEY (ORGANIZATIONID) REFERENCES cdn_organization(ID)	
	, CONSTRAINT FK_ORGACC_CURRENCYID_REF_CURR FOREIGN KEY (CURRENCYID) REFERENCES cdn_currency(ID)	
	, CONSTRAINT FK_ORGACC_BANKID_REF_BANK FOREIGN KEY (BANKID) REFERENCES cdn_bank(ID)	
	, CONSTRAINT FK_ORGACC_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGACC_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGACC_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGACC_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_organization (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) NULL, --Organization internal code
	OKPOCode VARCHAR(16) NULL, --Common classifier of enterprises and organizations (CCEO)
	taxCode VARCHAR(32) NULL, --Tax number
	vatCode VARCHAR(32) NULL, --VAT (value-added tax) registration certificate number
	name VARCHAR(128) NOT NULL, --Name of organization without the quotes and abbreviations
	fullName VARCHAR(255) NOT NULL, --Full name of organization, as it's specified in the certificate of registration
	nameGen VARCHAR(128) NULL, --Organization name in genitive case
	nameDat VARCHAR(128) NULL, --Organization name in dative case
	fullNameGen VARCHAR(255) NULL, --Full name of organization, as it's specified in the certificate of registration, in genitive case
	fullNameDat VARCHAR(255) NULL, --Full name of organization, as it's specified in the certificate of registration, in dative case
	description VARCHAR(255) NULL, --Organization description
	orgBusinessTypeID BIGINT NULL, --Organization type
	orgOwnershipTypeID BIGINT NULL, --Ownership type
	corrIndexID BIGINT NULL, --Index of correspondent
	addrText TEXT NULL, --Formulation of the recipient, that will appear in the formation of PDF outgoing document
	caption VARCHAR(255) NULL, --Caption
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ORG_ORGBUSINESSTYPEID_REF_ORGBT FOREIGN KEY (ORGBUSINESSTYPEID) REFERENCES cdn_orgbusinesstype(ID)	
	, CONSTRAINT FK_ORG_ORGOWNERSHIPTYPEID_REF_ORGOT FOREIGN KEY (ORGOWNERSHIPTYPEID) REFERENCES cdn_orgownershiptype(ID)	
	, CONSTRAINT FK_ORG_CORRINDEXID_REF_CORIDX FOREIGN KEY (CORRINDEXID) REFERENCES cdn_corrindex(ID)	
	, CONSTRAINT FK_ORG_MI_DATA_ID_REF_ORG FOREIGN KEY (MI_DATA_ID) REFERENCES cdn_organization(ID)	
	, CONSTRAINT FK_ORG_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORG_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORG_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORG_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_orgbusinesstype (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(32) NOT NULL, --Code of the organization type
	shortName VARCHAR(32) NULL, --Acronim of the organization type
	name VARCHAR(100) NOT NULL, --Name of the organization type
	fullName VARCHAR(255) NULL, --Description of the organization type
	isGovAuthority SMALLINT(1) DEFAULT (0) NOT NULL CHECK (isGovAuthority IN (0,1) ), --Sign, that the organization of this type is a government authority
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ORGBT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGBT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGBT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGBT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_orgownershiptype (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(32) NOT NULL, --Code of the ownership type
	shortName VARCHAR(32) NULL, --Acronim of the ownership type
	name VARCHAR(100) NOT NULL, --Name of the ownership type
	fullName VARCHAR(255) NULL, --Full name of the ownership type
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ORGOT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGOT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGOT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGOT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_person (
	ID BIGINT NOT NULL PRIMARY KEY,
	lastName VARCHAR(128) NOT NULL, --Last name of the person
	firstName VARCHAR(128) NOT NULL, --First name of the person
	middleName VARCHAR(128) NULL, --Middle name of the person
	identCard VARCHAR(255) NULL, --Person's identity card
	workPlacePos VARCHAR(255) NULL, --Place of work, position
	birthDate DATETIME NULL, --Birthday of the person
	description VARCHAR(255) NULL, --Description of the person
	sexType VARCHAR(32) DEFAULT ('?') NOT NULL, --Person's gender
	suffix VARCHAR(30) NULL, --Suffix of the person
	shortFIO VARCHAR(256) NULL, --Example: Antonov I.P.
	fullFIO VARCHAR(512) NOT NULL, --Example: Antonov Ivan Petrovich
	apply VARCHAR(100) NULL, --Apply to the person
	photo VARCHAR(4000) NULL, --Person's photo
	lastNameGen VARCHAR(128) NULL, --Person's last name in genitive case
	lastNameDat VARCHAR(128) NULL, --Person's last name in dative case
	firstNameGen VARCHAR(128) NULL, --Person's first name in genitive case
	firstNameDat VARCHAR(128) NULL, --Person's first name in dative case
	middleNameGen VARCHAR(128) NULL, --Person's middle name in genitive case
	middleNameDat VARCHAR(128) NULL, --Person's middle name in dative case
	shortFIOGen VARCHAR(256) NULL, --Person's short name in genitive case
	shortFIODat VARCHAR(256) NULL, --Person's short name in dative case
	fullFIOGen VARCHAR(512) NULL, --Person's full name in genitive case
	fullFIODat VARCHAR(512) NULL, --Person's full name in dative case
	applyGen VARCHAR(100) NULL, --Apply to the person in genitive case
	applyDat VARCHAR(100) NULL, --Apply to the person in dative case
	regionID BIGINT NULL, --Person's region
	socialstatusID BIGINT NULL, --Social status position
	categoryID BIGINT NULL, --Category position
	nationality BIGINT NULL, --Nationality
	resident SMALLINT(1) DEFAULT (0) NOT NULL CHECK (resident IN (0,1) ), --Is person a resident of our country
	classID BIGINT NULL, --Person classification
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CPERS_REGIONID_REF_REGN FOREIGN KEY (REGIONID) REFERENCES cdn_region(ID)	
	, CONSTRAINT FK_CPERS_SOCIALSTATUSID_REF_PSOCST FOREIGN KEY (SOCIALSTATUSID) REFERENCES cdn_personsocialstatus(ID)	
	, CONSTRAINT FK_CPERS_CATEGORYID_REF_CATEGORY FOREIGN KEY (CATEGORYID) REFERENCES cdn_personcategory(ID)	
	, CONSTRAINT FK_CPERS_NATIONALITY_REF_CDN_NATIONALITY FOREIGN KEY (NATIONALITY) REFERENCES cdn_nationality(ID)	
	, CONSTRAINT FK_CPERS_CLASSID_REF_CDN_PERSONCLASS FOREIGN KEY (CLASSID) REFERENCES cdn_personclass(ID)	
	, CONSTRAINT FK_CPERS_MI_DATA_ID_REF_CPERS FOREIGN KEY (MI_DATA_ID) REFERENCES cdn_person(ID)	
	, CONSTRAINT FK_CPERS_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CPERS_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CPERS_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CPERS_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_personcategory (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(32) NOT NULL, --Code
	name VARCHAR(100) NOT NULL, --Name of category
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CATEGORY_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CATEGORY_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CATEGORY_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CATEGORY_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_personclass (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(32) NOT NULL, --Code
	name VARCHAR(100) NOT NULL, --Name of category
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CDN_PERSONCLASS_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDN_PERSONCLASS_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDN_PERSONCLASS_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDN_PERSONCLASS_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_personsocialstatus (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(32) NOT NULL, --Code
	name VARCHAR(100) NOT NULL, --Name of social status
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_PSOCST_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_PSOCST_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_PSOCST_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_PSOCST_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_postindex (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(6) NOT NULL, --Index
	streetID BIGINT NOT NULL, --Street
	description VARCHAR(255) NOT NULL, --Description
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_POSTIDX_STREETID_REF_STREET FOREIGN KEY (STREETID) REFERENCES cdn_street(ID)	
	, CONSTRAINT FK_POSTIDX_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_POSTIDX_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_POSTIDX_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_POSTIDX_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_profession (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) DEFAULT ('----') NOT NULL, --Code
	name VARCHAR(128) NOT NULL, --Name of profession
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_CDNPROF_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNPROF_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNPROF_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_CDNPROF_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_region (
	ID BIGINT NOT NULL PRIMARY KEY,
	parentAdminUnitID BIGINT NOT NULL, --Parent
	code VARCHAR(16) NOT NULL, --Internal code
	regionTypeID BIGINT NULL, --Type of region
	name VARCHAR(128) NOT NULL, --Name of region
	caption VARCHAR(255) NULL, --Caption
	fullName VARCHAR(255) NOT NULL, --Full name of region
	description VARCHAR(255) NULL, --Description of region
	phoneCode VARCHAR(64) NULL, --Phone code of region
	centerID BIGINT NULL, --Center of region
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_REGN_PARENTADMINUNITID_REF_ADMUNT FOREIGN KEY (PARENTADMINUNITID) REFERENCES cdn_adminunit(ID)	
	, CONSTRAINT FK_REGN_REGIONTYPEID_REF_REGNT FOREIGN KEY (REGIONTYPEID) REFERENCES cdn_regiontype(ID)	
	, CONSTRAINT FK_REGN_CENTERID_REF_CITY FOREIGN KEY (CENTERID) REFERENCES cdn_city(ID)	
	, CONSTRAINT FK_REGN_MI_DATA_ID_REF_REGN FOREIGN KEY (MI_DATA_ID) REFERENCES cdn_region(ID)	
	, CONSTRAINT FK_REGN_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_REGN_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_REGN_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_REGN_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_REGN_ID_REF_ADMUNT FOREIGN KEY (ID) REFERENCES cdn_adminunit(ID)	
);
--
CREATE TABLE cdn_regiontype (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) NOT NULL, --Code
	name VARCHAR(128) NOT NULL, --Name of region type
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_REGNT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_REGNT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_REGNT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_REGNT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_staffunittype (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) NOT NULL, --Code of the staffunit type
	name VARCHAR(128) NOT NULL, --Name of the staffunit type
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_STUNT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STUNT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STUNT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STUNT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE cdn_street (
	ID BIGINT NOT NULL PRIMARY KEY,
	name VARCHAR(128) NOT NULL, --Street name
	fullName VARCHAR(128) NOT NULL, --Street full name
	code VARCHAR(6) NULL, --Code
	streetType VARCHAR(32) NULL, --Type
	cityID BIGINT NULL, --City
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_STREET_CITYID_REF_CITY FOREIGN KEY (CITYID) REFERENCES cdn_city(ID)	
	, CONSTRAINT FK_STREET_MI_DATA_ID_REF_STREET FOREIGN KEY (MI_DATA_ID) REFERENCES cdn_street(ID)	
	, CONSTRAINT FK_STREET_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STREET_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STREET_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STREET_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE org_department (
	ID BIGINT NOT NULL PRIMARY KEY,
	parentID BIGINT NULL, --Parent
	code VARCHAR(16) DEFAULT ('----') NOT NULL, --Internal code
	name VARCHAR(256) NOT NULL, --Name of department without the quotes and abbreviations
	fullName VARCHAR(500) NOT NULL, --Department full name
	description VARCHAR(290) NULL, --Department description
	nameGen VARCHAR(256) NULL, --Department name without the quotes and abbreviations in genitive case
	nameDat VARCHAR(256) NULL, --Department name without the quotes and abbreviations in dative case
	fullNameGen VARCHAR(500) NULL, --Department full name in genitive case
	fullNameDat VARCHAR(500) NULL, --Department full name in dative case
	depTypeID BIGINT NULL, --Department type
	isClerical SMALLINT(1) DEFAULT (0) NOT NULL CHECK (isClerical IN (0,1) ), --Clerical unit mark
	caption VARCHAR(512) NOT NULL, --Caption
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ODEP_PARENTID_REF_OUNIT FOREIGN KEY (PARENTID) REFERENCES org_unit(ID)	
	, CONSTRAINT FK_ODEP_DEPTYPEID_REF_DEPT FOREIGN KEY (DEPTYPEID) REFERENCES cdn_deptype(ID)	
	, CONSTRAINT FK_ODEP_MI_DATA_ID_REF_ODEP FOREIGN KEY (MI_DATA_ID) REFERENCES org_department(ID)	
	, CONSTRAINT FK_ODEP_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ODEP_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ODEP_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ODEP_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ODEP_ID_REF_OUNIT FOREIGN KEY (ID) REFERENCES org_unit(ID)	
);
--
CREATE TABLE org_diagram (
	ID BIGINT NOT NULL PRIMARY KEY,
	orgunitID BIGINT NULL, --Root
	caption VARCHAR(256) NULL, --Name
	isdefault SMALLINT(1) DEFAULT (0) NOT NULL CHECK (isdefault IN (0,1) ), --Default
	document VARCHAR(4000) NULL, --Organization chart
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ODIAGRAM_ORGUNITID_REF_OUNIT FOREIGN KEY (ORGUNITID) REFERENCES org_unit(ID)	
	, CONSTRAINT FK_ODIAGRAM_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ODIAGRAM_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ODIAGRAM_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ODIAGRAM_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE org_employee (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(20) NOT NULL, --Employees internal code
	userID BIGINT NULL, --User login
	lastName VARCHAR(128) NOT NULL, --Employee last name
	firstName VARCHAR(128) NOT NULL, --Employee first name
	middleName VARCHAR(128) NULL, --Employee middle name
	birthDate DATETIME NULL, --Date of birth
	description VARCHAR(255) NULL, --Comment on employee
	sexType VARCHAR(32) NOT NULL, --Employee's gender
	suffix VARCHAR(30) NULL, --Suffix
	shortFIO VARCHAR(256) NULL, --Example: Smith J.K.
	fullFIO VARCHAR(512) NOT NULL, --Example: Smith Jay Key
	apply VARCHAR(100) NULL, --Describes how to treat to this person
	lastNameGen VARCHAR(128) NULL, --Employee last name in genitive case
	lastNameDat VARCHAR(128) NULL, --Employee last name in dative case
	lastNameObj VARCHAR(128) NULL, --Employee last name in objective case
	firstNameGen VARCHAR(128) NULL, --Employee first name in genitive case
	firstNameDat VARCHAR(128) NULL, --Employee first name in dative case
	firstNameObj VARCHAR(128) NULL, --Employee first name in objective case
	middleNameGen VARCHAR(128) NULL, --Employee middle name in genitive case
	middleNameDat VARCHAR(128) NULL, --Employee middle name in dative case
	middleNameObj VARCHAR(128) NULL, --Employee middle name in objective case
	shortFIOGen VARCHAR(256) NULL, --Employee short name in genitive case
	shortFIODat VARCHAR(256) NULL, --Employee short name in dative case
	shortFIOObj VARCHAR(256) NULL, --Employee short name in objective case
	fullFIOGen VARCHAR(512) NULL, --Employee full name in genitive case
	fullFIODat VARCHAR(512) NULL, --Employee full name in dative case
	fullFIOObj VARCHAR(512) NULL, --Employee full name in objective case
	applyGen VARCHAR(100) NULL, --Describes how to treat to this person in genitive case
	applyDat VARCHAR(100) NULL, --Describes how to treat to this person in dative case
	applyObj VARCHAR(100) NULL, --Describes how to treat to this person in objective case
	facsimile VARCHAR(4000) NULL, --Employee signature image
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_OEMP_USERID_REF_USR FOREIGN KEY (USERID) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OEMP_MI_DATA_ID_REF_OEMP FOREIGN KEY (MI_DATA_ID) REFERENCES org_employee(ID)	
	, CONSTRAINT FK_OEMP_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OEMP_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OEMP_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OEMP_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE org_employeeonstaff (
	ID BIGINT NOT NULL PRIMARY KEY,
	tabNo VARCHAR(20) DEFAULT ('----') NOT NULL, --Employee number
	employeeID BIGINT NOT NULL, --Employee
	staffUnitID BIGINT NOT NULL, --Internal organization staff unit
	employeeOnStaffType VARCHAR(32) DEFAULT ('PERMANENT') NOT NULL, --Assignment type
	description VARCHAR(255) NULL, --Assignment description
	caption VARCHAR(1024) NULL, --Caption
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_EMPONS_EMPLOYEEID_REF_OEMP FOREIGN KEY (EMPLOYEEID) REFERENCES org_employee(ID)	
	, CONSTRAINT FK_EMPONS_STAFFUNITID_REF_STUNIT FOREIGN KEY (STAFFUNITID) REFERENCES org_staffunit(ID)	
	, CONSTRAINT FK_EMPONS_MI_DATA_ID_REF_EMPONS FOREIGN KEY (MI_DATA_ID) REFERENCES org_employeeonstaff(ID)	
	, CONSTRAINT FK_EMPONS_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_EMPONS_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_EMPONS_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_EMPONS_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE org_employeeonstaff_pending (
	ID BIGINT NOT NULL PRIMARY KEY,
	emponstaffID BIGINT NOT NULL, --Assignment
	startDate DATETIME NOT NULL, --Assignment start date
	endDate DATETIME NULL, --Assignment end date
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_EMPONPEND_EMPONSTAFFID_REF_EMPONS FOREIGN KEY (EMPONSTAFFID) REFERENCES org_employeeonstaff(ID)	
	, CONSTRAINT FK_EMPONPEND_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_EMPONPEND_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_EMPONPEND_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE org_execgroup (
	ID BIGINT NOT NULL PRIMARY KEY,
	parentID BIGINT NOT NULL, --Parent unit of group
	groupType VARCHAR(32) DEFAULT ('*') NOT NULL, --Type of group
	code VARCHAR(16) NOT NULL, --Code of the group
	name VARCHAR(254) NOT NULL, --Name of the group
	nameGen VARCHAR(254) NULL, --Department name in genitive case
	nameDat VARCHAR(254) NULL, --Department name in dative case
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ORGEXGR_PARENTID_REF_OORG FOREIGN KEY (PARENTID) REFERENCES org_organization(ID)	
	, CONSTRAINT FK_ORGEXGR_MI_DATA_ID_REF_ORGEXGR FOREIGN KEY (MI_DATA_ID) REFERENCES org_execgroup(ID)	
	, CONSTRAINT FK_ORGEXGR_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGEXGR_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGEXGR_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGEXGR_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGEXGR_ID_REF_OUNIT FOREIGN KEY (ID) REFERENCES org_unit(ID)	
);
--
CREATE TABLE org_execgroupmember (
	ID BIGINT NOT NULL PRIMARY KEY,
	execGroupID BIGINT NOT NULL, --Executors group
	orgUnitID BIGINT NOT NULL, --Executor
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_ORGEXGRM_EXECGROUPID_REF_ORGEXGR FOREIGN KEY (EXECGROUPID) REFERENCES org_execgroup(ID)	
	, CONSTRAINT FK_ORGEXGRM_ORGUNITID_REF_STUNIT FOREIGN KEY (ORGUNITID) REFERENCES org_staffunit(ID)	
	, CONSTRAINT FK_ORGEXGRM_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGEXGRM_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ORGEXGRM_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE org_orgaccount (
	ID BIGINT NOT NULL PRIMARY KEY,
	organizationID BIGINT NOT NULL, --Organization
	currencyID BIGINT NOT NULL, --Currency of the account
	bankID BIGINT NOT NULL, --Bank of the account
	code VARCHAR(29) NOT NULL, --Code of the account (account number)
	acctype VARCHAR(32) NOT NULL, --Type of the account
	description VARCHAR(512) NULL, --Description
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_UORGACC_ORGANIZATIONID_REF_OORG FOREIGN KEY (ORGANIZATIONID) REFERENCES org_organization(ID)	
	, CONSTRAINT FK_UORGACC_CURRENCYID_REF_CURR FOREIGN KEY (CURRENCYID) REFERENCES cdn_currency(ID)	
	, CONSTRAINT FK_UORGACC_BANKID_REF_BANK FOREIGN KEY (BANKID) REFERENCES cdn_bank(ID)	
	, CONSTRAINT FK_UORGACC_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UORGACC_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UORGACC_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UORGACC_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE org_organization (
	ID BIGINT NOT NULL PRIMARY KEY,
	parentID BIGINT NULL, --Parent
	code VARCHAR(16) NOT NULL, --Organization internal code
	OKPOCode VARCHAR(16) NULL, --Common classifier of enterprises and organizations (CCEO)
	taxCode VARCHAR(32) NULL, --Tax number
	vatCode VARCHAR(32) NULL, --VAT (value-added tax) registration certificate number
	name VARCHAR(256) NOT NULL, --Name of organization without the quotes and abbreviations
	fullName VARCHAR(500) NOT NULL, --Full name of organization, as it's specified in the certificate of registration
	nameGen VARCHAR(256) NULL, --Organization name in genitive case
	nameDat VARCHAR(256) NULL, --Organization name in dative case
	fullNameGen VARCHAR(500) NULL, --Full name of organization, as it's specified in the certificate of registration, in genitive case
	fullNameDat VARCHAR(500) NULL, --Full name of organization, as it's specified in the certificate of registration, in dative case
	description VARCHAR(290) NULL, --Organization description
	orgBusinessTypeID BIGINT NULL, --Organization type
	orgOwnershipTypeID BIGINT NULL, --Ownership type
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_OORG_PARENTID_REF_OUNIT FOREIGN KEY (PARENTID) REFERENCES org_unit(ID)	
	, CONSTRAINT FK_OORG_ORGBUSINESSTYPEID_REF_ORGBT FOREIGN KEY (ORGBUSINESSTYPEID) REFERENCES cdn_orgbusinesstype(ID)	
	, CONSTRAINT FK_OORG_ORGOWNERSHIPTYPEID_REF_ORGOT FOREIGN KEY (ORGOWNERSHIPTYPEID) REFERENCES cdn_orgownershiptype(ID)	
	, CONSTRAINT FK_OORG_MI_DATA_ID_REF_OORG FOREIGN KEY (MI_DATA_ID) REFERENCES org_organization(ID)	
	, CONSTRAINT FK_OORG_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OORG_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OORG_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OORG_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OORG_ID_REF_OUNIT FOREIGN KEY (ID) REFERENCES org_unit(ID)	
);
--
CREATE TABLE org_profession (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(16) DEFAULT ('----') NOT NULL, --Code of position
	name VARCHAR(128) NOT NULL, --Position name
	fullName VARCHAR(300) NOT NULL, --Position full name
	nameGen VARCHAR(128) NULL, --Position name in genitive case
	nameDat VARCHAR(128) NULL, --Position name in dative case
	fullNameGen VARCHAR(300) NULL, --Position full name in genitive case
	fullNameDat VARCHAR(300) NULL, --Position full name in dative case
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_PROF_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_PROF_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_PROF_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_PROF_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE org_staffunit (
	ID BIGINT NOT NULL PRIMARY KEY,
	parentID BIGINT NOT NULL, --Parent
	code VARCHAR(16) DEFAULT ('----') NOT NULL, --Staff unit internal code
	name VARCHAR(128) NOT NULL, --Name of staff unit without the quotes and abbreviations
	fullName VARCHAR(300) NOT NULL, --Staff unit full name
	description VARCHAR(255) NULL, --Staff unit description
	nameGen VARCHAR(128) NULL, --Name of staff unit without the quotes and abbreviations in genitive case
	nameDat VARCHAR(128) NULL, --Name of staff unit without the quotes and abbreviations in dative case
	fullNameGen VARCHAR(300) NULL, --Staff unit full name in genitive case
	fullNameDat VARCHAR(300) NULL, --Full name in dative case
	caption VARCHAR(1024) NOT NULL, --Caption
	professionExtID BIGINT NULL, --Profession
	professionID BIGINT NOT NULL, --Position
	staffUnitTypeID BIGINT NOT NULL, --Staff unit type
	subordinationLevel INTEGER NULL, --If level is lower - then staff unit is more important
	isBoss SMALLINT(1) DEFAULT (0) NOT NULL CHECK (isBoss IN (0,1) ), --Boss
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_STUNIT_PARENTID_REF_OUNIT FOREIGN KEY (PARENTID) REFERENCES org_unit(ID)	
	, CONSTRAINT FK_STUNIT_PROFESSIONEXTID_REF_CDNPROF FOREIGN KEY (PROFESSIONEXTID) REFERENCES cdn_profession(ID)	
	, CONSTRAINT FK_STUNIT_PROFESSIONID_REF_PROF FOREIGN KEY (PROFESSIONID) REFERENCES org_profession(ID)	
	, CONSTRAINT FK_STUNIT_STAFFUNITTYPEID_REF_STUNT FOREIGN KEY (STAFFUNITTYPEID) REFERENCES cdn_staffunittype(ID)	
	, CONSTRAINT FK_STUNIT_MI_DATA_ID_REF_STUNIT FOREIGN KEY (MI_DATA_ID) REFERENCES org_staffunit(ID)	
	, CONSTRAINT FK_STUNIT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STUNIT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STUNIT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STUNIT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_STUNIT_ID_REF_OUNIT FOREIGN KEY (ID) REFERENCES org_unit(ID)	
);
--
CREATE TABLE org_unit (
	ID BIGINT NOT NULL PRIMARY KEY,
	parentID BIGINT NULL, --Parent
	code VARCHAR(16) NOT NULL, --Organization unit internal code
	caption VARCHAR(1024) NOT NULL, --Caption
	unitType VARCHAR(32) NOT NULL, --Organization unit type
	mi_treePath VARCHAR(450) NOT NULL,
	mi_data_id BIGINT NOT NULL,
	mi_dateFrom DATETIME NOT NULL,
	mi_dateTo DATETIME NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL, --User who delete row
	mi_unityEntity VARCHAR(64) NOT NULL
	, CONSTRAINT FK_OUNIT_PARENTID_REF_OUNIT FOREIGN KEY (PARENTID) REFERENCES org_unit(ID)	
	, CONSTRAINT FK_OUNIT_MI_DATA_ID_REF_OUNIT FOREIGN KEY (MI_DATA_ID) REFERENCES org_unit(ID)	
	, CONSTRAINT FK_OUNIT_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OUNIT_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OUNIT_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OUNIT_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE req_depart (
	ID BIGINT NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL, --Department Name
	postAddr VARCHAR(255) NOT NULL, --Department Address
	phoneNum VARCHAR(255) NOT NULL --Department Phone
);
--
CREATE TABLE req_reqList (
	ID BIGINT NOT NULL PRIMARY KEY,
	reqDate DATETIME NOT NULL, --Request Date
	applicantPhone VARCHAR(255) NOT NULL, --Applicant`s phone
	applicantInfo VARCHAR(255) NOT NULL, --Applicant`s contact info
	department BIGINT NOT NULL, --Department
	subDepartment BIGINT NULL, --SubDepartment
	reqText TEXT NOT NULL, --Text of request
	reqDoc VARCHAR(4000) NULL, --doc
	answer TEXT NULL --Request answer
	, CONSTRAINT FK_REQ_DEPARTMENT_REF_REQ_DEPART FOREIGN KEY (DEPARTMENT) REFERENCES req_depart(ID)	
	, CONSTRAINT FK_REQ_SUBDEPARTMENT_REF_REQ_SUBDEPART FOREIGN KEY (SUBDEPARTMENT) REFERENCES req_subDepart(ID)	
);
--
CREATE TABLE req_subDepart (
	ID BIGINT NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL, --Department Name
	department BIGINT NOT NULL --department
	, CONSTRAINT FK_REQ_SUBDEPART_DEPARTMENT_REF_REQ_DEPART FOREIGN KEY (DEPARTMENT) REFERENCES req_depart(ID)	
);
--
CREATE TABLE ub_blobHistory (
	ID BIGINT NOT NULL PRIMARY KEY,
	instance BIGINT NOT NULL, --InstanceID
	attribute VARCHAR(20) NULL, --Attribute
	revision INTEGER DEFAULT (1) NOT NULL, --Revision
	permanent SMALLINT(1) DEFAULT (0) NOT NULL CHECK (permanent IN (0,1) ), --isPermanent
	blobInfo VARCHAR(2000) NOT NULL --blobInfo
);
--
CREATE TABLE ub_migration (
	ID BIGINT NOT NULL PRIMARY KEY,
	modelName VARCHAR(32) NOT NULL, --Model code
	filePath VARCHAR(256) NOT NULL, --file path (relative to model _migrate folder)
	fileSha VARCHAR(64) NOT NULL, --SHA256 of file
	appliedAt DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL --Applied at
);
--
CREATE TABLE ub_version (
	ID BIGINT NOT NULL PRIMARY KEY,
	modelName VARCHAR(32) NOT NULL, --Model code
	version VARCHAR(12) NOT NULL, --model version as a string in format XXXYYYZZZ where: XXX-major, YYY-minor ZZZ-patch. All parts are padded by 0 to be a three letter; Example: 2.15.1 = 002015001
	appliedAt DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL --Applied at
);
--
CREATE TABLE uba_advSecurity (
	ID BIGINT NOT NULL PRIMARY KEY,
	userID BIGINT NOT NULL, --User
	editCause VARCHAR(2000) NOT NULL, --Cause of change
	allowedIP VARCHAR(256) NULL, --Allowed IP address
	refreshIP SMALLINT(1) DEFAULT (0) NOT NULL CHECK (refreshIP IN (0,1) ), --Refresh allowed IP
	fp VARCHAR(256) NULL, --Fingerprint
	refreshFp SMALLINT(1) DEFAULT (0) NOT NULL CHECK (refreshFp IN (0,1) ), --Refresh fingerprint
	keyMediaName VARCHAR(32) NULL, --Key media name
	refreshKeyMedia SMALLINT(1) DEFAULT (0) NOT NULL CHECK (refreshKeyMedia IN (0,1) ), --Refresh key media name
	additional VARCHAR(2000) NULL, --JSON with advanced settings
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_UBA_ADVSECURITY_USERID_REF_USR FOREIGN KEY (USERID) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UBA_ADVSECURITY_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UBA_ADVSECURITY_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UBA_ADVSECURITY_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE uba_auditTrail (
	ID BIGINT NOT NULL PRIMARY KEY,
	entity VARCHAR(32) NOT NULL, --Entity
	entityinfo_id BIGINT NOT NULL, --Instance ID
	actionType VARCHAR(32) NOT NULL, --Action
	actionUser BIGINT NOT NULL, --User
	actionUserName VARCHAR(128) NULL, --Login
	actionTime DATETIME NOT NULL, --Action time
	remoteIP VARCHAR(40) NULL, --Remote IP
	parentEntity VARCHAR(32) NULL, --Parent entity name
	parentEntityInfo_id BIGINT NULL, --Parent instance ID
	request_id BIGINT NULL, --Request ID
	fromValue TEXT NULL, --Old values
	toValue TEXT NULL --New values
);
--
CREATE TABLE uba_group (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(50) NOT NULL, --Group code
	name VARCHAR(128) NOT NULL, --Name
	description VARCHAR(256) NULL, --Description
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_GR_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_GR_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_GR_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_GR_ID_REF_SUBJ FOREIGN KEY (ID) REFERENCES uba_subject(ID)	
);
--
CREATE TABLE uba_grouprole (
	ID BIGINT NOT NULL PRIMARY KEY,
	groupID BIGINT NOT NULL, --Group
	roleID BIGINT NOT NULL, --Role
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_UBA_GROUPROLE_GROUPID_REF_GR FOREIGN KEY (GROUPID) REFERENCES uba_group(ID)	
	, CONSTRAINT FK_UBA_GROUPROLE_ROLEID_REF_ROLE FOREIGN KEY (ROLEID) REFERENCES uba_role(ID)	
	, CONSTRAINT FK_UBA_GROUPROLE_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UBA_GROUPROLE_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UBA_GROUPROLE_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE uba_otp (
	ID BIGINT NOT NULL PRIMARY KEY,
	otp VARCHAR(40) NOT NULL, --Generated one time password
	userID BIGINT NOT NULL, --User for which password was generated
	uData VARCHAR(2000) NULL, --Additional  data
	expiredDate DATETIME NOT NULL, --Expired date
	otpKind VARCHAR(32) NOT NULL, --Kind of otp(Email, SMS etc)
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_OTP_USERID_REF_USR FOREIGN KEY (USERID) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OTP_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OTP_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_OTP_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE uba_prevPasswordsHash (
	ID BIGINT NOT NULL PRIMARY KEY,
	userID BIGINT NOT NULL, --User
	uPasswordHashHexa VARCHAR(64) NULL, --Password hash
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_PREVP_USERID_REF_USR FOREIGN KEY (USERID) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_PREVP_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_PREVP_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_PREVP_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE uba_usercertificate (
	ID BIGINT NOT NULL PRIMARY KEY,
	userID BIGINT NOT NULL, --User
	issuer_serial VARCHAR(512) NOT NULL, --Issuer tag of certificate
	issuer_cn VARCHAR(512) NULL, --Issuer caption
	serial VARCHAR(100) NOT NULL, --Certificate serial number
	certificate BLOB NOT NULL, --Certificate binary data
	description VARCHAR(512) NULL, --Description
	disabled SMALLINT(1) DEFAULT (0) NOT NULL CHECK (disabled IN (0,1) ), --disabled
	revoked SMALLINT(1) DEFAULT (0) NOT NULL CHECK (revoked IN (0,1) ), --Revoked
	revocationDate DATETIME NULL, --Revocation date
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_USRCER_USERID_REF_USR FOREIGN KEY (USERID) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_USRCER_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_USRCER_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_USRCER_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE uba_usergroup (
	ID BIGINT NOT NULL PRIMARY KEY,
	userID BIGINT NOT NULL, --User
	groupID BIGINT NOT NULL, --Group
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_USRGROUP_USERID_REF_USR FOREIGN KEY (USERID) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_USRGROUP_GROUPID_REF_GR FOREIGN KEY (GROUPID) REFERENCES uba_group(ID)	
	, CONSTRAINT FK_USRGROUP_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_USRGROUP_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_USRGROUP_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE ubm_desktop (
	ID BIGINT NOT NULL PRIMARY KEY,
	caption VARCHAR(255) NOT NULL, --Desktop name
	code VARCHAR(50) NOT NULL, --Code
	description VARCHAR(255) NULL, --Desktop description
	iconCls VARCHAR(255) DEFAULT ('u-icon-desktop') NOT NULL, --Desktop icon
	url VARCHAR(255) NULL, --Static server page URL which is displayed in screen centre of selected desktop
	isDefault SMALLINT(1) DEFAULT (0) NOT NULL CHECK (isDefault IN (0,1) ), --By default?
	displayOrder INTEGER DEFAULT (1000) NOT NULL, --Display order
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_DESK_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_DESK_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_DESK_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_DESK_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE ubm_desktop_adm (
	ID BIGINT NOT NULL PRIMARY KEY,
	instanceID BIGINT NOT NULL, --Desktop
	admSubjID BIGINT NOT NULL --Admin subject
	, CONSTRAINT FK_ADMDESK_INSTANCEID_REF_DESK FOREIGN KEY (INSTANCEID) REFERENCES ubm_desktop(ID)	
	, CONSTRAINT FK_ADMDESK_ADMSUBJID_REF_SUBJ FOREIGN KEY (ADMSUBJID) REFERENCES uba_subject(ID)	
);
--
CREATE TABLE ubm_enum (
	ID BIGINT NOT NULL PRIMARY KEY,
	eGroup VARCHAR(32) NOT NULL, --Group
	code VARCHAR(32) NOT NULL, --Value code
	shortName VARCHAR(128) NULL, --Short name
	name VARCHAR(255) NOT NULL, --Value name
	sortOrder INTEGER DEFAULT (100) NOT NULL, --Order #
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_ENU_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ENU_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ENU_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_ENU_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE ubm_navshortcut (
	ID BIGINT NOT NULL PRIMARY KEY,
	desktopID BIGINT NOT NULL, --Desktop
	parentID BIGINT NULL, --Shortcut folder
	code VARCHAR(50) NOT NULL, --Code
	isFolder SMALLINT(1) DEFAULT (0) NOT NULL CHECK (isFolder IN (0,1) ), --Is folder?
	caption VARCHAR(255) NOT NULL, --Shortcut caption
	cmdCode TEXT NULL, --Command code
	inWindow SMALLINT(1) DEFAULT (0) NOT NULL CHECK (inWindow IN (0,1) ), --Display in new window
	isCollapsed SMALLINT(1) DEFAULT (0) NOT NULL CHECK (isCollapsed IN (0,1) ), --Show collapsed at the first start
	displayOrder INTEGER DEFAULT (1000) NOT NULL, --Display order (in current node)
	iconCls VARCHAR(50) NULL, --Icon (CSS class)
	description VARCHAR(256) NULL, --Shortcut description
	keywords VARCHAR(512) NULL, --Search keywords
	mi_treePath VARCHAR(450) NOT NULL,
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_NAVSH_DESKTOPID_REF_DESK FOREIGN KEY (DESKTOPID) REFERENCES ubm_desktop(ID)	
	, CONSTRAINT FK_NAVSH_PARENTID_REF_NAVSH FOREIGN KEY (PARENTID) REFERENCES ubm_navshortcut(ID)	
	, CONSTRAINT FK_NAVSH_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_NAVSH_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_NAVSH_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_NAVSH_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE ubm_navshortcut_adm (
	ID BIGINT NOT NULL PRIMARY KEY,
	instanceID BIGINT NOT NULL, --Shortcut
	admSubjID BIGINT NOT NULL --Subject of administration
	, CONSTRAINT FK_ADMNAV_INSTANCEID_REF_NAVSH FOREIGN KEY (INSTANCEID) REFERENCES ubm_navshortcut(ID)	
	, CONSTRAINT FK_ADMNAV_ADMSUBJID_REF_SUBJ FOREIGN KEY (ADMSUBJID) REFERENCES uba_subject(ID)	
);
--
CREATE TABLE ubm_query (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(50) NOT NULL, --Code
	name VARCHAR(256) NOT NULL, --Name
	ubql JSON(4000) NOT NULL, --UBQL (JSON)
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_UBMQR_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UBMQR_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UBMQR_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_UBMQR_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE ubq_messages (
	ID BIGINT NOT NULL PRIMARY KEY,
	queueCode VARCHAR(16) NOT NULL, --Receivers determinate handler by this code. For each queCode must be receiver which handle it
	msgCmd VARCHAR(2000) NULL, --Command for receiver. Contain JSON serialized object with command parameters. Command must contain attributes receiver understand
	msgData TEXT NULL, --Additional data for message. May contain Base64 encoded binary data
	msgPriority INTEGER DEFAULT (0) NOT NULL, --Priority of messages. 1=High, 0=Low, default 1
	completeDate DATETIME NULL, --Complete date
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_MQM_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_MQM_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_MQM_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE ubq_runstat (
	ID BIGINT NOT NULL PRIMARY KEY,
	appName VARCHAR(64) NOT NULL, --Application name
	schedulerName VARCHAR(64) NOT NULL, --Scheduler name
	startTime DATETIME NOT NULL, --Time of start scheduler item
	endTime DATETIME NULL, --Time of end scheduler item
	logText TEXT NULL, --Log from runned script about all actions
	resultError INTEGER NULL, --Result error code. 0=No error
	resultErrorMsg VARCHAR(2000) NULL --Error text message if resultError > 1
);
--
CREATE TABLE ubs_filter (
	ID BIGINT NOT NULL PRIMARY KEY,
	code VARCHAR(100) NOT NULL, --Code of filter group
	name VARCHAR(250) NOT NULL, --Filter name
	filter TEXT NOT NULL, --filter
	isGlobal SMALLINT(1) NOT NULL CHECK (isGlobal IN (0,1) ), --Is this filter accessible for all users
	owner BIGINT NOT NULL, --Filter owner
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL --User who modify row
	, CONSTRAINT FK_SFILTER_OWNER_REF_USR FOREIGN KEY (OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_SFILTER_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_SFILTER_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_SFILTER_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE ubs_message (
	ID BIGINT NOT NULL PRIMARY KEY,
	messageBody TEXT NULL, --Message
	complete SMALLINT(1) DEFAULT (0) NOT NULL CHECK (complete IN (0,1) ), --Submitted
	messageType VARCHAR(32) NOT NULL, --Type
	startDate DATETIME NOT NULL, --Valid from
	expireDate DATETIME NOT NULL, --Valid to
	mi_owner BIGINT NOT NULL, --Row owner
	mi_createDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Creation date
	mi_createUser BIGINT NOT NULL, --User who create row
	mi_modifyDate DATETIME DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ', 'now')) NOT NULL, --Modification date
	mi_modifyUser BIGINT NOT NULL, --User who modify row
	mi_deleteDate DATETIME DEFAULT ('9999-12-31') NOT NULL, --Deletion date
	mi_deleteUser BIGINT NULL --User who delete row
	, CONSTRAINT FK_MSG_MI_OWNER_REF_USR FOREIGN KEY (MI_OWNER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_MSG_MI_CREATEUSER_REF_USR FOREIGN KEY (MI_CREATEUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_MSG_MI_MODIFYUSER_REF_USR FOREIGN KEY (MI_MODIFYUSER) REFERENCES uba_user(ID)	
	, CONSTRAINT FK_MSG_MI_DELETEUSER_REF_USR FOREIGN KEY (MI_DELETEUSER) REFERENCES uba_user(ID)	
);
--
CREATE TABLE ubs_message_recipient (
	ID BIGINT NOT NULL PRIMARY KEY,
	messageID BIGINT NOT NULL, --Message
	userID BIGINT NOT NULL, --User
	acceptDate DATETIME NULL --Accept date
	, CONSTRAINT FK_MSG_RC_MESSAGEID_REF_MSG FOREIGN KEY (MESSAGEID) REFERENCES ubs_message(ID)	
	, CONSTRAINT FK_MSG_RC_USERID_REF_USR FOREIGN KEY (USERID) REFERENCES uba_user(ID)	
);
--
CREATE TABLE ubs_numcounter (
	ID BIGINT NOT NULL PRIMARY KEY,
	regKey VARCHAR(255) NOT NULL, --Registration key
	counter BIGINT NOT NULL, --Counter
	fakeLock INTEGER NULL --Used internally
);
--
CREATE TABLE ubs_numcounterreserv (
	ID BIGINT NOT NULL PRIMARY KEY,
	regKey VARCHAR(255) NOT NULL, --Registration key
	counter BIGINT NOT NULL, --Counter
	reservedDate VARCHAR(255) NULL, --Reserved date for document
	note VARCHAR(255) NULL --Description of reserved number (Department name, etc)
);
--
CREATE TABLE ubs_softLock (
	ID BIGINT NOT NULL PRIMARY KEY,
	entity VARCHAR(32) NOT NULL, --Entity
	lockID BIGINT NOT NULL, --Instance ID
	lockUser BIGINT NOT NULL, --User, who locking record
	lockType VARCHAR(32) NOT NULL, --Lock type
	lockTime DATETIME NOT NULL --Lock time
	, CONSTRAINT FK_SLOCK_LOCKUSER_REF_USR FOREIGN KEY (LOCKUSER) REFERENCES uba_user(ID)	
);
--
 
-- Add columns
--######################################
ALTER TABLE uba_audit ADD targetGroup VARCHAR(128) NULL;
--
ALTER TABLE uba_user ADD firstName VARCHAR(64) NULL;
--
ALTER TABLE uba_user ADD lastName VARCHAR(64) NULL;
--
ALTER TABLE uba_user ADD fullName VARCHAR(128) NULL;
--
ALTER TABLE uba_user ADD gender VARCHAR(32) NULL;
--
ALTER TABLE uba_user ADD email VARCHAR(64) NULL;
--
ALTER TABLE uba_user ADD phone VARCHAR(32) NULL;
--
ALTER TABLE uba_user ADD avatar VARCHAR(4000) NULL;
--
 
-- Create indexes
--######################################
CREATE INDEX IDX_ADDR_MI_OWNER ON cdn_address(MI_OWNER) ;
--
CREATE INDEX IDX_ADDR_MI_CREATEUSER ON cdn_address(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ADDR_MI_MODIFYUSER ON cdn_address(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ADDR_MI_DELETEUSER ON cdn_address(MI_DELETEUSER) ;
--
CREATE INDEX idx_address_subjectID ON cdn_address(SUBJECTID) ;
--
CREATE INDEX IDX_ADMUNT_PARENTADMINUNITID ON cdn_adminunit(PARENTADMINUNITID) ;
--
CREATE UNIQUE INDEX UIDX_ADMUNT_CODE ON cdn_adminunit(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_ADMUNT_MI_OWNER ON cdn_adminunit(MI_OWNER) ;
--
CREATE INDEX IDX_ADMUNT_MI_CREATEUSER ON cdn_adminunit(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ADMUNT_MI_MODIFYUSER ON cdn_adminunit(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ADMUNT_MI_DELETEUSER ON cdn_adminunit(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_BANK_MFO ON cdn_bank(MFO,MI_DELETEDATE) ;
--
CREATE INDEX IDX_BANK_COUNTRYID ON cdn_bank(COUNTRYID) ;
--
CREATE INDEX IDX_BANK_CITYID ON cdn_bank(CITYID) ;
--
CREATE INDEX IDX_BANK_MI_OWNER ON cdn_bank(MI_OWNER) ;
--
CREATE INDEX IDX_BANK_MI_CREATEUSER ON cdn_bank(MI_CREATEUSER) ;
--
CREATE INDEX IDX_BANK_MI_MODIFYUSER ON cdn_bank(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_BANK_MI_DELETEUSER ON cdn_bank(MI_DELETEUSER) ;
--
CREATE INDEX IDX_BUILDING_STREETID ON cdn_building(STREETID) ;
--
CREATE INDEX IDX_BUILDING_POSTINDEXID ON cdn_building(POSTINDEXID) ;
--
CREATE INDEX IDX_BUILDING_MI_DATA_ID ON cdn_building(MI_DATA_ID) ;
--
CREATE INDEX IDX_BUILDING_MI_OWNER ON cdn_building(MI_OWNER) ;
--
CREATE INDEX IDX_BUILDING_MI_CREATEUSER ON cdn_building(MI_CREATEUSER) ;
--
CREATE INDEX IDX_BUILDING_MI_MODIFYUSER ON cdn_building(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_BUILDING_MI_DELETEUSER ON cdn_building(MI_DELETEUSER) ;
--
CREATE INDEX IDX_BUILDING_DTODD ON cdn_building(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_BUILDING_HIST ON cdn_building(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CITY_PARENTADMINUNITID ON cdn_city(PARENTADMINUNITID) ;
--
CREATE UNIQUE INDEX UIDX_CITY_CODE ON cdn_city(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CITY_CITYTYPEID ON cdn_city(CITYTYPEID) ;
--
CREATE INDEX IDX_CITY_MI_OWNER ON cdn_city(MI_OWNER) ;
--
CREATE INDEX IDX_CITY_MI_CREATEUSER ON cdn_city(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CITY_MI_MODIFYUSER ON cdn_city(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CITY_MI_DELETEUSER ON cdn_city(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_CITYT_CODE ON cdn_citytype(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CITYT_MI_OWNER ON cdn_citytype(MI_OWNER) ;
--
CREATE INDEX IDX_CITYT_MI_CREATEUSER ON cdn_citytype(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CITYT_MI_MODIFYUSER ON cdn_citytype(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CITYT_MI_DELETEUSER ON cdn_citytype(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_CDNCLS_CODE ON cdn_classifier(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CDNCLS_MI_OWNER ON cdn_classifier(MI_OWNER) ;
--
CREATE INDEX IDX_CDNCLS_MI_CREATEUSER ON cdn_classifier(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CDNCLS_MI_MODIFYUSER ON cdn_classifier(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CDNCLS_MI_DELETEUSER ON cdn_classifier(MI_DELETEUSER) ;
--
CREATE INDEX IDX_CDNCLSI_CLASSIFIERID ON cdn_classifieritem(CLASSIFIERID) ;
--
CREATE INDEX IDX_CDNCLSI_PARENTID ON cdn_classifieritem(PARENTID) ;
--
CREATE INDEX IDX_CDNCLSI_MI_OWNER ON cdn_classifieritem(MI_OWNER) ;
--
CREATE INDEX IDX_CDNCLSI_MI_CREATEUSER ON cdn_classifieritem(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CDNCLSI_MI_MODIFYUSER ON cdn_classifieritem(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CDNCLSI_MI_DELETEUSER ON cdn_classifieritem(MI_DELETEUSER) ;
--
CREATE INDEX IDX_CDNCLSI_TREEPATH ON cdn_classifieritem(MI_TREEPATH) ;
--
CREATE UNIQUE INDEX idx_cdnclsi_uniq ON cdn_classifieritem(CLASSIFIERID,CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CONT_CONTACTTYPEID ON cdn_contact(CONTACTTYPEID) ;
--
CREATE INDEX IDX_CONT_MI_OWNER ON cdn_contact(MI_OWNER) ;
--
CREATE INDEX IDX_CONT_MI_CREATEUSER ON cdn_contact(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CONT_MI_MODIFYUSER ON cdn_contact(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CONT_MI_DELETEUSER ON cdn_contact(MI_DELETEUSER) ;
--
CREATE INDEX idx_contact_subjectID ON cdn_contact(SUBJECTID) ;
--
CREATE UNIQUE INDEX UIDX_CONTTY_CODE ON cdn_contacttype(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CONTTY_MI_OWNER ON cdn_contacttype(MI_OWNER) ;
--
CREATE INDEX IDX_CONTTY_MI_CREATEUSER ON cdn_contacttype(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CONTTY_MI_MODIFYUSER ON cdn_contacttype(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CONTTY_MI_DELETEUSER ON cdn_contacttype(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_CORIDX_CODE ON cdn_corrindex(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CORIDX_MI_OWNER ON cdn_corrindex(MI_OWNER) ;
--
CREATE INDEX IDX_CORIDX_MI_CREATEUSER ON cdn_corrindex(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CORIDX_MI_MODIFYUSER ON cdn_corrindex(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CORIDX_MI_DELETEUSER ON cdn_corrindex(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_CNTR_CODE ON cdn_country(CODE,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_CNTR_INTCODE ON cdn_country(INTCODE,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_CNTR_SYMBOL2 ON cdn_country(SYMBOL2,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_CNTR_SYMBOL3 ON cdn_country(SYMBOL3,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CNTR_CURRENCYID ON cdn_country(CURRENCYID) ;
--
CREATE INDEX IDX_CNTR_CAPITALID ON cdn_country(CAPITALID) ;
--
CREATE INDEX IDX_CNTR_MI_OWNER ON cdn_country(MI_OWNER) ;
--
CREATE INDEX IDX_CNTR_MI_CREATEUSER ON cdn_country(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CNTR_MI_MODIFYUSER ON cdn_country(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CNTR_MI_DELETEUSER ON cdn_country(MI_DELETEUSER) ;
--
CREATE INDEX IDX_CURR_MI_OWNER ON cdn_currency(MI_OWNER) ;
--
CREATE INDEX IDX_CURR_MI_CREATEUSER ON cdn_currency(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CURR_MI_MODIFYUSER ON cdn_currency(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CURR_MI_DELETEUSER ON cdn_currency(MI_DELETEUSER) ;
--
CREATE INDEX IDX_DEP_DEPTYPEID ON cdn_department(DEPTYPEID) ;
--
CREATE INDEX IDX_DEP_ORGANIZATIONID ON cdn_department(ORGANIZATIONID) ;
--
CREATE INDEX IDX_DEP_MI_DATA_ID ON cdn_department(MI_DATA_ID) ;
--
CREATE INDEX IDX_DEP_MI_OWNER ON cdn_department(MI_OWNER) ;
--
CREATE INDEX IDX_DEP_MI_CREATEUSER ON cdn_department(MI_CREATEUSER) ;
--
CREATE INDEX IDX_DEP_MI_MODIFYUSER ON cdn_department(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_DEP_MI_DELETEUSER ON cdn_department(MI_DELETEUSER) ;
--
CREATE INDEX IDX_DEP_DTODD ON cdn_department(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_DEP_HIST ON cdn_department(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_DEPT_CODE ON cdn_deptype(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_DEPT_MI_OWNER ON cdn_deptype(MI_OWNER) ;
--
CREATE INDEX IDX_DEPT_MI_CREATEUSER ON cdn_deptype(MI_CREATEUSER) ;
--
CREATE INDEX IDX_DEPT_MI_MODIFYUSER ON cdn_deptype(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_DEPT_MI_DELETEUSER ON cdn_deptype(MI_DELETEUSER) ;
--
CREATE INDEX IDX_EMP_DEPARTMENTID ON cdn_employee(DEPARTMENTID) ;
--
CREATE INDEX IDX_EMP_ORGANIZATIONID ON cdn_employee(ORGANIZATIONID) ;
--
CREATE INDEX IDX_EMP_MI_DATA_ID ON cdn_employee(MI_DATA_ID) ;
--
CREATE INDEX IDX_EMP_MI_OWNER ON cdn_employee(MI_OWNER) ;
--
CREATE INDEX IDX_EMP_MI_CREATEUSER ON cdn_employee(MI_CREATEUSER) ;
--
CREATE INDEX IDX_EMP_MI_MODIFYUSER ON cdn_employee(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_EMP_MI_DELETEUSER ON cdn_employee(MI_DELETEUSER) ;
--
CREATE INDEX IDX_EMP_DTODD ON cdn_employee(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_EMP_HIST ON cdn_employee(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CDNLNG_MI_OWNER ON cdn_language(MI_OWNER) ;
--
CREATE INDEX IDX_CDNLNG_MI_CREATEUSER ON cdn_language(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CDNLNG_MI_MODIFYUSER ON cdn_language(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CDNLNG_MI_DELETEUSER ON cdn_language(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_CDN_NATIONALITY_CODE ON cdn_nationality(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CDN_NATIONALITY_MI_OWNER ON cdn_nationality(MI_OWNER) ;
--
CREATE INDEX IDX_CDN_NATIONALITY_MI_CREATEUSER ON cdn_nationality(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CDN_NATIONALITY_MI_MODIFYUSER ON cdn_nationality(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CDN_NATIONALITY_MI_DELETEUSER ON cdn_nationality(MI_DELETEUSER) ;
--
CREATE INDEX IDX_ORGACC_ORGANIZATIONID ON cdn_orgaccount(ORGANIZATIONID) ;
--
CREATE INDEX IDX_ORGACC_CURRENCYID ON cdn_orgaccount(CURRENCYID) ;
--
CREATE INDEX IDX_ORGACC_BANKID ON cdn_orgaccount(BANKID) ;
--
CREATE INDEX IDX_ORGACC_MI_OWNER ON cdn_orgaccount(MI_OWNER) ;
--
CREATE INDEX IDX_ORGACC_MI_CREATEUSER ON cdn_orgaccount(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ORGACC_MI_MODIFYUSER ON cdn_orgaccount(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ORGACC_MI_DELETEUSER ON cdn_orgaccount(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_ORGACC_ACCCODE ON cdn_orgaccount(CODE,CURRENCYID,BANKID,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_ORG_OKPOCODE ON cdn_organization(OKPOCODE,MI_DATETO,MI_DELETEDATE) ;
--
CREATE INDEX IDX_ORG_ORGBUSINESSTYPEID ON cdn_organization(ORGBUSINESSTYPEID) ;
--
CREATE INDEX IDX_ORG_ORGOWNERSHIPTYPEID ON cdn_organization(ORGOWNERSHIPTYPEID) ;
--
CREATE INDEX IDX_ORG_CORRINDEXID ON cdn_organization(CORRINDEXID) ;
--
CREATE INDEX IDX_ORG_MI_DATA_ID ON cdn_organization(MI_DATA_ID) ;
--
CREATE INDEX IDX_ORG_MI_OWNER ON cdn_organization(MI_OWNER) ;
--
CREATE INDEX IDX_ORG_MI_CREATEUSER ON cdn_organization(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ORG_MI_MODIFYUSER ON cdn_organization(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ORG_MI_DELETEUSER ON cdn_organization(MI_DELETEUSER) ;
--
CREATE INDEX IDX_ORG_DTODD ON cdn_organization(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_ORG_HIST ON cdn_organization(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX idx_org_name ON cdn_organization(NAME) ;
--
CREATE UNIQUE INDEX UIDX_ORGBT_CODE ON cdn_orgbusinesstype(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_ORGBT_MI_OWNER ON cdn_orgbusinesstype(MI_OWNER) ;
--
CREATE INDEX IDX_ORGBT_MI_CREATEUSER ON cdn_orgbusinesstype(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ORGBT_MI_MODIFYUSER ON cdn_orgbusinesstype(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ORGBT_MI_DELETEUSER ON cdn_orgbusinesstype(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_ORGOT_CODE ON cdn_orgownershiptype(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_ORGOT_MI_OWNER ON cdn_orgownershiptype(MI_OWNER) ;
--
CREATE INDEX IDX_ORGOT_MI_CREATEUSER ON cdn_orgownershiptype(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ORGOT_MI_MODIFYUSER ON cdn_orgownershiptype(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ORGOT_MI_DELETEUSER ON cdn_orgownershiptype(MI_DELETEUSER) ;
--
CREATE INDEX IDX_CPERS_REGIONID ON cdn_person(REGIONID) ;
--
CREATE INDEX IDX_CPERS_SOCIALSTATUSID ON cdn_person(SOCIALSTATUSID) ;
--
CREATE INDEX IDX_CPERS_CATEGORYID ON cdn_person(CATEGORYID) ;
--
CREATE INDEX IDX_CPERS_NATIONALITY ON cdn_person(NATIONALITY) ;
--
CREATE INDEX IDX_CPERS_CLASSID ON cdn_person(CLASSID) ;
--
CREATE INDEX IDX_CPERS_MI_DATA_ID ON cdn_person(MI_DATA_ID) ;
--
CREATE INDEX IDX_CPERS_MI_OWNER ON cdn_person(MI_OWNER) ;
--
CREATE INDEX IDX_CPERS_MI_CREATEUSER ON cdn_person(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CPERS_MI_MODIFYUSER ON cdn_person(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CPERS_MI_DELETEUSER ON cdn_person(MI_DELETEUSER) ;
--
CREATE INDEX IDX_CPERS_DTODD ON cdn_person(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_CPERS_HIST ON cdn_person(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_CATEGORY_CODE ON cdn_personcategory(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CATEGORY_MI_OWNER ON cdn_personcategory(MI_OWNER) ;
--
CREATE INDEX IDX_CATEGORY_MI_CREATEUSER ON cdn_personcategory(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CATEGORY_MI_MODIFYUSER ON cdn_personcategory(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CATEGORY_MI_DELETEUSER ON cdn_personcategory(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_CDN_PERSONCLASS_CODE ON cdn_personclass(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CDN_PERSONCLASS_MI_OWNER ON cdn_personclass(MI_OWNER) ;
--
CREATE INDEX IDX_CDN_PERSONCLASS_MI_CREATEUSER ON cdn_personclass(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CDN_PERSONCLASS_MI_MODIFYUSER ON cdn_personclass(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CDN_PERSONCLASS_MI_DELETEUSER ON cdn_personclass(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_PSOCST_CODE ON cdn_personsocialstatus(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_PSOCST_MI_OWNER ON cdn_personsocialstatus(MI_OWNER) ;
--
CREATE INDEX IDX_PSOCST_MI_CREATEUSER ON cdn_personsocialstatus(MI_CREATEUSER) ;
--
CREATE INDEX IDX_PSOCST_MI_MODIFYUSER ON cdn_personsocialstatus(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_PSOCST_MI_DELETEUSER ON cdn_personsocialstatus(MI_DELETEUSER) ;
--
CREATE INDEX IDX_POSTIDX_STREETID ON cdn_postindex(STREETID) ;
--
CREATE INDEX IDX_POSTIDX_MI_OWNER ON cdn_postindex(MI_OWNER) ;
--
CREATE INDEX IDX_POSTIDX_MI_CREATEUSER ON cdn_postindex(MI_CREATEUSER) ;
--
CREATE INDEX IDX_POSTIDX_MI_MODIFYUSER ON cdn_postindex(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_POSTIDX_MI_DELETEUSER ON cdn_postindex(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_CDNPROF_CODE ON cdn_profession(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_CDNPROF_MI_OWNER ON cdn_profession(MI_OWNER) ;
--
CREATE INDEX IDX_CDNPROF_MI_CREATEUSER ON cdn_profession(MI_CREATEUSER) ;
--
CREATE INDEX IDX_CDNPROF_MI_MODIFYUSER ON cdn_profession(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_CDNPROF_MI_DELETEUSER ON cdn_profession(MI_DELETEUSER) ;
--
CREATE INDEX IDX_REGN_PARENTADMINUNITID ON cdn_region(PARENTADMINUNITID) ;
--
CREATE UNIQUE INDEX UIDX_REGN_CODE ON cdn_region(CODE,MI_DATETO,MI_DELETEDATE) ;
--
CREATE INDEX IDX_REGN_REGIONTYPEID ON cdn_region(REGIONTYPEID) ;
--
CREATE INDEX IDX_REGN_CENTERID ON cdn_region(CENTERID) ;
--
CREATE INDEX IDX_REGN_MI_DATA_ID ON cdn_region(MI_DATA_ID) ;
--
CREATE INDEX IDX_REGN_MI_OWNER ON cdn_region(MI_OWNER) ;
--
CREATE INDEX IDX_REGN_MI_CREATEUSER ON cdn_region(MI_CREATEUSER) ;
--
CREATE INDEX IDX_REGN_MI_MODIFYUSER ON cdn_region(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_REGN_MI_DELETEUSER ON cdn_region(MI_DELETEUSER) ;
--
CREATE INDEX IDX_REGN_DTODD ON cdn_region(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_REGN_HIST ON cdn_region(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX IDX_REGNT_MI_OWNER ON cdn_regiontype(MI_OWNER) ;
--
CREATE INDEX IDX_REGNT_MI_CREATEUSER ON cdn_regiontype(MI_CREATEUSER) ;
--
CREATE INDEX IDX_REGNT_MI_MODIFYUSER ON cdn_regiontype(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_REGNT_MI_DELETEUSER ON cdn_regiontype(MI_DELETEUSER) ;
--
CREATE INDEX IDX_STUNT_MI_OWNER ON cdn_staffunittype(MI_OWNER) ;
--
CREATE INDEX IDX_STUNT_MI_CREATEUSER ON cdn_staffunittype(MI_CREATEUSER) ;
--
CREATE INDEX IDX_STUNT_MI_MODIFYUSER ON cdn_staffunittype(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_STUNT_MI_DELETEUSER ON cdn_staffunittype(MI_DELETEUSER) ;
--
CREATE INDEX IDX_STREET_CITYID ON cdn_street(CITYID) ;
--
CREATE INDEX IDX_STREET_MI_DATA_ID ON cdn_street(MI_DATA_ID) ;
--
CREATE INDEX IDX_STREET_MI_OWNER ON cdn_street(MI_OWNER) ;
--
CREATE INDEX IDX_STREET_MI_CREATEUSER ON cdn_street(MI_CREATEUSER) ;
--
CREATE INDEX IDX_STREET_MI_MODIFYUSER ON cdn_street(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_STREET_MI_DELETEUSER ON cdn_street(MI_DELETEUSER) ;
--
CREATE INDEX IDX_STREET_DTODD ON cdn_street(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_STREET_HIST ON cdn_street(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX IDX_ODEP_PARENTID ON org_department(PARENTID) ;
--
CREATE INDEX IDX_ODEP_DEPTYPEID ON org_department(DEPTYPEID) ;
--
CREATE INDEX IDX_ODEP_MI_DATA_ID ON org_department(MI_DATA_ID) ;
--
CREATE INDEX IDX_ODEP_MI_OWNER ON org_department(MI_OWNER) ;
--
CREATE INDEX IDX_ODEP_MI_CREATEUSER ON org_department(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ODEP_MI_MODIFYUSER ON org_department(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ODEP_MI_DELETEUSER ON org_department(MI_DELETEUSER) ;
--
CREATE INDEX IDX_ODEP_DTODD ON org_department(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_ODEP_HIST ON org_department(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX IDX_ODIAGRAM_ORGUNITID ON org_diagram(ORGUNITID) ;
--
CREATE INDEX IDX_ODIAGRAM_MI_OWNER ON org_diagram(MI_OWNER) ;
--
CREATE INDEX IDX_ODIAGRAM_MI_CREATEUSER ON org_diagram(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ODIAGRAM_MI_MODIFYUSER ON org_diagram(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ODIAGRAM_MI_DELETEUSER ON org_diagram(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UIDX_OEMP_CODE ON org_employee(CODE,MI_DATETO,MI_DELETEDATE) ;
--
CREATE INDEX IDX_OEMP_USERID ON org_employee(USERID) ;
--
CREATE INDEX IDX_OEMP_MI_DATA_ID ON org_employee(MI_DATA_ID) ;
--
CREATE INDEX IDX_OEMP_MI_OWNER ON org_employee(MI_OWNER) ;
--
CREATE INDEX IDX_OEMP_MI_CREATEUSER ON org_employee(MI_CREATEUSER) ;
--
CREATE INDEX IDX_OEMP_MI_MODIFYUSER ON org_employee(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_OEMP_MI_DELETEUSER ON org_employee(MI_DELETEUSER) ;
--
CREATE INDEX IDX_OEMP_DTODD ON org_employee(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_OEMP_HIST ON org_employee(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX IDX_EMPONS_EMPLOYEEID ON org_employeeonstaff(EMPLOYEEID) ;
--
CREATE INDEX IDX_EMPONS_STAFFUNITID ON org_employeeonstaff(STAFFUNITID) ;
--
CREATE INDEX IDX_EMPONS_MI_DATA_ID ON org_employeeonstaff(MI_DATA_ID) ;
--
CREATE INDEX IDX_EMPONS_MI_OWNER ON org_employeeonstaff(MI_OWNER) ;
--
CREATE INDEX IDX_EMPONS_MI_CREATEUSER ON org_employeeonstaff(MI_CREATEUSER) ;
--
CREATE INDEX IDX_EMPONS_MI_MODIFYUSER ON org_employeeonstaff(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_EMPONS_MI_DELETEUSER ON org_employeeonstaff(MI_DELETEUSER) ;
--
CREATE INDEX IDX_EMPONS_DTODD ON org_employeeonstaff(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_EMPONS_HIST ON org_employeeonstaff(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX IDX_EMPONPEND_EMPONSTAFFID ON org_employeeonstaff_pending(EMPONSTAFFID) ;
--
CREATE INDEX IDX_EMPONPEND_MI_OWNER ON org_employeeonstaff_pending(MI_OWNER) ;
--
CREATE INDEX IDX_EMPONPEND_MI_CREATEUSER ON org_employeeonstaff_pending(MI_CREATEUSER) ;
--
CREATE INDEX IDX_EMPONPEND_MI_MODIFYUSER ON org_employeeonstaff_pending(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ORGEXGR_PARENTID ON org_execgroup(PARENTID) ;
--
CREATE INDEX IDX_ORGEXGR_MI_DATA_ID ON org_execgroup(MI_DATA_ID) ;
--
CREATE INDEX IDX_ORGEXGR_MI_OWNER ON org_execgroup(MI_OWNER) ;
--
CREATE INDEX IDX_ORGEXGR_MI_CREATEUSER ON org_execgroup(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ORGEXGR_MI_MODIFYUSER ON org_execgroup(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ORGEXGR_MI_DELETEUSER ON org_execgroup(MI_DELETEUSER) ;
--
CREATE INDEX IDX_ORGEXGR_DTODD ON org_execgroup(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_ORGEXGR_HIST ON org_execgroup(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX IDX_ORGEXGRM_EXECGROUPID ON org_execgroupmember(EXECGROUPID) ;
--
CREATE INDEX IDX_ORGEXGRM_ORGUNITID ON org_execgroupmember(ORGUNITID) ;
--
CREATE INDEX IDX_ORGEXGRM_MI_OWNER ON org_execgroupmember(MI_OWNER) ;
--
CREATE INDEX IDX_ORGEXGRM_MI_CREATEUSER ON org_execgroupmember(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ORGEXGRM_MI_MODIFYUSER ON org_execgroupmember(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX IDX_ORGEXECGRPM_GRID_UID ON org_execgroupmember(EXECGROUPID,ORGUNITID) ;
--
CREATE INDEX IDX_UORGACC_ORGANIZATIONID ON org_orgaccount(ORGANIZATIONID) ;
--
CREATE INDEX IDX_UORGACC_CURRENCYID ON org_orgaccount(CURRENCYID) ;
--
CREATE INDEX IDX_UORGACC_BANKID ON org_orgaccount(BANKID) ;
--
CREATE INDEX IDX_UORGACC_MI_OWNER ON org_orgaccount(MI_OWNER) ;
--
CREATE INDEX IDX_UORGACC_MI_CREATEUSER ON org_orgaccount(MI_CREATEUSER) ;
--
CREATE INDEX IDX_UORGACC_MI_MODIFYUSER ON org_orgaccount(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_UORGACC_MI_DELETEUSER ON org_orgaccount(MI_DELETEUSER) ;
--
CREATE INDEX IDX_OORG_PARENTID ON org_organization(PARENTID) ;
--
CREATE UNIQUE INDEX UIDX_OORG_CODE ON org_organization(CODE,MI_DATETO,MI_DELETEDATE) ;
--
CREATE INDEX IDX_OORG_ORGBUSINESSTYPEID ON org_organization(ORGBUSINESSTYPEID) ;
--
CREATE INDEX IDX_OORG_ORGOWNERSHIPTYPEID ON org_organization(ORGOWNERSHIPTYPEID) ;
--
CREATE INDEX IDX_OORG_MI_DATA_ID ON org_organization(MI_DATA_ID) ;
--
CREATE INDEX IDX_OORG_MI_OWNER ON org_organization(MI_OWNER) ;
--
CREATE INDEX IDX_OORG_MI_CREATEUSER ON org_organization(MI_CREATEUSER) ;
--
CREATE INDEX IDX_OORG_MI_MODIFYUSER ON org_organization(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_OORG_MI_DELETEUSER ON org_organization(MI_DELETEUSER) ;
--
CREATE INDEX IDX_OORG_DTODD ON org_organization(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_OORG_HIST ON org_organization(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_PROF_CODE ON org_profession(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_PROF_MI_OWNER ON org_profession(MI_OWNER) ;
--
CREATE INDEX IDX_PROF_MI_CREATEUSER ON org_profession(MI_CREATEUSER) ;
--
CREATE INDEX IDX_PROF_MI_MODIFYUSER ON org_profession(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_PROF_MI_DELETEUSER ON org_profession(MI_DELETEUSER) ;
--
CREATE INDEX IDX_STUNIT_PARENTID ON org_staffunit(PARENTID) ;
--
CREATE UNIQUE INDEX UIDX_STUNIT_CODE ON org_staffunit(CODE,MI_DATETO,MI_DELETEDATE) ;
--
CREATE INDEX IDX_STUNIT_PROFESSIONEXTID ON org_staffunit(PROFESSIONEXTID) ;
--
CREATE INDEX IDX_STUNIT_PROFESSIONID ON org_staffunit(PROFESSIONID) ;
--
CREATE INDEX IDX_STUNIT_STAFFUNITTYPEID ON org_staffunit(STAFFUNITTYPEID) ;
--
CREATE INDEX IDX_STUNIT_MI_DATA_ID ON org_staffunit(MI_DATA_ID) ;
--
CREATE INDEX IDX_STUNIT_MI_OWNER ON org_staffunit(MI_OWNER) ;
--
CREATE INDEX IDX_STUNIT_MI_CREATEUSER ON org_staffunit(MI_CREATEUSER) ;
--
CREATE INDEX IDX_STUNIT_MI_MODIFYUSER ON org_staffunit(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_STUNIT_MI_DELETEUSER ON org_staffunit(MI_DELETEUSER) ;
--
CREATE INDEX IDX_STUNIT_DTODD ON org_staffunit(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_STUNIT_HIST ON org_staffunit(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE INDEX IDX_OUNIT_PARENTID ON org_unit(PARENTID) ;
--
CREATE INDEX IDX_OUNIT_MI_DATA_ID ON org_unit(MI_DATA_ID) ;
--
CREATE INDEX IDX_OUNIT_MI_OWNER ON org_unit(MI_OWNER) ;
--
CREATE INDEX IDX_OUNIT_MI_CREATEUSER ON org_unit(MI_CREATEUSER) ;
--
CREATE INDEX IDX_OUNIT_MI_MODIFYUSER ON org_unit(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_OUNIT_MI_DELETEUSER ON org_unit(MI_DELETEUSER) ;
--
CREATE INDEX IDX_OUNIT_TREEPATH ON org_unit(MI_TREEPATH) ;
--
CREATE INDEX IDX_OUNIT_DTODD ON org_unit(MI_DATETO,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_OUNIT_HIST ON org_unit(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE) ;
--
CREATE UNIQUE INDEX UIDX_REQ_DEPART_NAME ON req_depart(NAME) ;
--
CREATE INDEX IDX_REQ_DEPARTMENT ON req_reqList(DEPARTMENT) ;
--
CREATE INDEX IDX_REQ_SUBDEPARTMENT ON req_reqList(SUBDEPARTMENT) ;
--
CREATE INDEX IDX_REQ_SUBDEPART_DEPARTMENT ON req_subDepart(DEPARTMENT) ;
--
CREATE UNIQUE INDEX UIDX_BHIST_IAR ON ub_blobHistory(INSTANCE,ATTRIBUTE,REVISION) ;
--
CREATE UNIQUE INDEX UIDX_UBA_ADVSECURITY_USERID ON uba_advSecurity(USERID) ;
--
CREATE INDEX IDX_UBA_ADVSECURITY_MI_OWNER ON uba_advSecurity(MI_OWNER) ;
--
CREATE INDEX IDX_UBA_ADVSECURITY_MI_CREATEUSER ON uba_advSecurity(MI_CREATEUSER) ;
--
CREATE INDEX IDX_UBA_ADVSECURITY_MI_MODIFYUSER ON uba_advSecurity(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX UK_UBA_ALS_EASR ON uba_als(ENTITY,ATTRIBUTE,STATE,ROLENAME) ;
--
CREATE INDEX idx_saud_targetUser ON uba_audit(TARGETUSER) ;
--
CREATE INDEX idx_audtr_entity ON uba_auditTrail(ENTITYINFO_ID) ;
--
CREATE INDEX idx_audtr_parententinfoid ON uba_auditTrail(PARENTENTITYINFO_ID) ;
--
CREATE INDEX IDX_ELS_RULEROLE ON uba_els(RULEROLE) ;
--
CREATE INDEX IDX_ELS_MI_OWNER ON uba_els(MI_OWNER) ;
--
CREATE INDEX IDX_ELS_MI_CREATEUSER ON uba_els(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ELS_MI_MODIFYUSER ON uba_els(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX UIDX_GR_CODE ON uba_group(CODE) ;
--
CREATE UNIQUE INDEX UIDX_GR_NAME ON uba_group(NAME) ;
--
CREATE INDEX IDX_GR_MI_OWNER ON uba_group(MI_OWNER) ;
--
CREATE INDEX IDX_GR_MI_CREATEUSER ON uba_group(MI_CREATEUSER) ;
--
CREATE INDEX IDX_GR_MI_MODIFYUSER ON uba_group(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_UBA_GROUPROLE_GROUPID ON uba_grouprole(GROUPID) ;
--
CREATE INDEX IDX_UBA_GROUPROLE_ROLEID ON uba_grouprole(ROLEID) ;
--
CREATE INDEX IDX_UBA_GROUPROLE_MI_OWNER ON uba_grouprole(MI_OWNER) ;
--
CREATE INDEX IDX_UBA_GROUPROLE_MI_CREATEUSER ON uba_grouprole(MI_CREATEUSER) ;
--
CREATE INDEX IDX_UBA_GROUPROLE_MI_MODIFYUSER ON uba_grouprole(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX UK_GRPROLE_USER_ROLE ON uba_grouprole(GROUPID,ROLEID) ;
--
CREATE INDEX IDX_OTP_USERID ON uba_otp(USERID) ;
--
CREATE INDEX IDX_OTP_MI_OWNER ON uba_otp(MI_OWNER) ;
--
CREATE INDEX IDX_OTP_MI_CREATEUSER ON uba_otp(MI_CREATEUSER) ;
--
CREATE INDEX IDX_OTP_MI_MODIFYUSER ON uba_otp(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX uidx_otp ON uba_otp(OTP) ;
--
CREATE INDEX IDX_PREVP_USERID ON uba_prevPasswordsHash(USERID) ;
--
CREATE INDEX IDX_PREVP_MI_OWNER ON uba_prevPasswordsHash(MI_OWNER) ;
--
CREATE INDEX IDX_PREVP_MI_CREATEUSER ON uba_prevPasswordsHash(MI_CREATEUSER) ;
--
CREATE INDEX IDX_PREVP_MI_MODIFYUSER ON uba_prevPasswordsHash(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX UIDX_ROLE_NAME ON uba_role(NAME) ;
--
CREATE INDEX IDX_ROLE_MI_OWNER ON uba_role(MI_OWNER) ;
--
CREATE INDEX IDX_ROLE_MI_CREATEUSER ON uba_role(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ROLE_MI_MODIFYUSER ON uba_role(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_SUBJ_NAME ON uba_subject(NAME) ;
--
CREATE UNIQUE INDEX UIDX_USR_NAME ON uba_user(NAME) ;
--
CREATE INDEX IDX_USR_MI_OWNER ON uba_user(MI_OWNER) ;
--
CREATE INDEX IDX_USR_MI_CREATEUSER ON uba_user(MI_CREATEUSER) ;
--
CREATE INDEX IDX_USR_MI_MODIFYUSER ON uba_user(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_USRCER_USERID ON uba_usercertificate(USERID) ;
--
CREATE UNIQUE INDEX UIDX_USRCER_SERIAL ON uba_usercertificate(SERIAL) ;
--
CREATE INDEX IDX_USRCER_MI_OWNER ON uba_usercertificate(MI_OWNER) ;
--
CREATE INDEX IDX_USRCER_MI_CREATEUSER ON uba_usercertificate(MI_CREATEUSER) ;
--
CREATE INDEX IDX_USRCER_MI_MODIFYUSER ON uba_usercertificate(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX uidx_usercert ON uba_usercertificate(SERIAL,ISSUER_SERIAL,USERID) ;
--
CREATE INDEX IDX_USRGROUP_USERID ON uba_usergroup(USERID) ;
--
CREATE INDEX IDX_USRGROUP_GROUPID ON uba_usergroup(GROUPID) ;
--
CREATE INDEX IDX_USRGROUP_MI_OWNER ON uba_usergroup(MI_OWNER) ;
--
CREATE INDEX IDX_USRGROUP_MI_CREATEUSER ON uba_usergroup(MI_CREATEUSER) ;
--
CREATE INDEX IDX_USRGROUP_MI_MODIFYUSER ON uba_usergroup(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX UK_USRGROUP_USER_GROUP ON uba_usergroup(USERID,GROUPID) ;
--
CREATE INDEX IDX_USROLE_USERID ON uba_userrole(USERID) ;
--
CREATE INDEX IDX_USROLE_ROLEID ON uba_userrole(ROLEID) ;
--
CREATE INDEX IDX_USROLE_MI_OWNER ON uba_userrole(MI_OWNER) ;
--
CREATE INDEX IDX_USROLE_MI_CREATEUSER ON uba_userrole(MI_CREATEUSER) ;
--
CREATE INDEX IDX_USROLE_MI_MODIFYUSER ON uba_userrole(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX UK_USRROLE_USER_ROLE ON uba_userrole(USERID,ROLEID) ;
--
CREATE UNIQUE INDEX UIDX_DESK_CODE ON ubm_desktop(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_DESK_MI_OWNER ON ubm_desktop(MI_OWNER) ;
--
CREATE INDEX IDX_DESK_MI_CREATEUSER ON ubm_desktop(MI_CREATEUSER) ;
--
CREATE INDEX IDX_DESK_MI_MODIFYUSER ON ubm_desktop(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_DESK_MI_DELETEUSER ON ubm_desktop(MI_DELETEUSER) ;
--
CREATE INDEX IDX_ADMDESK_INSTANCEID ON ubm_desktop_adm(INSTANCEID) ;
--
CREATE INDEX IDX_ADMDESK_ADMSUBJID ON ubm_desktop_adm(ADMSUBJID) ;
--
CREATE UNIQUE INDEX UK_ADMDESC_INST_ADMSUBJ ON ubm_desktop_adm(INSTANCEID,ADMSUBJID) ;
--
CREATE INDEX IDX_ENU_MI_OWNER ON ubm_enum(MI_OWNER) ;
--
CREATE INDEX IDX_ENU_MI_CREATEUSER ON ubm_enum(MI_CREATEUSER) ;
--
CREATE INDEX IDX_ENU_MI_MODIFYUSER ON ubm_enum(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_ENU_MI_DELETEUSER ON ubm_enum(MI_DELETEUSER) ;
--
CREATE UNIQUE INDEX UK_UBM_ENUM_GROUPCODE ON ubm_enum(EGROUP,CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_NAVSH_DESKTOPID ON ubm_navshortcut(DESKTOPID) ;
--
CREATE INDEX IDX_NAVSH_PARENTID ON ubm_navshortcut(PARENTID) ;
--
CREATE UNIQUE INDEX UIDX_NAVSH_CODE ON ubm_navshortcut(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_NAVSH_MI_OWNER ON ubm_navshortcut(MI_OWNER) ;
--
CREATE INDEX IDX_NAVSH_MI_CREATEUSER ON ubm_navshortcut(MI_CREATEUSER) ;
--
CREATE INDEX IDX_NAVSH_MI_MODIFYUSER ON ubm_navshortcut(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_NAVSH_MI_DELETEUSER ON ubm_navshortcut(MI_DELETEUSER) ;
--
CREATE INDEX IDX_NAVSH_TREEPATH ON ubm_navshortcut(MI_TREEPATH) ;
--
CREATE INDEX IDX_ADMNAV_INSTANCEID ON ubm_navshortcut_adm(INSTANCEID) ;
--
CREATE INDEX IDX_ADMNAV_ADMSUBJID ON ubm_navshortcut_adm(ADMSUBJID) ;
--
CREATE UNIQUE INDEX UK_ADMNAV_INST_ADMSUBJ ON ubm_navshortcut_adm(INSTANCEID,ADMSUBJID) ;
--
CREATE UNIQUE INDEX UIDX_UBMQR_CODE ON ubm_query(CODE,MI_DELETEDATE) ;
--
CREATE INDEX IDX_UBMQR_MI_OWNER ON ubm_query(MI_OWNER) ;
--
CREATE INDEX IDX_UBMQR_MI_CREATEUSER ON ubm_query(MI_CREATEUSER) ;
--
CREATE INDEX IDX_UBMQR_MI_MODIFYUSER ON ubm_query(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_UBMQR_MI_DELETEUSER ON ubm_query(MI_DELETEUSER) ;
--
CREATE INDEX IDX_MQM_MI_OWNER ON ubq_messages(MI_OWNER) ;
--
CREATE INDEX IDX_MQM_MI_CREATEUSER ON ubq_messages(MI_CREATEUSER) ;
--
CREATE INDEX IDX_MQM_MI_MODIFYUSER ON ubq_messages(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_UBQ_MESSAGES_QCCD ON ubq_messages(QUEUECODE,COMPLETEDATE) ;
--
CREATE INDEX IDX_SFILTER_OWNER ON ubs_filter(OWNER) ;
--
CREATE INDEX IDX_SFILTER_MI_OWNER ON ubs_filter(MI_OWNER) ;
--
CREATE INDEX IDX_SFILTER_MI_CREATEUSER ON ubs_filter(MI_CREATEUSER) ;
--
CREATE INDEX IDX_SFILTER_MI_MODIFYUSER ON ubs_filter(MI_MODIFYUSER) ;
--
CREATE UNIQUE INDEX uix_ubs_filter ON ubs_filter(CODE,OWNER,NAME) ;
--
CREATE INDEX ix_ubs_filter_code ON ubs_filter(CODE) ;
--
CREATE INDEX IDX_MSG_MI_OWNER ON ubs_message(MI_OWNER) ;
--
CREATE INDEX IDX_MSG_MI_CREATEUSER ON ubs_message(MI_CREATEUSER) ;
--
CREATE INDEX IDX_MSG_MI_MODIFYUSER ON ubs_message(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_MSG_MI_DELETEUSER ON ubs_message(MI_DELETEUSER) ;
--
CREATE INDEX idx_ubsmsg_period ON ubs_message(STARTDATE,EXPIREDATE) ;
--
CREATE INDEX IDX_MSG_RC_MESSAGEID ON ubs_message_recipient(MESSAGEID) ;
--
CREATE INDEX IDX_MSG_RC_USERID ON ubs_message_recipient(USERID) ;
--
CREATE INDEX uidx_ubsmsg_rc ON ubs_message_recipient(MESSAGEID,USERID) ;
--
CREATE UNIQUE INDEX UIDX_NUCO_REGKEY ON ubs_numcounter(REGKEY) ;
--
CREATE UNIQUE INDEX UK_UBS_NUMCOUNT_RKC ON ubs_numcounterreserv(REGKEY,COUNTER) ;
--
CREATE UNIQUE INDEX UIDX_STNGS_SETTINGKEY ON ubs_settings(SETTINGKEY) ;
--
CREATE INDEX IDX_STNGS_MI_OWNER ON ubs_settings(MI_OWNER) ;
--
CREATE INDEX IDX_STNGS_MI_CREATEUSER ON ubs_settings(MI_CREATEUSER) ;
--
CREATE INDEX IDX_STNGS_MI_MODIFYUSER ON ubs_settings(MI_MODIFYUSER) ;
--
CREATE INDEX IDX_SLOCK_LOCKUSER ON ubs_softLock(LOCKUSER) ;
--
CREATE UNIQUE INDEX UIDX_SOFTLOCK_LOENT ON ubs_softLock(LOCKID,ENTITY) ;
--