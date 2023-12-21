CREATE TABLE UTILIZATOR (
    id INT PRIMARY KEY,
    nume VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) NOT NULL UNIQUE,
    parola VARCHAR2(255) NOT NULL
);

CREATE TABLE ROL (
    id INT PRIMARY KEY,
    nume VARCHAR2(100) NOT NULL 
);

CREATE TABLE PERMISIUNE (
    id INT PRIMARY KEY,
    nume VARCHAR2(100) NOT NULL 
);

CREATE TABLE SESIUNE (
    id INT PRIMARY KEY,
    utilizator_id INT NOT NULL,
    data_start DATE NOT NULL,
    data_sfarsit DATE,
    FOREIGN KEY (utilizator_id) REFERENCES UTILIZATOR(id)
);

CREATE TABLE PROCES (
    id INT PRIMARY KEY,
    nume VARCHAR2(255) NOT NULL,
    descriere VARCHAR2(255)
);

CREATE TABLE ETAPA (
    id INT PRIMARY KEY,
    proces_id INT NOT NULL,
    nume VARCHAR2(255) NOT NULL,
    descriere VARCHAR2(255),
    FOREIGN KEY (proces_id) REFERENCES PROCES(id)
);

CREATE TABLE ACTIVITATE (
    id INT PRIMARY KEY,
    nume VARCHAR2(255) NOT NULL,
    descriere VARCHAR2(255),
    data_start DATE NOT NULL,
    data_sfarsit DATE
);

CREATE TABLE RESURSA (
    id INT PRIMARY KEY,
    nume VARCHAR2(255) NOT NULL,
    tip VARCHAR2(50) NOT NULL,
    cantitate INT NOT NULL CHECK (cantitate >= 0)
);

CREATE TABLE INVENTAR (
    id INT PRIMARY KEY,
    locatie VARCHAR2(255) NOT NULL 
);

CREATE TABLE DOCUMENT (
    id INT PRIMARY KEY,
    proces_id INT NOT NULL,
    nume VARCHAR2(255) NOT NULL,
    tip VARCHAR2(50) NOT NULL,
    FOREIGN KEY (proces_id) REFERENCES PROCES(id)
);

CREATE TABLE SEMNATURA (
    id INT PRIMARY KEY,
    document_id INT NOT NULL,
    utilizator_id INT NOT NULL,
    data_semnaturii DATE NOT NULL,
    FOREIGN KEY (document_id) REFERENCES DOCUMENT(id),
    FOREIGN KEY (utilizator_id) REFERENCES UTILIZATOR(id)
);

ALTER TABLE UTILIZATOR
ADD telefon VARCHAR2(15);

ALTER TABLE ACTIVITATE
ADD prioritate VARCHAR2(20);

ALTER TABLE ETAPA
ADD status VARCHAR2(20) DEFAULT 'Nou' NOT NULL;


CREATE TABLE ECHIPAMENT (
    echipament_id INT PRIMARY KEY,
    nume VARCHAR2(255) NOT NULL,
    tip VARCHAR2(100),
    data_achizitiei DATE NOT NULL,
    pret NUMBER(10, 2), 
    inventar_id INT,
    FOREIGN KEY (inventar_id) REFERENCES INVENTAR(id)
);

DROP TABLE ECHIPAMENT CASCADE CONSTRAINTS;

ALTER TABLE UTILIZATOR
ADD CONSTRAINT email_unique UNIQUE (email);

ALTER TABLE PERMISIUNE
MODIFY nume NOT NULL;

ALTER TABLE SESIUNE
MODIFY data_sfarsit DATE NOT NULL;

ALTER TABLE ETAPA
MODIFY descriere NOT NULL;

INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (1, 'Ion Popescu', 'ion.popescu@email.com', 'parola1');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (2, 'Ana Ionescu', 'ana.ionescu@email.com', 'parola2');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (3, 'Mihai Vasile', 'mihai.vasile@email.com', 'parola3');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (4, 'Elena Marin', 'elena.marin@email.com', 'parola4');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (5, 'Doru Petrescu', 'doru.petrescu@email.com', 'parola5');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (6, 'Ioana Georgescu', 'ioana.georgescu@email.com', 'parola6');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (7, 'Cristian Dumitrescu', 'cristian.dumitrescu@email.com', 'parola7');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (8, 'Laura Popa', 'laura.popa@email.com', 'parola8');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (9, 'Andrei Mocanu', 'andrei.mocanu@email.com', 'parola9');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (10, 'Mirela Neagu', 'mirela.neagu@email.com', 'parola10');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (11, 'Bogdan Enache', 'bogdan.enache@email.com', 'parola11');
INSERT INTO UTILIZATOR (id, nume, email, parola) VALUES (12, 'Sorin Istrate', 'sorin.istrate@email.com', 'parola12');

INSERT INTO ROL (id, nume) VALUES (1, 'Administrator');
INSERT INTO ROL (id, nume) VALUES (2, 'Manager');
INSERT INTO ROL (id, nume) VALUES (3, 'Supervizor');
INSERT INTO ROL (id, nume) VALUES (4, 'Operator');
INSERT INTO ROL (id, nume) VALUES (5, 'Tehnician');
INSERT INTO ROL (id, nume) VALUES (6, 'Contabil');
INSERT INTO ROL (id, nume) VALUES (7, 'Asistent');
INSERT INTO ROL (id, nume) VALUES (8, 'Receptioner');
INSERT INTO ROL (id, nume) VALUES (9, 'Director');
INSERT INTO ROL (id, nume) VALUES (10, 'HR Manager');
INSERT INTO ROL (id, nume) VALUES (11, 'IT Specialist');
INSERT INTO ROL (id, nume) VALUES (12, 'Marketing Manager');

INSERT INTO PERMISIUNE (id, nume) VALUES (1, 'Vizualizare');
INSERT INTO PERMISIUNE (id, nume) VALUES (2, 'Editare');
INSERT INTO PERMISIUNE (id, nume) VALUES (3, 'Ștergere');
INSERT INTO PERMISIUNE (id, nume) VALUES (4, 'Adăugare');
INSERT INTO PERMISIUNE (id, nume) VALUES (5, 'Exportare');
INSERT INTO PERMISIUNE (id, nume) VALUES (6, 'Importare');
INSERT INTO PERMISIUNE (id, nume) VALUES (7, 'Modificare Setări');
INSERT INTO PERMISIUNE (id, nume) VALUES (8, 'Aprobare');
INSERT INTO PERMISIUNE (id, nume) VALUES (9, 'Revizuire');
INSERT INTO PERMISIUNE (id, nume) VALUES (10, 'Monitorizare');
INSERT INTO PERMISIUNE (id, nume) VALUES (11, 'Management Utilizatori');
INSERT INTO PERMISIUNE (id, nume) VALUES (12, 'Management Roluri');

INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (1, 'Plantare porumb', 'Plantare semințe porumb', DATE '2023-03-01', DATE '2023-03-03');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (2, 'Fertilizare teren', 'Fertilizare câmp cu îngrășăminte naturale', DATE '2023-03-05', DATE '2023-03-06');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (3, 'Irigare câmp', 'Irigare câmp de porumb', DATE '2023-03-10', DATE '2023-03-12');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (4, 'Verificare culturi', 'Inspectionarea stării de sănătate a plantelor', DATE '2023-04-01', DATE '2023-04-01');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (5, 'Tăierea ierbii', 'Tăierea ierbii în zona de nord a fermei', DATE '2023-04-15', DATE '2023-04-16');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (6, 'Reparare gard', 'Repararea gardului din zona de sud', DATE '2023-05-01', DATE '2023-05-02');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (7, 'Îngrijire animale', 'Alimentarea și îngrijirea animalelor', DATE '2023-06-01', DATE '2023-06-01');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (8, 'Recoltare roșii', 'Recoltarea roșiilor din sera', DATE '2023-06-20', DATE '2023-06-21');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (9, 'Preparare produse', 'Prepararea produselor pentru piață', DATE '2023-07-01', DATE '2023-07-03');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (10, 'Vânzare piață', 'Vânzarea produselor la piața locală', DATE '2023-07-05', DATE '2023-07-06');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (11, 'Inspectare utilaje', 'Verificarea și întreținerea utilajelor agricole', DATE '2023-07-10', DATE '2023-07-11');
INSERT INTO ACTIVITATE (id, nume, descriere, data_start, data_sfarsit) VALUES (12, 'Plantare legume', 'Plantarea legumelor în seră', DATE '2023-08-01', DATE '2023-08-02');

INSERT INTO PROCES (id, nume, descriere) VALUES (1, 'Plantare porumb', 'Procesul de plantare a porumbului în câmp');
INSERT INTO PROCES (id, nume, descriere) VALUES (2, 'Irigare câmp', 'Irigarea câmpurilor în perioada de vară');
INSERT INTO PROCES (id, nume, descriere) VALUES (3, 'Fertilizare teren', 'Fertilizarea terenurilor cu îngrășământ organic');
INSERT INTO PROCES (id, nume, descriere) VALUES (4, 'Recoltare cartofi', 'Recoltarea cartofilor din câmp');
INSERT INTO PROCES (id, nume, descriere) VALUES (5, 'Îngrijire animale', 'Procesul de îngrijire zilnică a animalelor de fermă');
INSERT INTO PROCES (id, nume, descriere) VALUES (6, 'Producție lactate', 'Procesul de producție a laptelui și a produselor lactate');
INSERT INTO PROCES (id, nume, descriere) VALUES (7, 'Plantare legume', 'Plantarea legumelor în sere');
INSERT INTO PROCES (id, nume, descriere) VALUES (8, 'Recoltare fructe', 'Recoltarea fructelor din livezi');
INSERT INTO PROCES (id, nume, descriere) VALUES (9, 'Preparare teren', 'Pregătirea terenului pentru plantare în sezonul următor');
INSERT INTO PROCES (id, nume, descriere) VALUES (10, 'Întreținere utilaje', 'Întreținerea și repararea utilajelor agricole');
INSERT INTO PROCES (id, nume, descriere) VALUES (11, 'Tratament fitosanitar', 'Aplicarea tratamentelor fitosanitare pentru protecția plantelor');
INSERT INTO PROCES (id, nume, descriere) VALUES (12, 'Managementul deșeurilor', 'Procesul de gestionare și reciclare a deșeurilor din fermă');

INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (1, 1, 'Plan Plantare Porumb', 'Plan');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (2, 2, 'Raport Irigare Iulie', 'Raport');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (3, 3, 'Fertilizare Schema', 'Schema');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (4, 4, 'Recoltare Cartofi Logistica', 'Logistica');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (5, 5, 'Ghid Îngrijire Animale', 'Ghid');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (6, 6, 'Proceduri Producție Lactate', 'Procedură');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (7, 7, 'Calendar Plantare Legume', 'Calendar');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (8, 8, 'Inventar Recoltare Fructe', 'Inventar');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (9, 9, 'Plan Preparare Teren', 'Plan');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (10, 10, 'Manual Utilaje Agricole', 'Manual');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (11, 11, 'Protocol Tratament Fitosanitar', 'Protocol');
INSERT INTO DOCUMENT (id, proces_id, nume, tip) VALUES (12, 12, 'Strategie Management Deșeuri', 'Strategie');

INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (1, 1, DATE '2023-01-01', DATE '2023-01-01');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (2, 2, DATE '2023-01-02', DATE '2023-01-02');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (3, 3, DATE '2023-01-03', DATE '2023-01-03');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (4, 4, DATE '2023-01-04', DATE '2023-01-04');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (5, 5, DATE '2023-01-05', DATE '2023-01-05');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (6, 1, DATE '2023-01-06', DATE '2023-01-06');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (7, 2, DATE '2023-01-07', DATE '2023-01-07');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (8, 3, DATE '2023-01-08', DATE '2023-01-08');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (9, 4, DATE '2023-01-09', DATE '2023-01-09');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (10, 5, DATE '2023-01-10', DATE '2023-01-10');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (11, 1, DATE '2023-01-11', DATE '2023-01-11');
INSERT INTO SESIUNE (id, utilizator_id, data_start, data_sfarsit) VALUES (12, 2, DATE '2023-01-12', DATE '2023-01-12');

INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (1, 1, 'Pregătire teren', 'Pregătirea terenului pentru plantare');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (2, 1, 'Semănat', 'Semănarea semințelor de porumb');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (3, 2, 'Irigare', 'Irigarea câmpurilor în perioada de vară');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (4, 3, 'Fertilizare', 'Aplicarea îngrășământului pe teren');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (5, 4, 'Recoltare', 'Recoltarea produselor agricole');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (6, 5, 'Transport', 'Transportul produselor către depozit sau piață');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (7, 6, 'Procesare', 'Procesarea produselor agricole');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (8, 7, 'Ambalare', 'Ambalarea produselor pentru vânzare');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (9, 8, 'Vânzare', 'Vânzarea produselor pe piața locală');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (10, 9, 'Inventariere', 'Inventarierea resurselor disponibile');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (11, 10, 'Întreținere', 'Întreținerea echipamentelor agricole');
INSERT INTO ETAPA (id, proces_id, nume, descriere) VALUES (12, 11, 'Planificare', 'Planificarea activităților pentru următorul sezon');

INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (1, 'Tractor', 'Utilaj', 5);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (2, 'Semanatoare', 'Utilaj', 3);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (3, 'Ingrasamant', 'Chimicale', 1000);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (4, 'Pesticide', 'Chimicale', 500);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (5, 'Porumb', 'Seminte', 200);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (6, 'Grau', 'Seminte', 300);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (7, 'Cartofi', 'Seminte', 150);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (8, 'Pompa apa', 'Utilaj', 10);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (9, 'Furca', 'Unelte', 20);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (10, 'Lopata', 'Unelte', 30);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (11, 'Ranga', 'Unelte', 25);
INSERT INTO RESURSA (id, nume, tip, cantitate) VALUES (12, 'Motocultor', 'Utilaj', 8);

INSERT INTO INVENTAR (id, locatie) VALUES (1, 'Depozit Central');
INSERT INTO INVENTAR (id, locatie) VALUES (2, 'Magazie Unelte');
INSERT INTO INVENTAR (id, locatie) VALUES (3, 'Sera Legume');
INSERT INTO INVENTAR (id, locatie) VALUES (4, 'Depozit Furaje');
INSERT INTO INVENTAR (id, locatie) VALUES (5, 'Stație Pesticide');
INSERT INTO INVENTAR (id, locatie) VALUES (6, 'Garaj Utilaje');
INSERT INTO INVENTAR (id, locatie) VALUES (7, 'Camera Semințe');
INSERT INTO INVENTAR (id, locatie) VALUES (8, 'Silo Grau');
INSERT INTO INVENTAR (id, locatie) VALUES (9, 'Depozit Recolte');
INSERT INTO INVENTAR (id, locatie) VALUES (10, 'Camera Frigorifica');
INSERT INTO INVENTAR (id, locatie) VALUES (11, 'Depozit Produse Lactate');
INSERT INTO INVENTAR (id, locatie) VALUES (12, 'Depozit Echipamente');

INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (1, 1, 1, DATE '2023-01-10');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (2, 2, 2, DATE '2023-01-11');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (3, 3, 3, DATE '2023-01-12');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (4, 4, 4, DATE '2023-01-13');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (5, 5, 5, DATE '2023-01-14');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (6, 6, 1, DATE '2023-01-15');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (7, 7, 2, DATE '2023-01-16');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (8, 8, 3, DATE '2023-01-17');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (9, 9, 4, DATE '2023-01-18');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (10, 10, 5, DATE '2023-01-19');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (11, 11, 1, DATE '2023-01-20');
INSERT INTO SEMNATURA (id, document_id, utilizator_id, data_semnaturii) VALUES (12, 12, 2, DATE '2023-01-21');

UPDATE UTILIZATOR SET telefon = '0712345678' WHERE id = 1;
UPDATE UTILIZATOR SET telefon = '0723456789' WHERE id = 2;
UPDATE UTILIZATOR SET telefon = '0734567890' WHERE id = 3;
UPDATE UTILIZATOR SET telefon = '0745678901' WHERE id = 4;
UPDATE UTILIZATOR SET telefon = '0756789012' WHERE id = 5;
UPDATE UTILIZATOR SET telefon = '0767890123' WHERE id = 6;
UPDATE UTILIZATOR SET telefon = '0778901234' WHERE id = 7;
UPDATE UTILIZATOR SET telefon = '0789012345' WHERE id = 8;
UPDATE UTILIZATOR SET telefon = '0790123456' WHERE id = 9;
UPDATE UTILIZATOR SET telefon = '0701234567' WHERE id = 10;
UPDATE UTILIZATOR SET telefon = '0712345601' WHERE id = 11;
UPDATE UTILIZATOR SET telefon = '0723456701' WHERE id = 12;

UPDATE ACTIVITATE SET prioritate = 'Înaltă' WHERE id = 1;
UPDATE ACTIVITATE SET prioritate = 'Medie' WHERE id = 2;
UPDATE ACTIVITATE SET prioritate = 'Scăzută' WHERE id = 3;
UPDATE ACTIVITATE SET prioritate = 'Medie' WHERE id = 4;
UPDATE ACTIVITATE SET prioritate = 'Înaltă' WHERE id = 5;
UPDATE ACTIVITATE SET prioritate = 'Scăzută' WHERE id = 6;
UPDATE ACTIVITATE SET prioritate = 'Înaltă' WHERE id = 7;
UPDATE ACTIVITATE SET prioritate = 'Medie' WHERE id = 8;
UPDATE ACTIVITATE SET prioritate = 'Scăzută' WHERE id = 9;
UPDATE ACTIVITATE SET prioritate = 'Înaltă' WHERE id = 10;
UPDATE ACTIVITATE SET prioritate = 'Medie' WHERE id = 11;
UPDATE ACTIVITATE SET prioritate = 'Scăzută' WHERE id = 12;

UPDATE ETAPA SET status = 'În progres' WHERE id = 1;
UPDATE ETAPA SET status = 'Finalizată' WHERE id = 2;
UPDATE ETAPA SET status = 'Planificată' WHERE id = 3;
UPDATE ETAPA SET status = 'În așteptare' WHERE id = 4;
UPDATE ETAPA SET status = 'Întreruptă' WHERE id = 5;

DROP TABLE INVENTAR;
FLASHBACK TABLE INVENTAR TO BEFORE DROP;

SELECT nume FROM PROCES WHERE descriere LIKE '%plantare%';

SELECT u.nume, s.data_start 
FROM UTILIZATOR u, SESIUNE s 
WHERE u.id = s.utilizator_id;

SELECT u.nume, r.nume 
FROM UTILIZATOR u, ROL r 
WHERE u.id = r.id(+);

SELECT proces_id, COUNT(*) 
FROM ETAPA 
GROUP BY proces_id;

SELECT proces_id, COUNT(*) 
FROM ETAPA GROUP BY proces_id 
HAVING COUNT(*) > 2;

SELECT nume, email 
FROM UTILIZATOR 
ORDER BY nume;

SELECT DISTINCT tip 
FROM RESURSA;

SELECT nume 
FROM PROCES 
WHERE id IN (SELECT proces_id 
             FROM ETAPA 
             WHERE LOWER(nume) LIKE '%plantare%');

SELECT nume 
FROM PROCES 
UNION SELECT nume 
      FROM ETAPA;

SELECT nume 
FROM PROCES 
INTERSECT SELECT nume 
          FROM ETAPA;

SELECT nume 
FROM PROCES 
MINUS SELECT nume 
      FROM ETAPA;

SELECT nume, LENGTH(nume) 
FROM UTILIZATOR;

SELECT id, AVG(cantitate) 
FROM RESURSA 
GROUP BY id;

SELECT p.nume, SUM(r.cantitate) 
FROM PROCES p, RESURSA r 
WHERE p.id = r.id 
GROUP BY p.nume;

SELECT utilizator_id 
FROM SESIUNE 
GROUP BY utilizator_id 
HAVING COUNT(*) > 5;

SELECT id, MONTHS_BETWEEN(data_sfarsit, data_start) AS durata 
FROM SESIUNE;

SELECT id, TRUNC(data_sfarsit - data_start) AS durata 
FROM SESIUNE;

SELECT id AS Activitate , DECODE(prioritate, 'Înaltă', 'Urgent', 'Medie', 'Normal', 'Scăzută', 'Scazut', 'Necunoscut') AS Nivel_De_Prioritate
FROM ACTIVITATE;

SELECT id, 
CASE WHEN cantitate > 500 
    THEN 'Mult' 
ELSE 'Puțin' 
END AS nivel_stoc 
FROM RESURSA;

SELECT nume 
FROM UTILIZATOR u 
WHERE EXISTS (SELECT 1 
              FROM SESIUNE s 
              WHERE s.utilizator_id = u.id 
              AND data_sfarsit > SYSDATE - 30);

SELECT u.nume, s.data_start, r.nume
FROM UTILIZATOR u, SESIUNE s, ROL r 
WHERE u.id = s.utilizator_id(+) 
AND u.id = r.id(+);

SELECT a.nume AS Nume_Activitate, e.nume AS Nume_Etapa, p.nume AS Nume_Proces, u.nume AS Nume_Utilizator
FROM ACTIVITATE a, ETAPA e, PROCES p, DOCUMENT d, SEMNATURA s, UTILIZATOR u
WHERE a.id = e.id(+)
AND e.proces_id = p.id(+)
AND p.id = d.proces_id(+)
AND d.id = s.document_id(+)
AND s.utilizator_id = u.id(+);

SELECT u.nume AS Nume_Utilizator, s.data_start, s.data_sfarsit, r.nume AS Nume_Rol
FROM UTILIZATOR u, SESIUNE s, ROL r
WHERE u.id = s.utilizator_id(+)
AND u.id = r.id(+);

SELECT p.nume AS Nume_Proces, e.nume AS Nume_Etapa, d.nume AS Nume_Document
FROM PROCES p, ETAPA e, DOCUMENT d
WHERE p.id = e.proces_id(+)
AND e.id = d.proces_id(+);

CREATE VIEW v_utilizatori_sesiuni AS
SELECT u.nume, COUNT(S.id) AS numar_sesiuni
FROM UTILIZATOR u, SESIUNE s
WHERE u.id = s.utilizator_id(+)
GROUP BY u.nume;

CREATE INDEX idxEmail ON UTILIZATOR(email);

CREATE SYNONYM syn_utilizator FOR UTILIZATOR;

CREATE SEQUENCE idGen
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--INSERT INTO UTILIZATOR (id, nume, email, parola)
--VALUES (idGen.NEXTVAL, 'NumeNou', 'emailnou@email.com', 'parolaNoua');
