CREATE TABLE People(
  PersonID char(8) not null unique,
  FirstName text not null,
  LastName text not null,
  StreetAddress text not null,
  ZipCode integer not null,

  primary key (PersonId)
);

CREATE TABLE Trainers(
  TrainerID char(8) not null unique,
  PersonID char(8) not null unique,
  primary key (TrainerId, PersonID),
  foreign key (PersonId) references people(PersonID)
);


CREATE Table Breeds(
    BreedID char(8) not null unique,
    Name text,
    primary key (BreedId)
);


CREATE TABLE Breeders(
BreederID char(8) not null unique,
PersonID char(8) not null unique,
primary key (BreederID, PersonID),
foreign key(PersonId) references people(PersonID)
);

CREATE TABLE Customers(
  CustomerID char(8) not null unique,
  PersonID char(8) not null unique,
  primary key (CustomerID, PersonID),
  foreign key (PersonID) references people(PersonID)
);

CREATE TABLE Dogs(
  DogID char(8) not null unique,
  name text not null,
  BreederID char(8),
  BreedID char(8) not null,
  TrainerID char(8),
  DOB date,
  WeightLBS int,
  gender text check (gender in ('MALE', 'FEMALE')),
  ForSale text check (ForSale in ('SOLD', 'FALSE', 'TRUE')),
  primary key (DogID),
  foreign key (BreederID) references Breeders(BreederID),
  foreign key (BreedID) references Breeds(BreedID),
  foreign key (TrainerID) references Trainers (TrainerID)
);

  CREATE TABLE AdultDogs(
    AdultDogID char(8) not null unique,
    DogID char(8) not null,
    primary key (AdultDogID, DogID),
    foreign key (DogID) references Dogs(DogId)
  );

  CREATE TABLE Puppies(
    PuppyID char(8) not null unique,
    DogID char(8) not null,
    primary key (PuppyID, DogID),
    foreign key (DogID) references Dogs(DogId)
  );




CREATE TABLE Purchases(
  PurchaseID   char(8) not null,
  CustomerID   char(8) not null,
  DogID        char(8) not null,
  PriceUSD      integer,
  PurchaseDate  date,
  primary key (PurchaseID),
  foreign key (CustomerID) references Customers(CustomerID),
  foreign key (DogID) references Dogs(DogId)
);


CREATE TABLE StudPurchases(
    StudPurchaseID char(8) not null unique,
    PurchaseID     char(8) not null,
    primary key (StudPurchaseID, PurchaseID),
    foreign key (PurchaseID) references Purchases (PurchaseID)
);

CREATE TABLE DogPurchases(
    DogPurchaseID char(8) not null unique,
    PurchaseID      char(8) not null,
    primary key (DogPurchaseID, PurchaseID),
    foreign key (PurchaseID) references Purchases (PurchaseID)
);
CREATE TABLE Shots(
  ShotID  char(8) not null unique,
  name text,
  primary key (ShotID)
);

CREATE TABLE DogShots(
  DogShotID char(8) not null unique,
  ShotID char(8) not null,
  DogID char(8) not null,
  ShotDate date,
  primary key (DogShotID, ShotID),
  foreign key (ShotID) references Shots (ShotID),
  foreign key (DogID) references Dogs (DogID)
);

INSERT INTO PEOPLE (PersonID, FirstName, LastName, StreetAddress, ZipCode, Number) VALUES
('P0000001', 'Byron', 'Hardaway', '123 Cherry Block', 104422), ('P0000002', 'Gary', 'Coltrane', '456 Ave', 902232), ('P0000003', 'Bryant', 'Hardaway', '1800 Street', 949302), ('P0000004', 'Bryce', 'Hardaway', '123 Block Street', 019221),('P0000005', 'Abdul', 'Jones', '777 Ali Place', 29932),
('P0000006', 'Sharif', 'Jawara', '176 Sheridan Avenue', 292902),
('P0000007', 'Amar', 'Mourning', '63 Clarence Street', 22012), ('P0000008', 'Muhammad', 'Shaban', '1911 E 125th Street', 291012),('P0000009', 'Peewee', 'Slapper', '573 No Road',10203), ('P0000010', 'Tyshawn', 'Carter', '424 Key Street', 99102), ('P0000011', 'Jay', 'Perez', '023 Octave Road', 33022),
('P0000012', 'David', 'Muhammad', '1955 Roady Rock Place', 19201), ('P0000013', 'Mary', 'Luigiano', '671 Vinban Street', 50229), ('P0000014', 'Yusuf', 'Abdullah', '023 Oak Lane', 29102), ('P0000015', 'Abraham', 'Jones', '892 Highway Block', 29292), ('P0000016', 'Jermaine', 'Johnson', '023 New Place', 290102),
 ('P0000017', 'Ana', 'Martinez', '282 Dyckman Street', 20212), ('P0000018', 'Khadijah', 'Rahman', '28 Newman Street', 92012), ('P0000019', 'Clara', 'Smith', '2920 Rockland Avenue', 19201), ('P0000020', 'Betty', 'Fields', '920 Dutchess Lane', 2932),('P0000021', 'Jacky', 'Chin', '892 Putnam Road', 10321),
 ('P0000022', 'Omar', 'Suarez', '1955 Montana Street', 39202), ('P0000023', 'Mitch', 'Rico', '2001 Ace Block', 20121),
('P0000024', 'Akbar', 'Williams', '19 Jabbar Street', 82012), ('P0000025', 'Kareem', 'Lawson', '7811 North End', 2201), ('P0000026', 'Tyrone', 'Berkley', '282 E Gartland St', 20302),('P0000027', 'Trey', 'Cummings', '14 Westchester Road', 20122);
INSERT INTO TRAINERS (TrainerID, PersonID) VALUES
('T0000001', 'P0000001'), ('T0000002', 'P0000003'), ('T0000003', 'P0000005'), ('T0000004', 'P0000008'), ('T0000005', 'P0000012'), ('T0000006', 'P0000014'),('T0000007', 'P0000027');

Insert into Breeders (BreederID, PersonID) VALUES
('B0000001', 'P0000001'), ('B0000002', 'P0000003'), ('B0000003', 'P0000002'), ('B0000004', 'P0000004'), ('B0000005', 'P0000005'), ('B0000006', 'P0000025'),('B0000007', 'P0000026');

INSERT INTO Customers(CustomerID, PersonID ) VALUES
('C0000001', 'P0000007'),('C0000002', 'P0000009'),('C0000003','P0000010'), ('C0000004','P0000011'),('C0000005','P0000013'),('C0000006','P0000015'),
('C0000007','P0000016'),('C0000008','P0000017'),('C0000009','P0000018'),('C0000010','P0000019'),('C0000011','P0000020'),('C0000012','P0000021'),
('C0000013','P0000022'),('C0000014','P0000023'),('C0000015','P0000024');

INSERT INTO Breeds (BreedID, name) VALUES
('BR000001', 'Bull Terrier'),('BR000002', 'American Bully'),('BR000003', 'Pitbull'), ('BR000004', 'English Bulldog');

INSERT INTO Dogs(DogID, name, BreederID, BreedID, TrainerID, DOB, WeightLBS, gender, forsale )
VALUES ('D0000001', 'Bronx', 'B0000001', 'BR000002', 'T0000001', '2012-10-13', 50, 'MALE', 'FALSE'), ('D0000002', 'Chrome', 'B0000001', 'BR000002', 'T0000001','2015-09-03' ,  68, 'MALE', 'FALSE'),
('D0000003', 'Snatch', 'B0000001', 'BR000001', 'T0000001','2012-05-12' ,70, 'MALE', 'FALSE'), ('D0000004', 'Gucci', 'B0000001', 'BR000001', 'T0000001','2015-10-15', 50, 'MALE', 'FALSE'),
('D0000005', 'Prada', 'B0000001', 'BR000001', 'T0000001', '2011-10-18' , 80, 'MALE', 'FALSE'), ('D0000006', 'Sandy', 'B0000002', 'BR000003', 'T0000002','2015-02-20', 100, 'MALE', 'FALSE'),
('D0000007', 'Danger', 'B0000003', 'BR000003', 'T0000001','2013-10-05' ,62, 'MALE', 'FALSE'), ('D0000008', 'Chanel', 'B0000003', 'BR000003', 'T0000004','2017-03-19',  20, 'FEMALE', 'TRUE'),
('D0000009', 'Banga', 'B0000004', 'BR000001', 'T0000002','2015-05-15', 59, 'FEMALE', 'SOLD'),('D0000010', 'Nino', 'B0000005', 'BR000004', 'T0000002','2017-03-19',  33, 'MALE', 'FALSE'),
('D0000011', 'Bow Leg Lou', 'B0000002', 'BR000004', 'T0000005','2012-05-19', 58, 'FEMALE', 'FALSE'),('D0000012', 'Kurt', 'B0000004', 'BR000004', 'T0000006', '2015-01-15',  45, 'MALE', 'FALSE'),
('D0000013', 'AK', 'B0000004', 'BR000002', 'T0000003','2013-02-12', 63, 'MALE', 'FALSE'),('D0000014', 'Yaya', 'B0000001', 'BR000002', 'T0000005','2015-11-12',  70, 'FEMALE', 'FALSE'),
('D0000015', 'Richie', 'B0000001', 'BR000001', 'T0000001','2017-01-10', 30, 'MALE', 'FALSE'),('D0000016', 'Nina', 'B0000003', 'BR000003', 'T0000001','2017-03-12',  26, 'FEMALE', 'TRUE'),
('D0000017', 'Robbie', 'B0000004', 'BR000004', 'T0000002','2017-01-10', 20, 'MALE', 'TRUE'),('D0000018', 'Ruv', 'B0000004', 'BR000003', 'T0000004','2014-12-12',   54, 'MALE', 'TRUE');


INSERT INTO Dogs(DogID, name, BreederID, BreedID, TrainerID, DOB, WeightLBS, gender, forsale )
VALUES
('D0000019', 'Ace', 'B0000004', 'BR000002', 'T0000001', '2014-11-11',  53, 'MALE', 'FALSE');
INSERT INTO Puppies(PuppyID, DogID)
VALUES
('PP000001', 'D0000008'), ('PP000002', 'D0000010'), ('PP000003', 'D0000015'), ('PP000004', 'D0000016'),('PP000005', 'D0000017');

INSERT INTO AdultDogs(AdultDogID, DogID)
VALUES
('AD000001','D0000001'), ('AD000002','D0000002'),('AD000003','D0000003'),('AD000004','D0000004'),('AD000005','D0000005'),('AD000006','D0000006'),('AD000007','D0000007'),
('AD000008','D0000009'),('AD000009','D0000011'),('AD000010','D0000012'),('AD000011','D0000013'),('AD000012','D0000014'),('AD000013','D0000018');


INSERT INTO PURCHASES(PurchaseID,CustomerID, DogID, PriceUSD, PurchaseDate) VALUES
('PU000001','C0000001','D0000009', 1000.00, '2017-04-15'),('PU000002','C0000002','D0000001', 1200.00, '2017-04-29'),
('PU000003','C0000003','D0000003', 950.00, '2017-04-14'),('PU000004','C0000004','D0000007', 990.00, '2017-04-28'),
('PU000005','C0000004','D0000011', 1000.00, '2017-04-13'),('PU000006','C0000005','D0000008', 820.00, '2017-04-27'),
('PU000007','C0000006','D0000018', 730.00, '2017-04-12'),('PU000008','C0000007','D0000015', 730.00, '2017-04-26'),
('PU000009','C0000008','D0000016', 550.00, '2017-04-11'),('PU000010','C0000009','D0000017', 780.00, '2017-04-25'),
('PU000011','C0000010','D0000002', 1000.00, '2017-04-10'),('PU000012','C0000011','D0000013', 400.00, '2017-04-24'),
('PU000013','C0000012','D0000001', 1500.00, '2017-04-09'),('PU000014','C0000013','D0000012', 725.00, '2017-04-23'),
('PU000015','C0000014','D0000018', 550.00, '2017-04-08'),('PU000016','C0000015','D0000001', 990.00, '2017-04-23');


INSERT INTO StudPurchases(StudPurchaseID, PurchaseID) VALUES
('SP000001', 'PU000002'),('SP000002', 'PU000013'),('SP000003', 'PU000016'),('SP000004', 'PU000012'), ('SP000005','PU000007'), ('SP000006', 'PU000015'),
('SP000007','PU000003'),('SP000008', 'PU000004'), ('SP000009', 'PU000012');



INSERT INTO DogPurchases(DogPurchaseID, PurchaseID ) VALUES
('DP000001','PU000005'), ('DP000002','PU000014'), ('DP000003','PU000005'), ('DP000004','PU000008'), ('DP000005','PU000009'),
('DP000006','PU000010');

INSERT INTO SHOTS(ShotID, Name) VALUES
('S0000001', 'Rabies'),('S0000002', 'Lyme'),('S0000003', 'Bordetella'),('S0000004', 'Giardia');

INSERT INTO DOGSHOTS(DogShotId, ShotID, DogID, ShotDate) VALUES
('DS000001', 'S0000001', 'D0000001', now()), ('DS000002', 'S0000003', 'D0000004', '2016-12-19'), ('DS000003', 'S0000004', 'D0000003', '2015-12-12'), ('DS000004', 'S0000001', 'D0000001', '2017-04-05'),
('DS000005', 'S0000002', 'D0000001', now()),('DS000006', 'S0000002', 'D0000011', '2016-03-05');




-- STORED PROCEDURES

CREATE OR REPLACE FUNCTION get_breeders_dogs (char(8), REFCURSOR) returns refcursor as
$$
 DECLARE
   breeder_ID   char(8)     := $1;
   results     REFCURSOR   := $2;
 BEGIN
     OPEN results for
     SELECT dogs.dogid, dogs.name from people  inner join breeders on people.personid = breeders.personid
     inner join dogs on dogs.breederid= breeders.breederid
     where breeders.breederid = breeder_ID;
 return results;
end;
 $$
language plpgsql;

CREATE OR REPLACE FUNCTION get_dog_shots (char(8), REFCURSOR) returns refcursor as
$$
 DECLARE
   DoggyID   char(8)     := $1;
   results     REFCURSOR   := $2;
 BEGIN
     OPEN results for
     select shots.name as ShotName, dogshots.shotdate from shots inner join dogshots on shots.shotid = dogshots.shotid
     where dogshots.dogid = DoggyID;
 return results;
end;
 $$
language plpgsql;


CREATE OR REPLACE FUNCTION getPuppyAge(char(8))
returns interval as
$$
DECLARE
pupID char(8) := $1;
birthday date := (select dogs.dob from dogs inner join puppies on dogs.dogid = puppies.dogid where puppies.PUPPYid = PupID);
BEGIN
return age(birthday);
end;
 $$
 language plpgsql;;


 CREATE OR REPLACE FUNCTION setDogAsSold()
 returns trigger as $$
 BEGIN
   if new.dogid is not null then
     update dogs
       set ForSale = 'SOLD'
       where dogs.dogid = New.dogid and dogs.forsale = ‘TRUE’;
   end if;
   return new;
 end;
 $$ language plpgsql;

-- TRIGGER
Create Trigger soldDog
after INSERT on Purchases
for each row
execute procedure setDogAsSold();



--REPORTS



SELECT  dogs.name, purchases.priceusd from dogs
 inner join purchases on purchases.dogid = dogs.dogid
inner join dogpurchases on purchases.purchaseid = dogpurchases.purchaseid
where purchases.priceusd > 	(SELECT AVG(purchases.priceusd) from purchases) group by dogs.name, purchases.priceusd;



SELECT people, people.firstname, people.lastname, purchases.priceusd from people inner join Trainers
  on trainers.personid = people.Personid inner join dogs
  on dogs.trainerid = trainers.trainerid
  inner join purchases on purchases.dogid = dogs.dogid inner join studpurchases on
  purchases.purchaseid = studpurchases.PurchaseID
  where purchases.priceusd = (select max(priceusd) from purchases);





-- VIEWS


CREATE VIEW AvailablePuppiesForSale  AS
SELECT name, weightlbs, gender from dogs inner join puppies on dogs.dogid = puppies.dogid
WHERE dogs.forsale = 'TRUE';


CREATE VIEW  DatedShots AS
select dogs.dogid, dogs.name as DogName, shots.name as ShotName, dogshots.shotdate as OutDatedShot from dogs
inner join dogshots on dogshots.dogid = dogs.dogid
inner join shots on dogshots.shotid = shots.shotid
where  DATE_PART('year', dogshots.shotdate)  = '2017' group by dogs.dogid, dogshots.shotdate, shots.name;

--SECURITY


CREATE ROLE ADMIN;
GRANT ALL ON ALL TABLES IN SCHEMA PUBLIC TO ADMIN;

CREATE ROLE TRAINER;
GRANT SELECT, INSERT, UPDATE, DELETE on dogs, puppies, adultdogs  TO TRAINER;

CREATE ROLE Breeder;

GRANT SELECT, INSERT , UPDATE, DELETE ON customers, dogs, puppies, adultdogs, purchases, dogpurchases, studpurchases, breeds, shots, dogshots TO Breeder;
