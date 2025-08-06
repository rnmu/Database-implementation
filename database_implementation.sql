CREATE TABLE Department (
    DNUM INT PRIMARY KEY,
    DName VARCHAR(100) NOT NULL,
    ManagerSSN INT,
    HireDate DATE
);

-- Table: Employee
CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender CHAR(1),
    DNUM INT NOT NULL,
    SupervisorSSN INT,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM),
    FOREIGN KEY (SupervisorSSN) REFERENCES Employee(SSN)
);

-- Table: Department_Locations
CREATE TABLE Department_Locations (
    DNUM INT,
    Location VARCHAR(100),
    PRIMARY KEY (DNUM, Location),
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

-- Table: Project
CREATE TABLE Project (
    PNumber INT PRIMARY KEY,
    PName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    City VARCHAR(100),
    DNUM INT,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

-- Table: Works
CREATE TABLE Works (
    SSN INT,
    PNumber INT,
    WorkingHours FLOAT,
    PRIMARY KEY (SSN, PNumber),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (PNumber) REFERENCES Project(PNumber)
);

-- Table: Dependent
CREATE TABLE Dependent (
    SSN INT,
    DependentName VARCHAR(100),
    Gender CHAR(1),
    BirthDate DATE,
    PRIMARY KEY (SSN, DependentName),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN) ON DELETE CASCADE
);
