CREATE TABLE People(
  PersonID char(8) not null unique,
  FirstName text not null,
  LastName text not null,
  StreetAddress text not null,

  primary key (PersonId)
);
-- PersonID - > FirstName LastName StreetAddress

CREATE TABLE Trainers(
  PersonID char(8) not null unique,
  Experience text check (Experience in ('BEGINNER', 'INTERMEDIATE', 'ADVANCED')),
  primary key (PersonID),
  foreign key (PersonId) references People(PersonID)
);

-- PersonID -> Experience

CREATE TABLE Breeders(
PersonID char(8) not null unique,
Experience text check (Experience in ('BEGINNER', 'INTERMEDIATE', 'ADVANCED')),
primary key (PersonID),
foreign key(PersonId) references people(PersonID)
);

-- PersonID -> Experience
CREATE TABLE Customers(
  PersonID char(8) not null unique,
  PhoneNumber text,
  primary key (PersonID),
  foreign key (PersonID) references people(PersonID)
);

-- PersonID -> PhoneNumber
CREATE Table Breeds(
    BreedID char(8) not null unique,
    Name text,
    primary key (BreedId)
);


CREATE TABLE Dogs(
  DogID char(8) not null unique,
  name text not null,
  BreederID char(8),
  BreedID char(8) ,
  TrainerID char(8),
  DOB date,
  WeightLBS int,
  gender text check (gender in ('MALE', 'FEMALE')),
  primary key (DogID),
  foreign key (BreederID) references Breeders(PersonID),
  foreign key (TrainerID) references Trainers(PersonID),
  foreign key (BreedID) references Breeds(BreedID)
);
--DogID - > Name, BreederID, BreedID, TrainerID, DOB, WeightLBS
  CREATE TABLE AdultDogs(
    DogID char(8) not null,
    PurchaseFeeUSD  integer,
    StudFeeUSD  integer,
    primary key (DogID),
    foreign key (DogID) references Dogs(DogID)
  );
--DogID - > PurchaseFeeUSD, StudFeeUSD
  CREATE TABLE Puppies(
    DogID char(8) not null,
    PurchaseFeeUSD  integer,
    primary key (DogID),
    foreign key (DogID) references Dogs(DogId)
  );

--DogiD - > PurchaseFeeUSD,



CREATE TABLE Purchases(
  PurchaseID   char(8) not null,
  CustomerID   char(8) not null,
  DogID        char(8) not null,
  TotalPriceUSD      integer,
  PurchaseDate  date,
  PurchaseType text check (PurchaseType in ('STUD', 'ENTIRE DOG')),
  primary key (PurchaseID),
  foreign key (CustomerID) references Customers(PersonID),
  foreign key (DogID) references Dogs(DogId)
);
--PurchaseID -> CustomerID, DogID, TotalPriceUSD, PurchaseDate, PurchaseType

CREATE TABLE Shots(
  ShotID  char(8) not null unique,
  name text,
  primary key (ShotID)
);

CREATE TABLE DogShots(

  ShotID char(8) not null,
  DogID char(8) not null,
  ShotDate date not null,
  primary key (ShotID, ShotDate),
  foreign key (ShotID) references Shots (ShotID),
  foreign key (DogID) references Dogs (DogID)
);

INSERT INTO PEOPLE (PersonID, FirstName, LastName, StreetAddress) VALUES
('P0000001', 'Byron', 'Hardaway', '123 Cherry Block'), ('P0000002', 'Gary', 'Coltrane', '456 Ave'), ('P0000003', 'Bryant', 'Hardaway', '1800 Street'), ('P0000004', 'Bryce', 'Hardaway', '123 Block Street'),('P0000005', 'Abdul', 'Jones', '777 Ali Place'),
('P0000006', 'Sharif', 'Jawara', '176 Sheridan Avenue'),
('P0000007', 'Amar', 'Mourning', '63 Clarence Street'), ('P0000008', 'Muhammad', 'Shaban', '1911 E 125th Street'),('P0000009', 'Peewee', 'Slapper', '573 No Road'), ('P0000010', 'Tyshawn', 'Carter', '424 Key Street'), ('P0000011', 'Jay', 'Perez', '023 Octave Road'),
('P0000012', 'David', 'Muhammad', '1955 Roady Rock Place'), ('P0000013', 'Mary', 'Luigiano', '671 Vinban Street'), ('P0000014', 'Yusuf', 'Abdullah', '023 Oak Lane'), ('P0000015', 'Abraham', 'Jones', '892 Highway Block'), ('P0000016', 'Jermaine', 'Johnson', '023 New Place'),
 ('P0000017', 'Ana', 'Martinez', '282 Dyckman Street'), ('P0000018', 'Khadijah', 'Rahman', '28 Newman Street'), ('P0000019', 'Clara', 'Smith', '2920 Rockland Avenue'), ('P0000020', 'Betty', 'Fields', '920 Dutchess Lane'),('P0000021', 'Jacky', 'Chin', '892 Putnam Road'),
 ('P0000022', 'Omar', 'Suarez', '1955 Montana Street'), ('P0000023', 'Mitch', 'Rico', '2001 Ace Block'),
('P0000024', 'Akbar', 'Williams', '19 Jabbar Street'), ('P0000025', 'Kareem', 'Lawson', '7811 North End'), ('P0000026', 'Tyrone', 'Berkley', '282 E Gartland St'),('P0000027', 'Trey', 'Cummings', '14 Westchester Road');
INSERT INTO TRAINERS (PersonID, Experience) VALUES
('P0000001', 'ADVANCED'), ('P0000003', 'INTERMEDIATE'), ('P0000005', 'INTERMEDIATE'), ('P0000008', 'INTERMEDIATE'), ('P0000012', 'INTERMEDIATE'), ('P0000014', 'ADVANCED'),
('P0000027', 'INTERMEDIATE');

Insert into Breeders (PersonID, experience) VALUES
('P0000001', 'ADVANCED'), ('P0000003', 'ADVANCED'), ('P0000002', 'INTERMEDIATE'), ('P0000004', 'ADVANCED'), ('P0000005', 'BEGINNER'), ('P0000025', 'ADVANCED'),('P0000026','ADVANCED');

INSERT INTO Customers(PersonID, PhoneNumber ) VALUES
('P0000007', 3478192201),('P0000009', 1874191090),('P0000010', 7187773929), ('P0000011', 6467770202),('P0000013', 71877729201),('P0000015', 3890927777),
('P0000016', 4593833322),('P0000017', 2932020232),('P0000018',5162245482),('P0000019',58206639672),('P0000020',3840184025),('P0000021',39302042),
('P0000022',9238384338),('P0000023',2939393932),('P0000024',9910233331);

INSERT INTO Breeds (BreedID, name) VALUES
('BR000001', 'Bull Terrier'),('BR000002', 'American Bully'),('BR000003', 'Pitbull'), ('BR000004', 'English Bulldog');

INSERT INTO Dogs(DogID, name, BreederID, BreedID, TrainerID, DOB, WeightLBS, gender)
VALUES ('D0000001', 'Bronx', 'P0000001', 'BR000002', 'P0000001', '2012-10-13', 50, 'MALE'), ('D0000002', 'Chrome', 'P0000001', 'BR000002', 'P0000001','2015-09-03' ,  68, 'MALE'),
('D0000003', 'Snatch', 'P0000001', 'BR000001', 'P0000001','2012-05-12' ,70, 'MALE'), ('D0000004', 'Gucci', 'P0000001', 'BR000001', 'P0000001','2015-10-15', 50, 'MALE'),
('D0000005', 'Prada', 'P0000001', 'BR000001', 'P0000001', '2011-10-18' , 80, 'MALE'), ('D0000006', 'Sandy', 'P0000001', 'BR000003', 'P0000001','2015-02-20', 100, 'MALE'),
('D0000007', 'Danger', 'P0000003', 'BR000003', 'P0000001','2013-10-05' ,62, 'MALE'), ('D0000008', 'Chanel', 'P0000003', 'BR000003', 'P0000003','2017-03-19',  20, 'FEMALE'),
('D0000009', 'Banga', 'P0000004', 'BR000001', 'P0000001','2015-05-15', 59, 'FEMALE'),('D0000010', 'Nino', 'P0000005', 'BR000004', 'P0000001','2017-03-19',  33, 'MALE'),
('D0000011', 'Bow Leg Lou', 'P0000002', 'BR000004', 'P0000005','2012-05-19', 58, 'FEMALE'),('D0000012', 'Kurt', 'P0000004', 'BR000004', 'P0000003', '2015-01-15',  45, 'MALE'),
('D0000013', 'AK', 'P0000004', 'BR000002', 'P0000003','2013-02-12', 63, 'MALE'),('D0000014', 'Yaya', 'P0000001', 'BR000002', 'P0000005','2015-11-12',  70, 'FEMALE'),
('D0000015', 'Richie', 'P0000001', 'BR000001', 'P0000001','2017-01-10', 30, 'MALE'),('D0000016', 'Nina', 'P0000003', 'BR000003', 'P0000001','2017-03-12',  26, 'FEMALE'),
('D0000017', 'Robbie', 'P0000004', 'BR000004', 'P0000001','2017-01-10', 20, 'MALE'),('D0000018', 'Ruv', 'P0000004', 'BR000003', 'P0000003','2014-12-12',   54, 'MALE');


INSERT INTO Puppies(DogID, PurchaseFeeUSD)
VALUES
('D0000008', 500), ('D0000010', 900), ('D0000015', 600), ('D0000016', 500),('D0000017', 700);

INSERT INTO AdultDogs(DogID, PurchaseFeeUSD, StudFeeUSD)
VALUES
('D0000001',  3000, 1500), ('D0000002', 4000, 2000),('D0000003', 2000, 900),('D0000004', 800, 300),('D0000005', 900, 300),('D0000006', 900, 300),
('D0000007', 1000, 500), ('D0000009', 900, 120),('D0000011', 500, 120),('D0000012', 1000, 750),
('D0000013',1000, 750),('D0000014', 1000, 740),('D0000018', 900, 350);


INSERT INTO PURCHASES(PurchaseID,CustomerID, DogID, TotalPriceUSD, PurchaseDate, PurchaseType) VALUES
('PU000001','P0000007','D0000009', 1790.00, '2017-04-15', 'STUD'),('PU000002','P0000024','D0000001', 1700.00, '2017-04-29', 'STUD'),
('PU000003','P0000009','D0000003', 950.00, '2017-04-14', 'STUD'),('PU000004','P0000024','D0000007', 690.00, '2017-04-28', 'STUD'),
('PU000005','P0000010','D0000011', 600.00, '2017-04-13', 'ENTIRE DOG'),('PU000006','P0000016','D0000008', 620.00, '2017-04-27', 'ENTIRE DOG'),
('PU000007','P0000018','D0000018', 790.00, '2017-04-12', 'STUD'),('PU000008','P0000015','D0000015', 730.00, '2017-04-26', 'ENTIRE DOG'),
('PU000009','P0000009','D0000016', 550.00, '2017-04-11', 'ENTIRE DOG'),('PU000010','P0000024','D0000017', 780.00, '2017-04-25', 'ENTIRE DOG'),
('PU000011','P0000010','D0000002', 2000.00, '2017-04-10', 'STUD'),('PU000012','P0000011','D0000013', 800.00, '2017-04-24', 'STUD'),
('PU000013','P0000013','D0000001', 1500.00, '2017-04-09', 'STUD'),('PU000014','P0000013','D0000012', 825.00, '2017-04-23', 'STUD');





INSERT INTO SHOTS(ShotID, Name) VALUES
('S0000001', 'Rabies'),('S0000002', 'Lyme'),('S0000003', 'Bordetella'),('S0000004', 'Giardia');

INSERT INTO DOGSHOTS(ShotID, DogID, ShotDate) VALUES
('S0000001', 'D0000001', now()), ('S0000003', 'D0000004', '2016-12-19'), ('S0000004', 'D0000003', '2015-12-12'), ('S0000001', 'D0000001', '2017-04-05'),
('S0000002', 'D0000001', now()),('S0000002', 'D0000011', '2016-03-05');




-- STORED PROCEDURES

CREATE OR REPLACE FUNCTION get_breeders_dogs (char(8), REFCURSOR) returns refcursor as
$$
 DECLARE
   breeder_ID   char(8)     := $1;
   results     REFCURSOR   := $2;
 BEGIN
     OPEN results for
     SELECT dogs.dogid, dogs.name from people  inner join breeders on people.personid = breeders.personid
     inner join dogs on dogs.breederid= breeders.personid
     where breeders.personid = breeder_ID;
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

select get_breeders_dogs('P0000001','results1');
fetch all in results1;

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
select get_dog_shots('D0000001','results2');
fetch all in results2;


CREATE OR REPLACE FUNCTION getPuppyAge(char(8))
returns interval as
$$
DECLARE
pupID char(8) := $1;
birthday date := (select dogs.dob from dogs inner join puppies on dogs.dogid = puppies.dogid where puppies.dogid = PupID);
BEGIN
return age(birthday);
end;
 $$
 language plpgsql;


select getPuppyAge('D0000008');


CREATE OR REPLACE FUNCTION setTrainerAsIntermediate()
 returns trigger as $$
 BEGIN
   if new.trainerid is not null then
     update trainers
       set Experience = 'IMMEDIATE'
       where trainer.personid = new.personid;
   end if;
   return new;
 end;
 $$ language plpgsql;

-- TRIGGER
Create Trigger soldDog
after INSERT on dogs
for each row
execute procedure setTrainerAsIntermediate();



--REPORTS



SELECT  dogs.name, adultdogs.purchasefeeusd from dogs
 inner join adultdogs on adultdogs.dogid = dogs.dogid
where adultdogs.purchasefeeusd > 	(SELECT AVG(adultdogs.purchasefeeusd) from adultdogs)
group by dogs.name, adultdogs.purchasefeeusd;



SELECT people, people.firstname, people.lastname, purchases.totalpriceusd from people inner join Trainers
  on trainers.personid = people.Personid inner join dogs
  on dogs.trainerid = trainers.personid
  inner join purchases on purchases.dogid = dogs.dogid
  where purchases.totalpriceusd = (select max(totalpriceusd) from purchases);




-- VIEWS


CREATE VIEW AvailablePitbullsPuppies  AS
SELECT name, weightlbs, gender from dogs inner join puppies on dogs.dogid = puppies.dogid
WHERE  dogs.breedid = 'BR000004';


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
