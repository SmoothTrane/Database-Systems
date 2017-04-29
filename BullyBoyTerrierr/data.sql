CREATE table People(
PersonID char(4) not null unique,
name text not null,
primary key (PersonId)
);


CREATE TABLE Trainers(
  TrainerID char(4) not null unique,
  PersonID char(4) not null unique,
  primary key (TrainerId),
  foreign key (PersonId) references people(PersonID)
);


CREATE Table Breeds(
    BreedID char(4) not null unique,
    Name text,
    primary key (BreedId)
);

CREATE TABLE Breeders(
BreederID char(4) not null unique,
PersonID char(4) not null unique,
primary key (BreederID),
foreign key(PersonId) references people(PersonID)
);


CREATE TABLE Customers(
  CustomerID char(4) not null unique,
  PersonID char(4) not null unique,
  primary key (CustomerID),
  foreign key (PersonID) references people(PersonID)
);

CREATE TABLE Dogs(
  DogID char(4) not null unique,
  name text not null,
  BreederID char(4),
  BreedID char(4) not null,
  TrainerID char(4),
  DOB date not null,
  MotherID char(4),
  FatherID char(4),
  WeightLBS int,
  gender text check (gender in ('Male', 'Female')),
  ForSale text check (ForSale in ('SOLD', 'FALSE', 'TRUE')),
  primary key (DogID),
  foreign key (BreederID) references Breeders(BreederID),
  foreign key (MotherID) references Dogs(DogID),
  foreign key (BreedID) references Breeds(BreedID)

);

  CREATE TABLE AdultDogs(
    AdultDogID char(4) not null unique,
    DogID char(4) not null,
    primary key (AdultDogID),
    foreign key (DogID) references Dogs(DogId)
  );

  CREATE TABLE Puppies(
    PuppyID char(4) not null unique,
    DogID char(4) not null,
    primary key (PuppyID),
    foreign key (DogID) references Dogs(DogId)
  );

CREATE TABLE Purchases(
  PurchaseID   char(4) not null,
  CustomerID   char(4) not null,
  DogID        char(4) not null,
  PriceUSD      integer,
  PurchaseDate  date,
  primary key (PurchaseID),
  foreign key (CustomerID) references Customers(CustomerID),
  foreign key (DogID) references Dogs(DogId)
);

CREATE TABLE StudPurchases(
    StudPurchaseID char(4) not null unique,
    PurchaseID         char(4) not null,
    primary key (StudPurchaseID),
    foreign key (PurchaseID) references Purchases (PurchaseID)
);

CREATE TABLE DogPurchases(
    DogPurchaseID char(4) not null unique,
    PurchaseID      char(4) not null,
    primary key (DogPurchaseID),
    foreign key (PurchaseID) references Purchases (PurchaseID)
);

INSERT INTO PEOPLE (PeopleID, name) VALUES
('P001', 'Byron'), ('P002', 'Gary'), ('P003', 'Bryant'), ('P004', 'Bryce'),('P005', 'Abdul'), ('P006', 'Sharif'), ('P007', 'Amar'), ('P008', 'Muhammad'),('P009', 'Byron'), ('P010', 'Tyshawn'), ('P011', 'Jay P'), ('P011', 'Trey');
INSERT INTO TRAINERS (TrainerID, PersonID) VALUES
('T001', 'P001'), ('T002', 'P003');

Insert into Breeders (BreederID, PersonID) VALUES
('B001', 'P001'), ('B002', 'P003'), ('B003', 'P002');

INSERT INTO Breeds (BreedID, name) VALUES
('BR01', 'Bull Terrier'),('BR02', 'American Bully'),('BR03', 'Pitbull'), ('BR04', 'English Bulldog');

INSERT INTO Dogs(DogID, name, BreederID, BreedID, TrainerID, DOB, MotherID, FatherID, WeightLBS, gender, forsale )
VALUES ('D001', 'Bronx', 'P001', 'BR02', 'T001','',null, null, null, 100, 'MALE', 'FALSE');

-- CREATE OR REPLACE FUNCTION get_breeders_dogs (char(4), REFCURSOR) returns refcursor as
-- $$
-- DECLARE
--   breeder_ID   char(4)     := $1
--   results     REFCURSOR   := $2

-- BEGIN
--     OPEN results for
--     SELECT breederID, breederName from breeder  inner join on dogs  where  breeder_id = dogs.breederid
-- return results;
--end;
-- $$
--language plpgsql;
--

--CREATE OR REPLACE FUNCTION get dog age

-- create a function that compares two trainers, and returns which trainer has trained the most expensive dogs

CREATE OR REPLACE FUNCTION most_expensive_dogs (char(4), char(4), REFCURSOR) returns refcursor as
$$
DECLARE
  TrainerID1   char(4)        := $1
  TrainerID2   char(4)        := $2
  results      REFCURSOR      := $3
  BEGIN
  SELECT name from breeders where trainer.breederid = trainerID1 inner join dogs on trainerid1 = dogs.trainerid inner join purchases on dogs.dogid = purchaes.dogid   union
  (select name from breeders where breeder.breederid = trainerid2 inner join dogs on trainerid2 = dogs.trainerid inner join purchases on dogs.dogid = purchaes.dogid) order by purchases.priceusd;

  END
$$
language plpgsql

CREATE OR REPLACE FUNCTION update_puppy_status()
RETURNS TRIGGER AS
$$

CREATE OR REPLACE FUNCTION puppyAge(char(8))
returns interval as
$$
declare
puppyID := char(8)
birthday date := (select dogs.dob from dogs inner join puppy on dogs.dogid = puppy.dogid where dogs.dogid = puppy.dogid);
BEGIN
return age(birthday)
 end
 $$
 language plpgsql;


CREATE OR REPLACE FUNCTION most_children(adultdogid char(8))
returns refcursor as
$$
declare

BEGIN
end
$$
language plpgsql;


-- POSSIBLE TRIGGERS: WHENEVER A NEW  PUPPY IS PURCHASED, automatically set, forSALE to be SOLD


-- VIEWS SELECT THE  dog with the most children, this is for people that are interested in the lineage of a specfic dog



-- CREATE VIEW CurrentDogs  AS
-- SELECT name, dob, gender, weightlbs,  from dogs inner join adultdogs on dogs.dogid = puppies.dogid
-- where dogs.forsale = "true"
-- order by desc;
-- -- view the trainer that has trained the most expensive dog


-- CREATE VIEW ExpensiveTrainer as
-- SELECT name from people inner join trainers on trainers.peopleid = people.peopleid inner join dogs on dogs.trainerid = trainers.trainerid inner join purchases on purchases.dogid = dogs.dogid where  purchases.priceusd = (select max(priceusd) from purchases);
i
-- VIEWS
