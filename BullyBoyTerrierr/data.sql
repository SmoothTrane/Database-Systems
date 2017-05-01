CREATE table People(
PersonID char(8) not null unique,
name text not null,
primary key (PersonId)
);


CREATE TABLE Trainers(
  TrainerID char(8) not null unique,
  PersonID char(8) not null unique,
  primary key (TrainerId),
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
primary key (BreederID),
foreign key(PersonId) references people(PersonID)
);


CREATE TABLE Customers(
  CustomerID char(8) not null unique,
  PersonID char(8) not null unique,
  primary key (CustomerID),
  foreign key (PersonID) references people(PersonID)
);

CREATE TABLE Dogs(
  DogID char(8) not null unique,
  name text not null,
  BreederID char(8),
  BreedID char(8) not null,
  TrainerID char(8),
  DOB date,
  MotherID char(8),
  FatherID char(8),
  WeightLBS int,
  gender text check (gender in ('MALE', 'FEMALE')),
  ForSale text check (ForSale in ('SOLD', 'FALSE', 'TRUE')),
  primary key (DogID),
  foreign key (BreederID) references Breeders(BreederID),
  foreign key (MotherID) references Dogs(DogID),
  foreign key (BreedID) references Breeds(BreedID)

);

  CREATE TABLE AdultDogs(
    AdultDogID char(8) not null unique,
    DogID char(8) not null,
    primary key (AdultDogID),
    foreign key (DogID) references Dogs(DogId)
  );

  CREATE TABLE Puppies(
    PuppyID char(8) not null unique,
    DogID char(8) not null,
    primary key (PuppyID),
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
    primary key (StudPurchaseID),
    foreign key (PurchaseID) references Purchases (PurchaseID)
);

CREATE TABLE DogPurchases(
    DogPurchaseID char(8) not null unique,
    PurchaseID      char(8) not null,
    primary key (DogPurchaseID),
    foreign key (PurchaseID) references Purchases (PurchaseID)
);
Create table Shots(
  ShotID  char(8) not null unique,
  name text,
  primary key (ShotID)
);

Create table dogshots(
  DogShotID char(8) not null unique,
  ShotID char(8) not null,
  DogID char(8) not null,
  ShotDate date,
  primary key (DogShotID),
  foreign key (ShotID) references Shots (ShotID)
  foreign key (DogID) references Dogs (DogID);
);

INSERT INTO PEOPLE (PersonID, name) VALUES
('P0000001', 'Byron'), ('P0000002', 'Gary'), ('P0000003', 'Bryant'), ('P0000004', 'Bryce'),('P0000005', 'Abdul'), ('P0000006', 'Sharif'), ('P0000007', 'Amar'), ('P0000008', 'Muhammad'),('P0000009', 'Peewee'), ('P0000010', 'Tyshawn'), ('P0000011', 'Jay P'),
('P0000012', 'David'), ('P0000013', 'Mary'), ('P0000014', 'Yusuf'), ('P0000015', 'Abraham'), ('P0000016', 'Jermaine'), ('P0000017', 'Ana'), ('P0000018', 'Khadijah'), ('P0000019', 'Clara'), ('P0000020', 'Betty'),('P0000021', 'Jacky'), ('P0000022', 'Omar'), ('P0000023', 'Mitch'),
('P0000024', 'Akbar'), ('P0000025', 'Kareem'), ('P0000026', 'Tyrone'),('P0000027', 'Trey');
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

INSERT INTO Dogs(DogID, name, BreederID, BreedID, TrainerID, DOB, MotherID, FatherID, WeightLBS, gender, forsale )
VALUES ('D0000001', 'Bronx', 'B0000001', 'BR000002', 'T0000001', null ,null, null, 50, 'MALE', 'FALSE'), ('D0000002', 'Chrome', 'B0000001', 'BR000002', 'T0000001',null , 'D0000001', null, 68, 'MALE', 'FALSE'),
('D0000003', 'Snatch', 'B0000001', 'BR000001', 'T0000001',null ,null, null,70, 'MALE', 'FALSE'), ('D0000004', 'Gucci', 'B0000001', 'BR000001', 'T0000001',null,null, null, 50, 'MALE', 'FALSE'),
('D0000005', 'Prada', 'B0000001', 'BR000001', 'T0000001', null ,null, null, 80, 'MALE', 'FALSE'), ('D0000006', 'Sandy', 'B0000002', 'BR000003', 'T0000002',null,null, null, 100, 'MALE', 'FALSE'),
('D0000007', 'Danger', 'B0000003', 'BR000003', 'T0000001',null ,null, null, 62, 'MALE', 'FALSE'), ('D0000008', 'Chanel', 'B0000003', 'BR000003', 'T0000004',null,null, null, 20, 'FEMALE', 'TRUE'),
('D0000009', 'Banga', 'B0000004', 'BR000001', 'T0000002',null,null, null, 59, 'FEMALE', 'SOLD'),('D0000010', 'Nino', 'B0000005', 'BR000004', 'T0000002',null,null, null, 33, 'MALE', 'FALSE'),
('D0000011', 'Bow Leg Lou', 'B0000002', 'BR000004', 'T0000005',null,null, null, 58, 'FEMALE', 'FALSE'),('D0000012', 'Kurt', 'B0000004', 'BR000004', 'T0000006',null,null, null, 45, 'MALE', 'FALSE'),
('D0000013', 'AK', 'B0000004', 'BR000002', 'T0000003',null,null, null, 63, 'MALE', 'FALSE'),('D0000014', 'Yaya', 'B0000001', 'BR000002', 'T0000005',null,null, null, 70, 'FEMALE', 'FALSE'),
('D0000015', 'Richie', 'B0000001', 'BR000001', 'T0000001',null,null, null, 30, 'MALE', 'FALSE'),('D0000016', 'Nina', 'B0000003', 'BR000003', 'T0000001',null,null, null, 26, 'FEMALE', 'TRUE'),
('D0000017', 'Robbie', 'B0000004', 'BR000004', 'T0000002',null,null, null, 20, 'MALE', 'TRUE'),('D0000018', 'Ruv', 'B0000004', 'BR000003', 'T0000004',null,null, null,  54, 'MALE', 'TRUE');

INSERT INTO Puppies(PuppyID, DogID)
VALUES
('PP000001', 'D0000008'), ('PP000002', 'D0000010'), ('PP000003', 'D0000015'), ('PP000004', 'D0000016'),('PP000005', 'D0000017');

INSERT INTO AdultDogs(AdultDogID, DogID)
VALUES
('AD000001','D0000001'), ('AD000002','D0000002'),('AD000003','D0000003'),('AD000004','D0000004'),('AD000005','D0000005'),('AD000006','D0000006'),('AD000007','D0000007'),
('AD000008','D0000009'),('AD000009','D0000011'),('AD000010','D0000012'),('AD000011','D0000013'),('AD000012','D0000014'),('AD000013','D0000018');


INSERT INTO PURCHASES(PurchaseID,CustomerID, DogID, PriceUSD, PurchaseDate) VALUES
('PU000001','C0000001','D0000009', 1000.00, null),('PU000002','C0000002','D0000001', 1200.00, null),
('PU000003','C0000003','D0000003', 950.00, null),('PU000004','C0000004','D0000007', 990.00, null),
('PU000005','C0000004','D0000011', 1000.00, null),('PU000006','C0000005','D0000008', 820.00, null),
('PU000007','C0000006','D0000018', 730.00, null),('PU000008','C0000007','D0000015', 730.00, null),
('PU000009','C0000008','D0000016', 550.00, null),('PU000010','C0000009','D0000017', 780.00, null),
('PU000011','C0000010','D0000002', 1000.00, null),('PU000012','C0000011','D0000013', 400.00, null),
('PU000013','C0000012','D0000001', 1500.00, null),('PU000014','C0000013','D0000012', 725.00, null),
('PU000015','C0000014','D0000018', 550.00, null),('PU000016','C0000015','D0000001', 990.00, null);
-- ('PU000017','C0000016','D0000013', 400.00, null),('PU000018','C0000017','D0000009', 1000.00, null),
-- ('PU000019','C0000018','D0000009', 1000.00, null),('PU000020','C0000019','D0000009', 1000.00, null),
-- ('PU000021','C0000020','D0000009', 1000.00, null),('PU000022','C0000022','D0000009', 1000.00, null),
-- ('PU000023','C0000023','D0000009', 1000.00, null);

INSERT INTO StudPurchases(StudPurchaseID, PurchaseID) VALUES
('SP000001', 'PU000002'),('SP000002', 'PU000013'),('SP000003', 'PU000016'),('SP000004', 'PU000012'), ('SP000005','PU000007'), ('SP000006', 'PU000015'),
('SP000007','PU000003'),('SP000008', 'PU000004'), ('SP000009', 'PU000012');



INSERT INTO DogPurchases(DogPurchaseID, PurchaseID ) VALUES
('DP000001','PU000005'), ('DP000002','PU000014'), ('DP000003','PU000005'), ('DP000004','PU000008'), ('DP000005','PU000009'),
('DP000006','PU000010');


INSERT INTO SHOTS(ShotID, Name) VALUES
('S00000O1', 'Rabies'),('S00000O2', 'Lyme'),('S00000O3', 'Bordetella'),('S00000O4', 'Giardia');
--CREATE OR REPLACE FUNCTION get dog age

-- create a function that compares two trainers, and returns which trainer has trained the most expensive dogs


-- GET DOGS THAT ARE SIBLINGS



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

CREATE OR REPLACE FUNCTION get_dogs_shots (char(8), REFCURSOR) returns refcursor as
$$
 DECLARE
   DogID   char(8)     := $1;
   results     REFCURSOR   := $2;

 BEGIN
     OPEN results for
     select shots.name as Available shots, dogshots.shotdate from shots inner join dogshots on shots.shotsid = dogshots.id
     where dogshots.dogid = DogID;
 return results;
end;
 $$
language plpgsql;






CREATE OR REPLACE FUNCTION puppyAge(char(8))
returns interval as
$$
declare
pupID char(8) := $1;
birthday date := (select dogs.dob from dogs inner join puppies on dogs.dogid = puppies.dogid where puppies.PUPPYid = PupID);
BEGIN
return age(birthday);
 end;
 $$
 language plpgsql;

 select puppyAge('PP000001');




CREATE OR REPLACE FUNCTION most_children(adultdogid char(8))
returns refcursor as
$$
declare

BEGIN
end
$$
language plpgsql;



--VIEW: List all of the puppies for sale


CREATE VIEW AvailablePuppiesForSale  AS
SELECT name, weightlbs, gender from dogs inner join puppies on dogs.dogid = puppies.dogid
where dogs.forsale = 'TRUE';



-- POSSIBLE TRIGGERS: WHENEVER A NEW  PUPPY IS PURCHASED, automatically set, forSALE to be SOLD




CREATE OR REPLACE FUNCTION setPuppyAsSold()
returns trigger as $$
BEGIN
  if new.dogid is not null then
    update dogs
      set ForSale = 'SOLD'
      where dogs.dogid = New.dogid;
  end if
  return new;
end;
$$ language plpgql;


Create Trigger soldPuppy
before UPDATE on Purchases
for each row
execute procedure setPuppyAsSold();



CREATE OR REPLACE function

-- VIEWS SELECT THE  dog with the most children, this is for people that are interested in the lineage of a specfic dog

--



/* View the current trainer that sold the most expensive stud */


CREATE VIEW ExpensiveStudTrainer
SELECT people,name, purchases.priceusd from people inner join Trainers
on trainers.personid = people.Person inner join dogs
on dogs.trainerid = trainers.trainerid
inner join purchases on purchases.dogid = dogs.dogid inner join studpurchases on
purchases.purchaseid = studpurchases.PurchaseID
where purchases.priceusd = (select max(priceusd) from purchases);
-- VIEWS


--SECURITY


CREATE ROLE Breeders;
GRANT ALL ON ALL TABLES
TO ADMIN;

--Breeders are the people managing each dog in BBT, therefore they have ultimate access to everything

CREATE ROLE trainers;
grant select on dogs, adultdogs, puppies, breeds;
  TO trainers;


-- REPORTS

--QUERY TO RETURN the percentage of dogs that are adults and are pitbulls
SELECT	TRUNC (CAST((SELECT	COUNT(dogs.dogid)	AS	PitbullsNum
FROM	dogs
inner join adultdogs on dogs.dogid = adultdogs.dogid
WHERE	dogs.breedid= 'BR000003')	as decimal(5,2))
 /
 (SELECT	COUNT(dogs.dogid)	AS	allDogs FROM	dogs)	*	100	)
 as	AdultPitbullsPercent




-- dogs that havent received a shot within the year


-- Puppies that are trained by people who have trained a lot of dogs


select * from dogs inner join puppies on dogs.dogid = puppies.dogid
