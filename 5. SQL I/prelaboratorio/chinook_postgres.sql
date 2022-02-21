

/*------------------------------------------------------------------------------
﻿		**************UNIVERSIDAD DE LOS ANDES************
*
*Preparadurias bases de datos
*Prof: Solazver Sole
* DB: Base de datos chinook_postgres.sql
* PURPOSE: Bases de datos chinook, version para postgres sin comillas 
* NOTES: Se organizo para ingresar relaciones directamente en la definicion de
	tabla
* CREATED:  05/04/17
*
*-------------------------------------------------------------------------------
*/


CREATE TABLE Artist
(
    ArtistId INT NOT NULL,
    Name VARCHAR(120),
    CONSTRAINT PK_Artist PRIMARY KEY  (ArtistId)
);



CREATE TABLE Genre
(
    GenreId INT NOT NULL,
    Name VARCHAR(120),
    CONSTRAINT PK_Genre PRIMARY KEY  (GenreId)
);


CREATE TABLE MediaType
(
    MediaTypeId INT NOT NULL,
    Name VARCHAR(120),
    CONSTRAINT PK_MediaType PRIMARY KEY  (MediaTypeId)
);

CREATE TABLE Playlist
(
    PlaylistId INT NOT NULL,
    Name VARCHAR(120),
    CONSTRAINT PK_Playlist PRIMARY KEY  (PlaylistId)
);

CREATE TABLE Album
(
    AlbumId INT NOT NULL,
    Title VARCHAR(160) NOT NULL,
    ArtistId INT NOT NULL,
    CONSTRAINT PK_Album PRIMARY KEY  (AlbumId),

    CONSTRAINT FK_AlbumArtistId
    FOREIGN KEY (ArtistId) 
    REFERENCES Artist (ArtistId) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Employee
(
    EmployeeId INT NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    Title VARCHAR(30),
    ReportsTo INT,
    BirthDate TIMESTAMP,
    HireDate TIMESTAMP,
    Address VARCHAR(70),
    City VARCHAR(40),
    State VARCHAR(40),
    Country VARCHAR(40),
    PostalCode VARCHAR(10),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    Email VARCHAR(60),
    CONSTRAINT PK_Employee PRIMARY KEY  (EmployeeId),

    CONSTRAINT FK_EmployeeReportsTo
    FOREIGN KEY (ReportsTo) 
    REFERENCES Employee (EmployeeId) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE Customer
(
    CustomerId INT NOT NULL,
    FirstName VARCHAR(40) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Company VARCHAR(80),
    Address VARCHAR(70),
    City VARCHAR(40),
    State VARCHAR(40),
    Country VARCHAR(40),
    PostalCode VARCHAR(10),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    Email VARCHAR(60) NOT NULL,
    SupportRepId INT,
    CONSTRAINT PK_Customer PRIMARY KEY  (CustomerId),

    CONSTRAINT FK_CustomerSupportRepId
    FOREIGN KEY (SupportRepId) 
    REFERENCES Employee (EmployeeId) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE Invoice
(
    InvoiceId INT NOT NULL,
    CustomerId INT NOT NULL,
    InvoiceDate TIMESTAMP NOT NULL,
    BillingAddress VARCHAR(70),
    BillingCity VARCHAR(40),
    BillingState VARCHAR(40),
    BillingCountry VARCHAR(40),
    BillingPostalCode VARCHAR(10),
    Total NUMERIC NOT NULL,
    CONSTRAINT PK_Invoice PRIMARY KEY  (InvoiceId),

    CONSTRAINT FK_InvoiceCustomerId
    FOREIGN KEY (CustomerId) 
    REFERENCES  Customer (CustomerId) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Track
(
    TrackId INT NOT NULL,
    Name VARCHAR(200) NOT NULL,
    AlbumId INT,
    MediaTypeId INT NOT NULL,
    GenreId INT,
    Composer VARCHAR(220),
    Milliseconds INT NOT NULL,
    Bytes INT,
    UnitPrice NUMERIC NOT NULL,
    CONSTRAINT PK_Track PRIMARY KEY  (TrackId),

    CONSTRAINT  FK_TrackAlbumId
    FOREIGN KEY (AlbumId) 
    REFERENCES  Album (AlbumId) ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT FK_TrackGenreId
    FOREIGN KEY (GenreId) 
    REFERENCES  Genre (GenreId) ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT FK_TrackMediaTypeId
    FOREIGN KEY (MediaTypeId) 
    REFERENCES  MediaType  (MediaTypeId) ON DELETE NO ACTION ON UPDATE NO ACTION


);


CREATE TABLE InvoiceLine
(
    InvoiceLineId INT NOT NULL,
    InvoiceId INT NOT NULL,
    TrackId INT NOT NULL,
    UnitPrice NUMERIC NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT PK_InvoiceLine PRIMARY KEY  (InvoiceLineId),

    CONSTRAINT FK_InvoiceLineInvoiceId
    FOREIGN KEY (InvoiceId)
    REFERENCES Invoice (InvoiceId) ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT FK_InvoiceLineTrackId
    FOREIGN KEY (TrackId) 
    REFERENCES Track (TrackId) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE PlaylistTrack
(
    PlaylistId INT NOT NULL,
    TrackId INT NOT NULL,
    CONSTRAINT PK_PlaylistTrack PRIMARY KEY  (PlaylistId, TrackId),

    CONSTRAINT FK_PlaylistTrackPlaylistId
    FOREIGN KEY (PlaylistId) 
    REFERENCES Playlist (PlaylistId) ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT FK_PlaylistTrackTrackId
    FOREIGN KEY (TrackId) 
    REFERENCES Track (TrackId) ON DELETE NO ACTION ON UPDATE NO ACTION

);

/*------------------------------------------------------------------------------
*  INDICES
*-------------------------------------------------------------------------------
*/


CREATE INDEX IFK_AlbumArtistId ON Album (ArtistId);
CREATE INDEX IFK_CustomerSupportRepId ON Customer (SupportRepId);
CREATE INDEX IFK_EmployeeReportsTo ON Employee (ReportsTo);
CREATE INDEX IFK_InvoiceCustomerId ON Invoice (CustomerId);
CREATE INDEX IFK_InvoiceLineInvoiceId ON InvoiceLine (InvoiceId);
CREATE INDEX IFK_InvoiceLineTrackId ON InvoiceLine (TrackId);
CREATE INDEX IFK_PlaylistTrackTrackId ON PlaylistTrack (TrackId);
CREATE INDEX IFK_TrackAlbumId ON  Track  (AlbumId);
CREATE INDEX IFK_TrackGenreId ON  Track (GenreId);
CREATE INDEX IFK_TrackMediaTypeId ON Track (MediaTypeId);

/*------------------------------------------------------------------------------
*  TODO:
*	-Explicar de manera detallada cuando usar indices, pros y contras.
*	-Indicar en este esquema porque se usaron los siguientes indices
*-------------------------------------------------------------------------------
*/


