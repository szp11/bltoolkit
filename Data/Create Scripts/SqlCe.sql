DROP TABLE DataTypeTest
GO
DROP TABLE BinaryData
GO
DROP TABLE Patient
GO
DROP TABLE Doctor
GO
DROP TABLE Person
GO

-- Person Table

CREATE TABLE Person
(
	PersonID   int          NOT NULL IDENTITY(1,1) CONSTRAINT PK_Person PRIMARY KEY,
	FirstName  nvarchar(50) NOT NULL,
	LastName   nvarchar(50) NOT NULL,
	MiddleName nvarchar(50)     NULL,
	Gender     nchar(1)     NOT NULL
)
GO

INSERT INTO Person (FirstName, LastName, Gender) VALUES ('John',   'Pupkin',    'M')
GO
INSERT INTO Person (FirstName, LastName, Gender) VALUES ('Tester', 'Testerson', 'M')
GO

-- Doctor Table Extension

CREATE TABLE Doctor
(
	PersonID int          NOT NULL
		CONSTRAINT PK_Doctor        PRIMARY KEY
		CONSTRAINT FK_Doctor_Person --FOREIGN KEY
			REFERENCES Person ([PersonID])
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	Taxonomy nvarchar(50) NOT NULL
)
GO

INSERT INTO Doctor (PersonID, Taxonomy) VALUES (1, 'Psychiatry')
GO

-- Patient Table Extension

CREATE TABLE Patient
(
	PersonID  int           NOT NULL
		CONSTRAINT PK_Patient        PRIMARY KEY
		CONSTRAINT FK_Patient_Person --FOREIGN KEY
			REFERENCES Person ([PersonID])
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	Diagnosis nvarchar(256) NOT NULL
)
GO

INSERT INTO Patient (PersonID, Diagnosis) VALUES (2, 'Hallucination with Paranoid Bugs'' Delirium of Persecution')
GO

-- BinaryData Table

CREATE TABLE BinaryData
(
	BinaryDataID int             NOT NULL IDENTITY(1,1) CONSTRAINT PK_BinaryData PRIMARY KEY,
	Data         varbinary(1024) NOT NULL)
GO

CREATE TABLE DataTypeTest
(
	DataTypeID      int          NOT NULL IDENTITY(1,1) CONSTRAINT PK_DataType PRIMARY KEY,
	Binary_         binary(50)       NULL,
	Boolean_        bit              NULL,
	Byte_           tinyint          NULL,
	Bytes_          varbinary(50)    NULL,
	Char_           nchar(1)         NULL,
	DateTime_       datetime         NULL,
	Decimal_        numeric(20,2)    NULL,
	Double_         float            NULL,
	Guid_           uniqueidentifier NULL,
	Int16_          smallint         NULL,
	Int32_          int              NULL,
	Int64_          bigint           NULL,
	Money_          money            NULL,
	SByte_          tinyint          NULL,
	Single_         real             NULL,
	Stream_         varbinary(50)    NULL,
	String_         nvarchar(50)     NULL,
	UInt16_         smallint         NULL,
	UInt32_         int              NULL,
	UInt64_         bigint           NULL,
	Xml_            ntext            NULL
)
GO

INSERT INTO DataTypeTest
	(Binary_, Boolean_,   Byte_,  Bytes_,  Char_,  DateTime_, Decimal_,
	 Double_,    Guid_,  Int16_,  Int32_,  Int64_,    Money_,   SByte_,
	 Single_,  Stream_, String_, UInt16_, UInt32_,   UInt64_,     Xml_)
VALUES
	(   NULL,     NULL,    NULL,    NULL,    NULL,      NULL,     NULL,
	    NULL,     NULL,    NULL,    NULL,    NULL,      NULL,     NULL,
	    NULL,     NULL,    NULL,    NULL,    NULL,      NULL,     NULL)
GO

INSERT INTO DataTypeTest
	(Binary_, Boolean_,   Byte_,  Bytes_,  Char_,  DateTime_, Decimal_,
	 Double_,    Guid_,  Int16_,  Int32_,  Int64_,    Money_,   SByte_,
	 Single_,  Stream_, String_, UInt16_, UInt32_,   UInt64_,
	 Xml_)
VALUES
	(NewID(),        1,     255, NewID(),     'B', GetDate(), 12345.67,
	1234.567,  NewID(),   32767,   32768, 1000000,   12.3456,      127,
	1234.123,  NewID(), 'string',  32767,   32768, 200000000,
	'<root><element strattr="strvalue" intattr="12345"/></root>')
GO



DROP TABLE Parent
GO
DROP TABLE Child
GO
DROP TABLE GrandChild
GO

CREATE TABLE Parent      (ParentID int)
GO
CREATE TABLE Child       (ParentID int, ChildID int)
GO
CREATE TABLE GrandChild  (ParentID int, ChildID int, GrandChildID int)
GO

INSERT INTO Parent     VALUES (1)
GO
INSERT INTO Child      VALUES (1,11)
GO
INSERT INTO GrandChild VALUES (1,11,111)
GO

INSERT INTO Parent     VALUES (2)
GO
INSERT INTO Child      VALUES (2,21)
GO
INSERT INTO GrandChild VALUES (2,21,211)
GO
INSERT INTO GrandChild VALUES (2,21,212)
GO
INSERT INTO Child      VALUES (2,22)
GO
INSERT INTO GrandChild VALUES (2,22,221)
GO
INSERT INTO GrandChild VALUES (2,22,222)
GO

INSERT INTO Parent     VALUES (3)
GO
INSERT INTO Child      VALUES (3,31)
GO
INSERT INTO GrandChild VALUES (3,31,311)
GO
INSERT INTO GrandChild VALUES (3,31,312)
GO
INSERT INTO GrandChild VALUES (3,31,313)
GO
INSERT INTO Child      VALUES (3,32)
GO
INSERT INTO GrandChild VALUES (3,32,321)
GO
INSERT INTO GrandChild VALUES (3,32,322)
GO
INSERT INTO GrandChild VALUES (3,32,323)
GO
INSERT INTO Child      VALUES (3,33)
GO
INSERT INTO GrandChild VALUES (3,33,331)
GO
INSERT INTO GrandChild VALUES (3,33,332)
GO
INSERT INTO GrandChild VALUES (3,33,333)
GO

INSERT INTO Parent     VALUES (4)
GO
INSERT INTO Child      VALUES (4,41)
GO
INSERT INTO GrandChild VALUES (4,41,411)
GO
INSERT INTO GrandChild VALUES (4,41,412)
GO
INSERT INTO GrandChild VALUES (4,41,413)
GO
INSERT INTO GrandChild VALUES (4,41,414)
GO
INSERT INTO Child      VALUES (4,42)
GO
INSERT INTO GrandChild VALUES (4,42,421)
GO
INSERT INTO GrandChild VALUES (4,42,422)
GO
INSERT INTO GrandChild VALUES (4,42,423)
GO
INSERT INTO GrandChild VALUES (4,42,424)
GO
INSERT INTO Child      VALUES (4,43)
GO
INSERT INTO Child      VALUES (4,44)
GO

INSERT INTO Parent     VALUES (5)
GO
