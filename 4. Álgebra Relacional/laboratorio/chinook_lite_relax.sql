
/*------------------------------------------------------------------------------
		**************UNIVERSIDAD DE LOS ANDES************
*
*Preparadurias bases de datos A-2017 
*Nerio Moran
*Alvaro Araujo
*Prof: Solazver Sole
* DB: Base de datos chinook_lite
* PURPOSE: Bases de datos chinook, 'lite' version liviana para realizar operaciones
           de recuperacion de informacion utilizando algebra relacional y sql
           en la herramienta http://dbis-uibk.github.io/relax/  
* NOTES:  Se elimaron los indices, relax no los acepta.
* CREATED:  Nerio Moran 05/04/17
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
*  INDICES: FUERON ELIMINADOS, relax no los acepta.
*-------------------------------------------------------------------------------
*/

/*------------------------------------------------------------------------------
* INSERCIONES
*-------------------------------------------------------------------------------
*/

INSERT INTO Genre (GenreId, Name) VALUES (2, 'Jazz');
INSERT INTO Genre (GenreId, Name) VALUES (3, 'Metal');
INSERT INTO Genre (GenreId, Name) VALUES (4, 'Alternative & Punk');
INSERT INTO Genre (GenreId, Name) VALUES (5, 'Rock And Roll');
INSERT INTO Genre (GenreId, Name) VALUES (6, 'Blues');
INSERT INTO Genre (GenreId, Name) VALUES (7, 'Latin');
INSERT INTO Genre (GenreId, Name) VALUES (8, 'Reggae');
INSERT INTO Genre (GenreId, Name) VALUES (9, 'Pop');
INSERT INTO Genre (GenreId, Name) VALUES (10, 'Soundtrack');
INSERT INTO Genre (GenreId, Name) VALUES (11, 'Bossa Nova');
INSERT INTO Genre (GenreId, Name) VALUES (12, 'Easy Listening');
INSERT INTO Genre (GenreId, Name) VALUES (13, 'Heavy Metal');
INSERT INTO Genre (GenreId, Name) VALUES (14, 'R&B/Soul');
INSERT INTO Genre (GenreId, Name) VALUES (15, 'Electronica/Dance');
INSERT INTO Genre (GenreId, Name) VALUES (16, 'World');
INSERT INTO Genre (GenreId, Name) VALUES (17, 'Hip Hop/Rap');
INSERT INTO Genre (GenreId, Name) VALUES (18, 'Science Fiction');
INSERT INTO Genre (GenreId, Name) VALUES (19, 'TV Shows');
INSERT INTO Genre (GenreId, Name) VALUES (20, 'Sci Fi & Fantasy');
INSERT INTO Genre (GenreId, Name) VALUES (21, 'Drama');
INSERT INTO Genre (GenreId, Name) VALUES (22, 'Comedy');
INSERT INTO Genre (GenreId, Name) VALUES (23, 'Alternative');
INSERT INTO Genre (GenreId, Name) VALUES (24, 'Classical');
INSERT INTO Genre (GenreId, Name) VALUES (25, 'Opera');

INSERT INTO MediaType (MediaTypeId, Name) VALUES (1, 'MPEG audio file');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (2, 'Protected AAC audio file');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (3, 'Protected MPEG-4 video file');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (4, 'Purchased AAC audio file');
INSERT INTO MediaType (MediaTypeId, Name) VALUES (5, 'AAC audio file');

INSERT INTO Artist (ArtistId, Name) VALUES (1, 'AC/DC');
INSERT INTO Artist (ArtistId, Name) VALUES (2, 'Accept');
INSERT INTO Artist (ArtistId, Name) VALUES (3, 'Aerosmith');
INSERT INTO Artist (ArtistId, Name) VALUES (4, 'Alanis Morissette');
INSERT INTO Artist (ArtistId, Name) VALUES (5, 'Alice In Chains');
INSERT INTO Artist (ArtistId, Name) VALUES (6, 'Antônio Carlos Jobim');
INSERT INTO Artist (ArtistId, Name) VALUES (7, 'Apocalyptica');
INSERT INTO Artist (ArtistId, Name) VALUES (8, 'Audioslave');
INSERT INTO Artist (ArtistId, Name) VALUES (9, 'BackBeat');
INSERT INTO Artist (ArtistId, Name) VALUES (10, 'Billy Cobham');
INSERT INTO Artist (ArtistId, Name) VALUES (11, 'Black Label Society');
INSERT INTO Artist (ArtistId, Name) VALUES (12, 'Black Sabbath');
INSERT INTO Artist (ArtistId, Name) VALUES (13, 'Body Count');
INSERT INTO Artist (ArtistId, Name) VALUES (14, 'Bruce Dickinson');
INSERT INTO Artist (ArtistId, Name) VALUES (15, 'Buddy Guy');
INSERT INTO Artist (ArtistId, Name) VALUES (16, 'Caetano Veloso');
INSERT INTO Artist (ArtistId, Name) VALUES (17, 'Chico Buarque');
INSERT INTO Artist (ArtistId, Name) VALUES (18, 'Chico Science & Nação Zumbi');
INSERT INTO Artist (ArtistId, Name) VALUES (19, 'Cidade Negra');
INSERT INTO Artist (ArtistId, Name) VALUES (20, 'Cláudio Zoli');
INSERT INTO Artist (ArtistId, Name) VALUES (21, 'Various Artists');
INSERT INTO Artist (ArtistId, Name) VALUES (22, 'Led Zeppelin');
INSERT INTO Artist (ArtistId, Name) VALUES (23, 'Frank Zappa & Captain Beefheart');
INSERT INTO Artist (ArtistId, Name) VALUES (24, 'Marcos Valle');
INSERT INTO Artist (ArtistId, Name) VALUES (25, 'Milton Nascimento & Bebeto');
INSERT INTO Artist (ArtistId, Name) VALUES (26, 'Azymuth');
INSERT INTO Artist (ArtistId, Name) VALUES (27, 'Gilberto Gil');
INSERT INTO Artist (ArtistId, Name) VALUES (28, 'João Gilberto');
INSERT INTO Artist (ArtistId, Name) VALUES (29, 'Bebel Gilberto');
INSERT INTO Artist (ArtistId, Name) VALUES (30, 'Jorge Vercilo');
INSERT INTO Artist (ArtistId, Name) VALUES (31, 'Baby Consuelo');
INSERT INTO Artist (ArtistId, Name) VALUES (32, 'Ney Matogrosso');
INSERT INTO Artist (ArtistId, Name) VALUES (33, 'Luiz Melodia');
INSERT INTO Artist (ArtistId, Name) VALUES (34, 'Nando Reis');
INSERT INTO Artist (ArtistId, Name) VALUES (35, 'Pedro Luís & A Parede');
INSERT INTO Artist (ArtistId, Name) VALUES (36, 'O Rappa');
INSERT INTO Artist (ArtistId, Name) VALUES (37, 'Ed Motta');
INSERT INTO Artist (ArtistId, Name) VALUES (38, 'Banda Black Rio');
INSERT INTO Artist (ArtistId, Name) VALUES (39, 'Fernanda Porto');
INSERT INTO Artist (ArtistId, Name) VALUES (40, 'Os Cariocas');
INSERT INTO Artist (ArtistId, Name) VALUES (41, 'Elis Regina');
INSERT INTO Artist (ArtistId, Name) VALUES (42, 'Milton Nascimento');
INSERT INTO Artist (ArtistId, Name) VALUES (43, 'A Cor Do Som');
INSERT INTO Artist (ArtistId, Name) VALUES (44, 'Kid Abelha');
INSERT INTO Artist (ArtistId, Name) VALUES (45, 'Sandra De Sá');
INSERT INTO Artist (ArtistId, Name) VALUES (46, 'Jorge Ben');
INSERT INTO Artist (ArtistId, Name) VALUES (47, 'Hermeto Pascoal');
INSERT INTO Artist (ArtistId, Name) VALUES (48, 'Barão Vermelho');
INSERT INTO Artist (ArtistId, Name) VALUES (49, 'Edson, DJ Marky & DJ Patife Featuring Fernanda Porto');
INSERT INTO Artist (ArtistId, Name) VALUES (50, 'Metallica');	
INSERT INTO Artist (ArtistId, Name) VALUES (51, 'Queen');
INSERT INTO Artist (ArtistId, Name) VALUES (52, 'Kiss');
INSERT INTO Artist (ArtistId, Name) VALUES (53, 'Spyro Gyra');
INSERT INTO Artist (ArtistId, Name) VALUES (54, 'Green Day');
INSERT INTO Artist (ArtistId, Name) VALUES (55, 'David Coverdale');
INSERT INTO Artist (ArtistId, Name) VALUES (56, 'Gonzaguinha');
INSERT INTO Artist (ArtistId, Name) VALUES (57, 'Os Mutantes');
INSERT INTO Artist (ArtistId, Name) VALUES (58, 'Deep Purple');
INSERT INTO Artist (ArtistId, Name) VALUES (59, 'Santana');
INSERT INTO Artist (ArtistId, Name) VALUES (60, 'Santana Feat. Dave Matthews');
INSERT INTO Artist (ArtistId, Name) VALUES (61, 'Santana Feat. Everlast');
INSERT INTO Artist (ArtistId, Name) VALUES (62, 'Santana Feat. Rob Thomas');
INSERT INTO Artist (ArtistId, Name) VALUES (63, 'Santana Feat. Lauryn Hill & Cee-Lo');
INSERT INTO Artist (ArtistId, Name) VALUES (64, 'Santana Feat. The Project G&B');
INSERT INTO Artist (ArtistId, Name) VALUES (65, 'Santana Feat. Maná');
INSERT INTO Artist (ArtistId, Name) VALUES (66, 'Santana Feat. Eagle-Eye Cherry');
INSERT INTO Artist (ArtistId, Name) VALUES (67, 'Santana Feat. Eric Clapton');
INSERT INTO Artist (ArtistId, Name) VALUES (68, 'Miles Davis');
INSERT INTO Artist (ArtistId, Name) VALUES (69, 'Gene Krupa');
INSERT INTO Artist (ArtistId, Name) VALUES (70, 'Toquinho & Vinícius');
INSERT INTO Artist (ArtistId, Name) VALUES (71, 'Vinícius De Moraes & Baden Powell');
INSERT INTO Artist (ArtistId, Name) VALUES (72, 'Vinícius De Moraes');
INSERT INTO Artist (ArtistId, Name) VALUES (73, 'Vinícius E Qurteto Em Cy');
INSERT INTO Artist (ArtistId, Name) VALUES (74, 'Vinícius E Odette Lara');
INSERT INTO Artist (ArtistId, Name) VALUES (75, 'Vinicius, Toquinho & Quarteto Em Cy');
INSERT INTO Artist (ArtistId, Name) VALUES (76, 'Creedence Clearwater Revival');
INSERT INTO Artist (ArtistId, Name) VALUES (77, 'Cássia Eller');
INSERT INTO Artist (ArtistId, Name) VALUES (78, 'Def Leppard');
INSERT INTO Artist (ArtistId, Name) VALUES (79, 'Dennis Chambers');
INSERT INTO Artist (ArtistId, Name) VALUES (80, 'Djavan');
INSERT INTO Artist (ArtistId, Name) VALUES (81, 'Eric Clapton');
INSERT INTO Artist (ArtistId, Name) VALUES (82, 'Faith No More');
INSERT INTO Artist (ArtistId, Name) VALUES (83, 'Falamansa');
INSERT INTO Artist (ArtistId, Name) VALUES (84, 'Foo Fighters');
INSERT INTO Artist (ArtistId, Name) VALUES (85, 'Frank Sinatra');
INSERT INTO Artist (ArtistId, Name) VALUES (86, 'Funk Como Le Gusta');
INSERT INTO Artist (ArtistId, Name) VALUES (87, 'Godsmack');
INSERT INTO Artist (ArtistId, Name) VALUES (88, 'Guns Roses');
INSERT INTO Artist (ArtistId, Name) VALUES (89, 'Incognito');
INSERT INTO Artist (ArtistId, Name) VALUES (90, 'Iron Maiden');
INSERT INTO Artist (ArtistId, Name) VALUES (91, 'James Brown');
INSERT INTO Artist (ArtistId, Name) VALUES (92, 'Jamiroquai');
INSERT INTO Artist (ArtistId, Name) VALUES (93, 'JET');
INSERT INTO Artist (ArtistId, Name) VALUES (94, 'Jimi Hendrix');
INSERT INTO Artist (ArtistId, Name) VALUES (95, 'Joe Satriani');
INSERT INTO Artist (ArtistId, Name) VALUES (96, 'Jota Quest');
INSERT INTO Artist (ArtistId, Name) VALUES (97, 'João Suplicy');
INSERT INTO Artist (ArtistId, Name) VALUES (98, 'Judas Priest');
INSERT INTO Artist (ArtistId, Name) VALUES (99, 'Legião Urbana');
INSERT INTO Artist (ArtistId, Name) VALUES (100, 'Lenny Kravitz');


INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (1, 'For Those About To Rock We Salute You', 1);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (2, 'Balls to the Wall', 2);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (3, 'Restless and Wild', 2);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (4, 'Let There Be Rock', 1);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (5, 'Big Ones', 3);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (6, 'Jagged Little Pill', 4);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (7, 'Facelift', 5);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (8, 'Warner 25 Anos', 6);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (9, 'Plays Metallica By Four Cellos', 7);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (10, 'Audioslave', 8);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (11, 'Out Of Exile', 8);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (12, 'BackBeat Soundtrack', 9);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (13, 'The Best Of Billy Cobham', 10);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (14, 'Alcohol Fueled Brewtality Live! [Disc 1]', 11);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (15, 'Alcohol Fueled Brewtality Live! [Disc 2]', 11);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (16, 'Black Sabbath', 12);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (17, 'Black Sabbath Vol. 4 (Remaster)', 12);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (18, 'Body Count', 13);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (19, 'Chemical Wedding', 14);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (20, 'The Best Of Buddy Guy - The Millenium Collection', 15);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (21, 'Prenda Minha', 16);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (22, 'Sozinho Remix Ao Vivo', 16);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (23, 'Minha Historia', 17);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (24, 'Afrociberdelia', 18);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (25, 'Da Lama Ao Caos', 18);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (26, 'Acústico MTV [Live]', 19);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (27, 'Cidade Negra - Hits', 19);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (28, 'Na Pista', 20);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (29, 'Axé Bahia 2001', 21);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (30, 'BBC Sessions [Disc 1] [Live]', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (31, 'Bongo Fury', 23);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (32, 'Carnaval 2001', 21);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (33, 'Chill: Brazil (Disc 1)', 24);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (34, 'Chill: Brazil (Disc 2)', 6);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (35, 'Garage Inc. (Disc 1)', 50);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (36, 'Greatest Hits II', 51);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (37, 'Greatest Kiss', 52);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (38, 'Heart of the Night', 53);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (39, 'International Superhits', 54);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (40, 'Into The Light', 55);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (41, 'Meus Momentos', 56);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (42, 'Minha História', 57);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (43, 'MK III The Final Concerts [Disc 1]', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (44, 'Physical Graffiti [Disc 1]', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (45, 'Sambas De Enredo 2001', 21);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (46, 'Supernatural', 59);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (47, 'The Best of Ed Motta', 37);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (48, 'The Essential Miles Davis [Disc 1]', 68);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (49, 'The Essential Miles Davis [Disc 2]', 68);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (50, 'The Final Concerts (Disc 2)', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (51, 'Up An Atom', 69);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (52, 'Vinícius De Moraes - Sem Limite', 70);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (53, 'Vozes do MPB', 21);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (54, 'Chronicle, Vol. 1', 76);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (55, 'Chronicle, Vol. 2', 76);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (56, 'Cássia Eller - Coleção Sem Limite [Disc 2]', 77);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (57, 'Cássia Eller - Sem Limite [Disc 1]', 77);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (58, 'Come Taste The Band', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (59, 'Deep Purple In Rock', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (60, 'Fireball', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (61, 'Knocking at Your Back Door: The Best Of Deep Purple in the 80s', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (62, 'Machine Head', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (63, 'Purpendicular', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (64, 'Slaves And Masters', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (65, 'Stormbringer', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (66, 'The Battle Rages On', 58);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (67, 'Vault: Def Leppards Greatest Hits', 78);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (68, 'Outbreak', 79);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (69, 'Djavan Ao Vivo - Vol. 02', 80);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (70, 'Djavan Ao Vivo - Vol. 1', 80);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (71, 'Elis Regina-Minha História', 41);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (72, 'The Cream Of Clapton', 81);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (73, 'Unplugged', 81);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (74, 'Album Of The Year', 82);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (75, 'Angel Dust', 82);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (76, 'King For A Day Fool For A Lifetime', 82);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (77, 'The Real Thing', 82);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (78, 'Deixa Entrar', 83);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (79, 'In Your Honor [Disc 1]', 84);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (80, 'In Your Honor [Disc 2]', 84);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (81, 'One By One', 84);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (82, 'The Colour And The Shape', 84);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (83, 'My Way: The Best Of Frank Sinatra [Disc 1]', 85);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (84, 'Roda De Funk', 86);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (85, 'As Canções de Eu Tu Eles', 27);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (86, 'Quanta Gente Veio Ver (Live)', 27);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (87, 'Quanta Gente Veio ver--Bônus De Carnaval', 27);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (88, 'Faceless', 87);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (89, 'American Idiot', 54);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (90, 'Appetite for Destruction', 88);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (91, 'Use Your Illusion I', 88);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (92, 'Use Your Illusion II', 88);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (93, 'Blue Moods', 89);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (94, 'A Matter of Life and Death', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (95, 'A Real Dead One', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (96, 'A Real Live One', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (97, 'Brave New World', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (98, 'Dance Of Death', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (99, 'Fear Of The Dark', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (100, 'Iron Maiden', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (101, 'Killers', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (102, 'Live After Death', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (103, 'Live At Donington 1992 (Disc 1)', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (104, 'Live At Donington 1992 (Disc 2)', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (105, 'No Prayer For The Dying', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (106, 'Piece Of Mind', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (107, 'Powerslave', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (108, 'Rock In Rio [CD1]', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (109, 'Rock In Rio [CD2]', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (110, 'Seventh Son of a Seventh Son', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (111, 'Somewhere in Time', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (112, 'The Number of The Beast', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (113, 'The X Factor', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (114, 'Virtual XI', 90);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (115, 'Sex Machine', 91);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (116, 'Emergency On Planet Earth', 92);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (117, 'Synkronized', 92);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (118, 'The Return Of The Space Cowboy', 92);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (119, 'Get Born', 93);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (120, 'Are You Experienced?', 94);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (121, 'Surfing with the Alien (Remastered)', 95);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (122, 'Jorge Ben Jor 25 Anos', 46);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (123, 'Jota Quest-1995', 96);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (124, 'Cafezinho', 97);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (125, 'Living After Midnight', 98);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (126, 'Unplugged [Live]', 52);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (127, 'BBC Sessions [Disc 2] [Live]', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (128, 'Coda', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (129, 'Houses Of The Holy', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (130, 'In Through The Out Door', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (131, 'IV', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (132, 'Led Zeppelin I', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (133, 'Led Zeppelin II', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (134, 'Led Zeppelin III', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (135, 'Physical Graffiti [Disc 2]', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (136, 'Presence', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (137, 'The Song Remains The Same (Disc 1)', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (138, 'The Song Remains The Same (Disc 2)', 22);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (139, 'A TempestadeTempestade Ou O Livro Dos Dias', 99);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (140, 'Mais Do Mesmo', 99);
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES (141, 'Greatest Hits', 100);



INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (3, 'Fast As a Shark', 3, 2, 1, 'F. Baltes, S. Kaufman', 230619, 3990994, 0.99);

INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (4, 'Restless and Wild', 3, 2, 1, 'F. Baltes, R.A. Smith-Diesel',2051, 4331779, 0.99);


INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (5, 'Princess of the Dawn', 3, 2, 1, 'Deaffy & R.A. Smith-Diesel', 375418, 6290521, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (6, 'Put The Finger On You', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 205662, 6713451, 0.99);


INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (7, 'Lets Get It Up', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 233926, 7636561, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (8, 'Inject The Venom', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 210834, 6852860, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (9, 'Snowballed', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 203102, 6599424, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (10, 'Evil Walks', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 263497, 8611245, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (11, 'C.O.D.', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 199836, 6566314, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (12, 'Breaking The Rules', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 263288, 8596840, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (13, 'Night Of The Long Knives', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 205688, 6706347, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (14, 'Spellbound', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 270863, 8817038, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (15, 'Go Down', 4, 1, 1, 'AC/DC', 331180, 10847611, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (16, 'Dog Eat Dog', 4, 1, 1, 'AC/DC', 215196, 7032162, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (17, 'Let There Be Rock', 4, 1, 1, 'AC/DC', 366654, 12021261, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (18, 'Bad Boy Boogie', 4, 1, 1, 'AC/DC', 267728, 8776140, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (19, 'Problem Child', 4, 1, 1, 'AC/DC', 325041, 10617116, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (20, 'Overdose', 4, 1, 1, 'AC/DC', 369319, 12066294, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (21, 'Hell Aint A Bad Place To Be', 4, 1, 1, 'AC/DC', 254380, 8331286, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (22, 'Whole Lotta Rosie', 4, 1, 1, 'AC/DC', 323761, 10547154, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (23, 'Walk On Water', 5, 1, 1, 'Steven Tyler, Joe Perry, Jack Blades, Tommy Shaw', 295680, 9719579, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (24, 'Love In An Elevator', 5, 1, 1, 'Steven Tyler, Joe Perry', 321828, 10552051, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (25, 'Rag Doll', 5, 1, 1, 'Steven Tyler, Joe Perry, Jim Vallance, Holly Knight', 264698, 8675345, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (26, 'What It Takes', 5, 1, 1, 'Steven Tyler, Joe Perry, Desmond Child', 310622, 10144730, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (27, 'Dude (Looks Like A Lady)', 5, 1, 1, 'Steven Tyler, Joe Perry, Desmond Child', 264855, 8679940, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (28, 'Janies Got A Gun', 5, 1, 1, 'Steven Tyler, Tom Hamilton', 330736, 10869391, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (29, 'Cryin', 5, 1, 1, 'Steven Tyler, Joe Perry, Taylor Rhodes', 309263, 10056995, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (30, 'Amazing', 5, 1, 1, 'Steven Tyler, Richie Supa', 356519, 11616195, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (31, 'Blind Man', 5, 1, 1, 'Steven Tyler, Joe Perry, Taylor Rhodes', 240718, 7877453, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (32, 'Deuces Are Wild', 5, 1, 1, 'Steven Tyler, Jim Vallance', 215875, 7074167, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (33, 'The Other Side', 5, 1, 1, 'Steven Tyler, Jim Vallance', 244375, 7983270, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (34, 'Crazy', 5, 1, 1, 'Steven Tyler, Joe Perry, Desmond Child', 316656, 10402398, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (35, 'Eat The Rich', 5, 1, 1, 'Steven Tyler, Joe Perry, Jim Vallance', 251036, 8262039, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (36, 'Angel', 5, 1, 1, 'Steven Tyler, Desmond Child', 307617, 9989331, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (37, 'LivinOn The Edge', 5, 1, 1, 'Steven Tyler, Joe Perry, Mark Hudson', 381231, 12374569, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (38, 'All I Really Want', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 284891, 9375567, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (39, 'You Oughta Know', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 249234, 8196916, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (40, 'Perfect', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 188133, 6145404, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (41, 'Hand In My Pocket', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 221570, 7224246, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (42, 'Right Through You', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 176117, 5793082, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (43, 'Forgiven', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 300355, 9753256, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (44, 'You Learn', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 239699, 7824837, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (45, 'Head Over Feet', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 267493, 8758008, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (46, 'Mary Jane', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 280607, 9163588, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (47, 'Ironic', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 229825, 7598866, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (48, 'Not The Doctor', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 227631, 7604601, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (49, 'Wake Up', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 293485, 9703359, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (50, 'You Oughta Know (Alternate)', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 491885, 16008629, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (51, 'We Die Young', 7, 1, 1, 'Jerry Cantrell', 152084, 4925362, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (52, 'Man In The Box', 7, 1, 1, 'Jerry Cantrell, Layne Staley', 286641, 9310272, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (53, 'Sea Of Sorrow', 7, 1, 1, 'Jerry Cantrell', 349831, 11316328, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (54, 'Bleed The Freak', 7, 1, 1, 'Jerry Cantrell', 241946, 7847716, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (55, 'I Cant Remember', 7, 1, 1, 'Jerry Cantrell, Layne Staley', 222955, 7302550, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (56, 'Love, Hate, Love', 7, 1, 1, 'Jerry Cantrell, Layne Staley', 387134, 12575396, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (57, 'It Aint Like That', 7, 1, 1, 'Jerry Cantrell, Michael Starr, Sean Kinney', 277577, 8993793, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (58, 'Sunshine', 7, 1, 1, 'Jerry Cantrell', 284969, 9216057, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (59, 'Put You Down', 7, 1, 1, 'Jerry Cantrell', 196231, 6420530, 0.99);
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES (60, 'Confusion', 7, 1, 1, 'Jerry Cantrell, Michael Starr, Layne Staley', 344163, 11183647, 0.99);


INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (2, 'Edwards', 'Nancy', 'Sales Manager', 1, '1958/12/8', '2002/5/1', '825 8 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 2T3', '+1 (403) 262-3443', '+1 (403) 262-3322', 'nancy@chinookcorp.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (3, 'Peacock', 'Jane', 'Sales Support Agent', 2, '1973/8/29', '2002/4/1', '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5M5', '+1 (403) 262-3443', '+1 (403) 262-6712', 'jane@chinookcorp.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (4, 'Park', 'Margaret', 'Sales Support Agent', 2, '1947/9/19', '2003/5/3', '683 10 Street SW', 'Calgary', 'AB', 'Canada', 'T2P 5G3', '+1 (403) 263-4423', '+1 (403) 263-4289', 'margaret@chinookcorp.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (5, 'Johnson', 'Steve', 'Sales Support Agent', 2, '1965/3/3', '2003/10/17', '7727B 41 Ave', 'Calgary', 'AB', 'Canada', 'T3B 1Y7', '1 (780) 836-9987', '1 (780) 836-9543', 'steve@chinookcorp.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (6, 'Mitchell', 'Michael', 'IT Manager', 1, '1973/7/1', '2003/10/17', '5827 Bowness Road NW', 'Calgary', 'AB', 'Canada', 'T3B 0C5', '+1 (403) 246-9887', '+1 (403) 246-9899', 'michael@chinookcorp.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (7, 'King', 'Robert', 'IT Staff', 6, '1970/5/29', '2004/1/2', '590 Columbia Boulevard West', 'Lethbridge', 'AB', 'Canada', 'T1K 5N8', '+1 (403) 456-9986', '+1 (403) 456-8485', 'robert@chinookcorp.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (8, 'Callahan', 'Laura', 'IT Staff', 6, '1968/1/9', '2004/3/4', '923 7 ST NW', 'Lethbridge', 'AB', 'Canada', 'T1H 1Y8', '+1 (403) 467-3351', '+1 (403) 467-8772', 'laura@chinookcorp.com');

INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (1, 'Luis', 'Goncalves', 'Embraer - Empresa Brasileira de Aeronautica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'Sao José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3);



INSERT INTO Playlist (PlaylistId, Name) VALUES (1, 'Music');
INSERT INTO Playlist (PlaylistId, Name) VALUES (2, 'Movies');
INSERT INTO Playlist (PlaylistId, Name) VALUES (3, 'TV Shows');
INSERT INTO Playlist (PlaylistId, Name) VALUES (4, 'Audiobooks');
INSERT INTO Playlist (PlaylistId, Name) VALUES (5, '90s Music');
INSERT INTO Playlist (PlaylistId, Name) VALUES (6, 'Audiobooks');
INSERT INTO Playlist (PlaylistId, Name) VALUES (7, 'Movies');
INSERT INTO Playlist (PlaylistId, Name) VALUES (8, 'Music');
INSERT INTO Playlist (PlaylistId, Name) VALUES (9, 'Music Videos');
INSERT INTO Playlist (PlaylistId, Name) VALUES (10, 'TV Shows');
INSERT INTO Playlist (PlaylistId, Name) VALUES (11, 'Brazilian Music');
INSERT INTO Playlist (PlaylistId, Name) VALUES (12, 'Classical');
INSERT INTO Playlist (PlaylistId, Name) VALUES (13, 'Classical 101 - Deep Cuts');
INSERT INTO Playlist (PlaylistId, Name) VALUES (14, 'Classical 101 - Next Steps');
INSERT INTO Playlist (PlaylistId, Name) VALUES (15, 'Classical 101 - The Basics');
INSERT INTO Playlist (PlaylistId, Name) VALUES (16, 'Grunge');
INSERT INTO Playlist (PlaylistId, Name) VALUES (17, 'Heavy Metal Classic');
INSERT INTO Playlist (PlaylistId, Name) VALUES (18, 'On-The-Go 1');

INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (1, 99);

INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 51);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 52);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 53);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 54);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 55);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 56);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 57);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 58);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 59);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 60);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 61);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 62);

INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 23);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 24);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 25);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 26);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 27);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 28);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 29);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 30);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 31);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 32);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 33);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 34);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 35);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 36);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 37);

INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 3);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 4);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 5);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 38);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 39);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 40);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 41);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 42);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 43);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 44);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (9, 45);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 46);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 47);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 48);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (12, 49);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 50);


INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 1);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (18, 6);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 7);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (18, 8);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 9);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 10);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 11);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (18, 12);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 13);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (18, 14);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 15);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 16);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (10, 17);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 18);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (11, 19);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 20);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 21);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (12, 22);

INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 2);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 3);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (16, 4);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 5);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (15, 23);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 24);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (2, 25);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 26);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (18, 27);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (18, 28);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (18, 29);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (18, 30);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (18, 31);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 32);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 33);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 34);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 35);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 36);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 37);

INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 38);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 39);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 40);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 41);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 42);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (5, 43);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (6, 44);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (7, 45);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 46);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 47);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 48);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (8, 49);
INSERT INTO PlaylistTrack (PlaylistId, TrackId) VALUES (3, 50);



INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES (1, 12, '2009/5/23', 'Praça Pio X, 119', 'Rio de Janeiro', 'RJ', 'Brazil', '20040-020', 0.99);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES (2, 13, '2009/6/5', 'Qe 7 Bloco G', 'Brasília', 'DF', 'Brazil', '71020-677', 1.98);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES (3, 15, '2009/6/5', '700 W Pender Street', 'Vancouver', 'BC', 'Canada', 'V6C 1G8', 1.98);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES (4, 17, '2009/6/6', '1 Microsoft Way', 'Redmond', 'WA', 'USA', '98052-8300', 3.96);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES (5, 21, '2009/6/7', '801 W 4th Street', 'Reno', 'NV', 'USA', '89503', 5.94);
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES (6, 27, '2009/6/10', '1033 N Park Ave', 'Tucson', 'AZ', 'USA', '85719', 8.91);



INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (1, 1, 2, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (2, 1, 4, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (3, 2, 6, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (4, 2, 8, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (5, 2, 10, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (6, 2, 12, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (7, 3, 16, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (8, 3, 20, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (9, 3, 24, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (10, 3, 28, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (11, 3, 32, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (12, 3, 36, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (13, 4, 42, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (14, 4, 48, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (15, 4, 54, 0.99, 1);
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES (16, 4, 60, 0.99, 1);
