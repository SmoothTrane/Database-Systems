CREATE table People(
PersonId char(4) not null unique,
name text not null,
primary key PersonId
);


CREATE TABLE Trainers(
  TrainerID char(4) not null unique,
  PersonID char(4) not null unique,
  primary key PersonId,
  foreign key (PersonId) references people(PersonID)
);


CREATE TABLE Breeders(
BreederID char(4) not null unique,
PersonID char(4) not null unique,
primary key BreederID,
foreign key(PersonId) references people(PersonID)
);


CREATE TABLE Customers(
  CustomerID char(4) not null unique,
  PersonID char(4) not null unique,
  primary key CustomerID,
  foreign key (PersonID) references people(PersonID)
);

CREATE TABLE Dogs(
  DogID char(4) not null unique,
  name text not null,
  BreederID char(4) not null,
  BreedID char(4) not null,
  TrainerID char(4) not null,
  DOB date not null,
  MotherID char(4) not null,
  FatherID char(4) not null,
  WeightLBS int,
  gender text,
  ForSale text,
  check(gender("MALE", "FEMALE")),
  check(ForSale("SOLD", "FALSE", "TRUE")),
  primary key DogID,
  foreign key BreederID references Breeders(BreederID),
  foreign key (MotherID) references Dogs(DogID),
  foreign key BreedID references Breeds(BreedID)

);
CREATE Table Breeds(
BreedID char(4) not null unique,
Name text,
primary key BreedId
);
  CREATE TABLE AdultDogs(
    AdultDogID char(4) not null unique,
    DogID char(4) not null,
    primary key AdultDogID,
    primary key DogId references Dogs(DogId)
  );

  CREATE TABLE Puppies(
    PuppyID char(4) not null unique,
    DogID char(4) not null,
    primary key PuppyID,
    foreign key DogId references Dogs(DogId)
  );

CREATE TABLE Purchases(
  PurchaseID   char(4) not null,
  CustomerID   char(4) not null,
  Dog_ID        char(4) not null,
  PriceUSD      integer,
  PurchaseDate,  date
  primary key PurchaseID,
  foreign key CustomerID references Customers(CustomerID),
  foreign key Dog_ID references Dog(DogId)
);

CREATE TABLE StudPurchases(
    Stud_Purchase_ID char(4) not null unique,
    PurchaseID         integer not null
);

CREATE TABLE DogPurchases(
    Stud_Purchase_ID char(4) not null unique,
    PurchaseID,         integer not null
);


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
  open results trainer

  END
$$ language plpgsql

CREATE OR REPLACE FUNCTION update_puppy_status()
RETURNS TRIGGER AS
$$


BEGIN
 end




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
