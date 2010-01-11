DROP TABLE IF EXISTS boots;

CREATE TABLE boots (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     name TEXT,
     sku TEXT,
     height TEXT,
     lining TEXT,
     colors TEXT,
     price TEXT,
     features TEXT
);

insert into boots values (
      1,
      "Chippewa 17-inch Engineer Boot",
      "7141832",
      "17 inches",
      "Leather",
      "Black <abbr>Oil-tanned</abbr>, Black Polishable",
      "$187.00",
      "<abbr>Oil-tanned</abbr> or polishable <abbr>full-grain</abbr> leather uppers. <abbr>Vibram</abbr> sole. <abbr>Goodyear welt</abbr>. Padded insole. Steel safety toe.");

insert into boots values (
      2,
      "Chippewa 11-inch Engineer Boot",
      "7173656",
      "11 inches",
      "None",
      "Black, Crazy Horse",
      "$167.00",
      "<abbr>Oil-tanned</abbr> <abbr>full-grain</abbr> leather uppers. <abbr>Vibram</abbr> sole. <abbr>Goodyear welt</abbr>. Padded insole. Steel safety toe. Texon&reg; insole.");

insert into boots values (
      3,
      "Chippewa Harness Boot",
      "7141922",
      "13 inches",
      "Leather",
      "Black, Crazy Horse",
      "$187.00",
      "<abbr>Full-grain</abbr> leather uppers. Leather lining. <abbr>Vibram</abbr> sole. <abbr>Goodyear welt</abbr>.");

insert into boots values (
      4,
      "Caterpillar Tradesman Work Boot",
      "7177382",
      "6 inches",
      "Leather",
      "Honey, Peanut",
      "$87.00",
      "<abbr>Full-grain</abbr> <abbr>oil-tanned</abbr> leather. Nylon mesh lining. Ortholite sock liner. EVA midsole. T84V Rubberlon outsole.");

insert into boots values (
      5,
      "Danner Foreman Pro Work Boot",
      "7141730",
      "10 inches",
      "Leather",
      "Honey, Brown",
      "$287.00",
      "Alkali-resistant <abbr>full-grain</abbr> leather. <abbr>Cambrelle</abbr> nylon lining. Fiberglass shank. <abbr>Vibram</abbr> 4014 Cristy sole. <abbr>Stitch-down</abbr> construction.");

insert into boots values (
      6,
      "Chippewa 17-inch Snakeproof Boot",
      "7141833",
      "17 inches",
      "Leather",
      "Russet",
      "$147.00",
      "<abbr>Full-grain</abbr> leather foot. 1000 Denier <abbr>Cordura</abbr> Viper cloth shaft. <abbr>Goodyear welt</abbr>. Leather Lining. Body Cushion Insole. <abbr>Vibram</abbr> Robinson Outsole.");

insert into boots values (
      7,
      "Danner Grouse GTX Boot",
      "7257914",
      "8 inches",
      "<abbr>Gore-Tex</abbr>",
      "Brown",
      "$207.00",
      "<abbr>Full-grain</abbr> leather foot. 1000 Denier <abbr>Cordura</abbr> Viper cloth shaft. <abbr>Gore-Tex</abbr> lining. Stich-down construction.");

insert into boots values (
      8,
      "Caterpillar Logger Boot",
      "7269643",
      "8 inches",
      "<abbr>Cambrelle</abbr>",
      "Black",
      "$157.00",
      "<abbr>Full-grain</abbr> leather. <abbr>Cambrelle</abbr>&reg; lining. Steel safety toe. Electrical hazard protection. Poliyou&reg; cushion insole. Rubber lug outsole.");

DROP TABLE boot_colors; 
CREATE TABLE boot_colors(
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     boot_id INTEGER,
     code TEXT,
     caption TEXT
);
INSERT INTO boot_colors values (
     1, 1, "bk", "Black Oil-tanned" ); 
INSERT INTO boot_colors values (
     2, 1, "br", "Black Polishable" ); 
INSERT INTO boot_colors values (
     3, 2, "bk", "Black" ); 
INSERT INTO boot_colors values (
     4, 2, "br", "Crazy Horse" ); 
INSERT INTO boot_colors values (
     5, 3, "bk", "Black" ); 
INSERT INTO boot_colors values (
     6, 3, "br", "Crazy Horse" ); 
INSERT INTO boot_colors values (
     7, 4, "hy", "Honey" ); 
INSERT INTO boot_colors values (
     8, 4, "sd", "Peanut" ); 
INSERT INTO boot_colors values (
     9, 5, "hy", "Honey" ); 
INSERT INTO boot_colors values (
    10, 5, "rw", "Brown" ); 
INSERT INTO boot_colors values (
    11, 6, "br", "Russet" ); 
INSERT INTO boot_colors values (
    12, 7, "br", "Brown" ); 
INSERT INTO boot_colors values (
    13, 8, "bk", "Black" ); 

DROP TABLE boot_sizes;
CREATE TABLE boot_sizes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT,
    caption TEXT
);
INSERT INTO boot_sizes values (
    1, "9d", "9 D");
INSERT INTO boot_sizes values (
    2, "9ee", "9 EE");
INSERT INTO boot_sizes values (
    3, "95d", "9 1/2 D");
INSERT INTO boot_sizes values (
    4, "95ee", "9 1/2 EE");
INSERT INTO boot_sizes values (
    5, "95eee", "9 1/2 D");
INSERT INTO boot_sizes values (
    6, "10ee", "10 EE");
INSERT INTO boot_sizes values (
    7, "10eee", "10 EEE");
INSERT INTO boot_sizes values (
    8, "13e", "13 E");

