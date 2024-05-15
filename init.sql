GO
CREATE SCHEMA pfarrgemeinde
GO

CREATE TABLE pfarrgemeinde.admin
(
    id          INT PRIMARY KEY IDENTITY (1,1),
    anmeldename VARCHAR(50)  NOT NULL,
    passwort    VARCHAR(MAX) NOT NULL
)
CREATE TABLE pfarrgemeinde.beitrag
(
    id         BIGINT PRIMARY KEY IDENTITY (1,1),
    titel      VARCHAR(MAX),
    inhalt     VARCHAR(MAX),
    foto       VARCHAR(MAX),
    anklickbar BIT
)
CREATE TABLE pfarrgemeinde.padlet
(
    id     BIGINT PRIMARY KEY IDENTITY (1,1),
    titel  VARCHAR(MAX),
    inhalt VARCHAR(MAX),
    bild   VARCHAR(MAX)
)

CREATE TABLE pfarrgemeinde.foto
(
    id   BIGINT PRIMARY KEY IDENTITY (1,1),
    pfad VARCHAR(MAX) NOT NULL
)
CREATE TABLE pfarrgemeinde.foto_in_padlet
(
    padlet_id BIGINT REFERENCES pfarrgemeinde.padlet (id) ON DELETE CASCADE,
    foto_id   BIGINT REFERENCES pfarrgemeinde.foto (id) ON DELETE CASCADE,
    CONSTRAINT pk_foto_in_padlet PRIMARY KEY (padlet_id, foto_id)
)
CREATE TABLE pfarrgemeinde.foto_in_beitrag
(
    beitrag_id BIGINT REFERENCES pfarrgemeinde.beitrag (id) ON DELETE CASCADE,
    foto_id    BIGINT REFERENCES pfarrgemeinde.foto (id) ON DELETE CASCADE,
    CONSTRAINT pk_foto_in_beitrag PRIMARY KEY (beitrag_id, foto_id)
);

CREATE TABLE pfarrgemeinde.pfarrbrief
(
    id   BIGINT PRIMARY KEY IDENTITY (1,1),
    pfad VARCHAR(MAX) NOT NULL
);

CREATE TABLE pfarrgemeinde.kontakt
(
    id      BIGINT PRIMARY KEY IDENTITY (1,1),
    name    VARCHAR(50),
    email   VARCHAR(50),
    telefon VARCHAR(50),
    bild    VARCHAR(MAX)
)
CREATE TABLE pfarrgemeinde.aufgabe
(
    id   BIGINT PRIMARY KEY IDENTITY (1,1),
    name VARCHAR(50)
)
CREATE TABLE pfarrgemeinde.hat_aufgabe
(
    kontakt_id BIGINT REFERENCES pfarrgemeinde.kontakt (id) ON DELETE CASCADE,
    aufgabe_id BIGINT REFERENCES pfarrgemeinde.aufgabe (id) ON DELETE CASCADE,
    CONSTRAINT pk_hat_aufgabe PRIMARY KEY (kontakt_id, aufgabe_id)
)
CREATE TABLE pfarrgemeinde.aktivitaets_typ
(
    id    INT PRIMARY KEY IDENTITY (1,1),
    name  VARCHAR(50),
    farbe VARCHAR(MAX)
)
CREATE TABLE pfarrgemeinde.kalender
(
    id   INT PRIMARY KEY IDENTITY (1,1),
    name VARCHAR(128)
)
CREATE TABLE pfarrgemeinde.aktivitaets_eintrag
(
    id           BIGINT PRIMARY KEY IDENTITY (1,1),
    name         VARCHAR(MAX),
    datum        DATE NOT NULL,
    startzeit    DATETIME,
    endzeit      DATETIME,
    beschreibung VARCHAR(MAX),
    typId        INT REFERENCES pfarrgemeinde.aktivitaets_typ (id),
    kalenderId   INT REFERENCES pfarrgemeinde.kalender (id)
)
CREATE TABLE pfarrgemeinde.kapelle
(
    id           INT PRIMARY KEY IDENTITY (1,1),
    name         VARCHAR(50),
    beschreibung VARCHAR(MAX),
    bild         VARCHAR(MAX),
    kalenderId   INT REFERENCES pfarrgemeinde.kalender (id)
);

CREATE TABLE pfarrgemeinde.link
(
    id   INT PRIMARY KEY IDENTITY (1,1),
    name VARCHAR(255) NOT NULL,
    link VARCHAR(255) NOT NULL
);

INSERT INTO pfarrgemeinde.kalender (name)
VALUES ('Kirche Michelhausen');
INSERT INTO pfarrgemeinde.kalender (name)
VALUES ('Marienkapelle Michelhausen');
INSERT INTO pfarrgemeinde.kalender (name)
VALUES ('Kapelle Atzelsdorf');
INSERT INTO pfarrgemeinde.kalender (name)
VALUES ('Kapelle Pixendorf');
INSERT INTO pfarrgemeinde.kalender (name)
VALUES ('Kapelle Streithofen');
INSERT INTO pfarrgemeinde.kalender (name)
VALUES ('Kapelle Spital');
INSERT INTO pfarrgemeinde.kalender (name)
VALUES ('Kapelle Mitterndorf');
INSERT INTO pfarrgemeinde.kalender (name)
VALUES ('Kapelle Michelndorf');

INSERT INTO pfarrgemeinde.kapelle (name, beschreibung, bild, kalenderId)
VALUES ('Marienkapelle Michelhausen',
        'Sie wurde 1836 am östlichen Dorfrand in der Ecke eines Vorgartens erbaut und diente bei der Fronleichnamsprozession als Altar und war bei Begräbnissen aus Atzelsdorf und Pixendorf der Ort für die erste Einsegnung.' +
        'Als die Kapelle baufällig und renovierungsbedürftig geworden war, wurde sie abgetragen und schräg gegenüber eine Neue errichtet. Am Pfingstsonntag des Jahres 1968 wurde die neue Marienkapelle geweiht.',
        '',
        1);


INSERT INTO pfarrgemeinde.kapelle (name, beschreibung, bild, kalenderId)
VALUES ('Kapelle Atzelsdorf',
        'Ursprünglich stand in Atzelsdorf nur ein Glockenturm. Unter dem Ortsbesorger Josef Grill baute die Gemeinde Atzelsdorf eine hölzerne Kapelle.' +
        '1935 wurde eine gemauerte Kapelle errichtet. 1964 und 1981 wurde sie saniert. Sie ist zu Ehren des heiligen Antonius von Padua geweiht.',
        '',
        2);


INSERT INTO pfarrgemeinde.kapelle(name, beschreibung, bild, kalenderId)
VALUES ('Kapelle Pixendorf',
        'Der Einsiedler Andreas Mayr drängte, eine Kapelle zu errichten.' +
        '1784 wurde sie zu Ehren der Einsiedler Anton und Paul mit einem Tedeum und einer Messe feierlich eingeweiht.' +
        'Im Jahre 1950 wurde die Kapelle renoviert und 1951 gesegnet. In den Jahren 1991/92 wurden die Mauern trockengelegt,' +
        'der Außen- und Innenputz erneuert und neue Bänke angeschafft. Der frühere Besitzer der Waldpension spendete Glasfenster für die Kapelle.',
        '',
        3);


INSERT INTO pfarrgemeinde.kapelle(name, beschreibung, bild, kalenderId)
VALUES ('Kapelle Streithofen',
        '1750 ließ Herzogin Maria Theresia von Savoyen eine gemauerte Kapelle zu Ehren des heiligen Florian errichten.' +
        '1950 wurde die Kapelle restauriert und gesegnet. 1980 wurde sie saniert. Altar und Statuen wurden restauriert und am 17. Juni 1980 gesegnet.',
        '',
        4);


INSERT INTO pfarrgemeinde.kapelle(name, beschreibung, bild, kalenderId)
VALUES ('Kapelle Spital',
        'Spital hatte früher eine kleine hölzerne Kapelle zwischen den beiden Ortsteilen.' +
        'Während der Besatzungszeit durchschoss ein russischer Soldat einen Fuß des Gekreuzigten.' +
        'Ein anderer Soldat verband die entstandene Wunde. Als die Holzkapelle baufällig geworden war, wurde eine Gemauerte errichtet.' +
        'Am 19. Juni 1978 wurde diese Kapelle gesegnet.' +
        'Im oberen Ortsteil stand ein Glockenstuhl, der im Jahre 1901 erneuert worden war.' +
        '1963 begann man mit dem Bau einer Ortskapelle, die am 27. September 1964 gesegnet wurde.',
        '',
        5);


INSERT INTO pfarrgemeinde.kapelle(name, beschreibung, bild, kalenderId)
VALUES ('Kapelle Mitterndorf',
        'Im Jahre 1869 segnete der Bischof in St. Pölten eine Glocke für Mitterndorf, die dann in der errichteten kleinen Holzkapelle im Turmgerüst aufgehängt worden war.' +
        '1938 wurde eine neue Kapelle errichtet. 1960 wurden die Wände durch ein Ziegelmauerwerk ersetzt. Im Jahre 1964 erfolgte am 25. Oktober die Segnung.',
        '',
        6);


INSERT INTO pfarrgemeinde.kapelle(name, beschreibung, bild, kalenderId)
VALUES ('Kapelle Michelndorf',
        'Die Kapelle wurde im Jahre 1747 errichtet und am 29. März 1747 zu Ehren des Nährvaters Josef gesegnet.' +
        '1873 wurde die Kapelle außen und innen restauriert. In den Jahren 1985 bis 1987 wurde nach hundert Jahren wieder eine Renovierung fällig.',
        '',
        7);