CREATE DATABASE Escola;

IF OBJECT_ID(N'dbo.TB_Status', N'U') IS NOT NULL  
   DROP TABLE [dbo].[TB_Status];  

IF OBJECT_ID(N'dbo.TB_Materia', N'U') IS NOT NULL  
   DROP TABLE [dbo].[TB_Materia];  
   
IF OBJECT_ID(N'dbo.TB_Professor', N'U') IS NOT NULL  
   DROP TABLE [dbo].[TB_Professor];  
   
IF OBJECT_ID(N'dbo.TB_Aluno', N'U') IS NOT NULL  
   DROP TABLE [dbo].[TB_Aluno];  

CREATE TABLE TB_Status
(
    CodStatus INT IDENTITY(1, 1),
    STATUS VARCHAR(150)
        CONSTRAINT PK_Status
        PRIMARY KEY (CodStatus)
);

INSERT INTO dbo.TB_Status
(
    STATUS
)
VALUES
('Ativo' -- STATUS - varchar(150)
    );

INSERT INTO dbo.TB_Status
(
    STATUS
)
VALUES
('Inativo' -- STATUS - varchar(150)
    );

CREATE TABLE TB_Materia
(
    CodMateria INT IDENTITY(1, 1),
    Materia VARCHAR(150) NOT NULL,
    CodStatus INT NOT NULL,
    CONSTRAINT PK_Materia
        PRIMARY KEY (CodMateria),
    CONSTRAINT FK_StatusMateria
        FOREIGN KEY (CodStatus)
        REFERENCES dbo.TB_Status (CodStatus)
);

INSERT INTO dbo.TB_Materia
(
    Materia,
    CodStatus
)
VALUES
(   'Algebra', -- Materia - varchar(150)
    1          -- CodStatus - int
    );

INSERT INTO dbo.TB_Materia
(
    Materia,
    CodStatus
)
VALUES
(   'Português', -- Materia - varchar(150)
    1            -- CodStatus - int
    );
INSERT INTO dbo.TB_Materia
(
    Materia,
    CodStatus
)
VALUES
(   'Inglês', -- Materia - varchar(150)
    1         -- CodStatus - int
    );
INSERT INTO dbo.TB_Materia
(
    Materia,
    CodStatus
)
VALUES
(   'Geografia', -- Materia - varchar(150)
    1            -- CodStatus - int
    );
INSERT INTO dbo.TB_Materia
(
    Materia,
    CodStatus
)
VALUES
(   'Ciências', -- Materia - varchar(150)
    1           -- CodStatus - int
    );


CREATE TABLE TB_Professor
(
    CodProfessor INT IDENTITY(1, 1),
    NomeProfessor VARCHAR(150) NOT NULL,
    CodMateria INT NOT NULL,
    CodStatus INT NOT NULL
        CONSTRAINT PK_Professor
        PRIMARY KEY (CodProfessor),
    CONSTRAINT FK_MateriaProfessor
        FOREIGN KEY (CodMateria)
        REFERENCES dbo.TB_Materia (CodMateria),
    CONSTRAINT FK_StatusProfessor
        FOREIGN KEY (CodStatus)
        REFERENCES dbo.TB_Status (CodStatus)
);

INSERT INTO dbo.TB_Professor
(
    NomeProfessor,
    CodMateria,
    CodStatus
)
VALUES
(   'Girafales', -- NomeProfessor - varchar(150)
    1,           -- CodMateria - int
    1            -- CodStatus - int
    );

DECLARE @codmateria INT =
        (
            SELECT CodMateria FROM dbo.TB_Materia WHERE Materia = 'Ciências'
        );

INSERT INTO dbo.TB_Professor
(
    NomeProfessor,
    CodMateria,
    CodStatus
)
VALUES
(   'Madruga',   -- NomeProfessor - varchar(150)
    @codmateria, -- CodMateria - int
    1            -- CodStatus - int
    );


CREATE TABLE TB_Aluno
(
CodAluno INT IDENTITY (1,1),
NomeAluno VARCHAR(150) NOT NULL,
RA VARCHAR(10) NOT NULL,
DataNascimento DATE NOT NULL,
CodStatus INT NOT NULL,

CONSTRAINT PK_Aula PRIMARY KEY (CodAluno),
CONSTRAINT FK_StatusAluno FOREIGN KEY (CodStatus)REFERENCES dbo.TB_Status
(CodStatus)
)

INSERT INTO dbo.TB_Aluno
( NomeAluno,
    RA,
    DataNascimento,
    CodStatus
)
VALUES
(   'Kiko',        -- NomeAluno - varchar(150)
    '1111',        -- RA - varchar(10)
    '1977-01-01', -- DataNascimento - date
    1          -- CodStatus - int
    )


INSERT INTO dbo.TB_Aluno
( NomeAluno,
    RA,
    DataNascimento,
    CodStatus
)
VALUES
(   'Chaves',        -- NomeAluno - varchar(150)
    '2222',        -- RA - varchar(10)
    '1977-02-20', -- DataNascimento - date
    1          -- CodStatus - int
    )



INSERT INTO dbo.TB_Aluno
( NomeAluno,
    RA,
    DataNascimento,
    CodStatus
)
VALUES
(   'Chuiquinha',        -- NomeAluno - varchar(150)
    '2222',        -- RA - varchar(10)
    '1977-04-30', -- DataNascimento - date
    1          -- CodStatus - int
    )


	INSERT INTO dbo.TB_Aluno
( NomeAluno,
    RA,
    DataNascimento,
    CodStatus
)
VALUES
(   'Pópis',        -- NomeAluno - varchar(150)
    '2222',        -- RA - varchar(10)
    '1977-04-30', -- DataNascimento - date
    1          -- CodStatus - int
    )

CREATE TABLE TB_NotaAluno
(CodNotaAluno INT IDENTITY (1,1),
 CodAluno INT NOT NULL,
 CodMateria INT  NOT NULL, 
 Nota TINYINT NOT NULL,
 CONSTRAINT PK_NotaAluno PRIMARY KEY (CodNotaAluno),
 CONSTRAINT FK_NotaAulo FOREIGN KEY (CodAluno) REFERENCES dbo.TB_Aluno (CodAluno),
 CONSTRAINT FK_NotaAlunoMateria FOREIGN KEY (CodMateria) REFERENCES dbo.TB_Materia (CodMateria)
 )

INSERT INTO dbo.TB_NotaAluno
(
    CodAluno,
    CodMateria,
    Nota
)
VALUES
(   1, -- CodAluno - int
    1, -- CodMateria - int
    0  -- Nota - tinyint
    )

INSERT INTO dbo.TB_NotaAluno
(
    CodAluno,
    CodMateria,
    Nota
)
VALUES
(   2, -- CodAluno - int
    1, -- CodMateria - int
    3  -- Nota - tinyint
    )


INSERT INTO dbo.TB_NotaAluno
(
    CodAluno,
    CodMateria,
    Nota
)
VALUES
(   3, -- CodAluno - int
    1, -- CodMateria - int
    10  -- Nota - tinyint
    )

	
INSERT INTO dbo.TB_NotaAluno
(
    CodAluno,
    CodMateria,
    Nota
)
VALUES
(   4, -- CodAluno - int
    1, -- CodMateria - int
    7  -- Nota - tinyint
    )
