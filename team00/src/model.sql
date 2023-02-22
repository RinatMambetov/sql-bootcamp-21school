CREATE TABLE nodes
    (
        point1 varchar NOT NULL,
        point2 varchar NOT NULL,
        cost integer NOT NULL
    );

INSERT INTO nodes
VALUES ('a', 'b', 10);
INSERT INTO nodes
VALUES ('b', 'a', 10);
INSERT INTO nodes
VALUES ('a', 'c', 15);
INSERT INTO nodes
VALUES ('c', 'a', 15);
INSERT INTO nodes
VALUES ('a', 'd', 20);
INSERT INTO nodes
VALUES ('d', 'a', 20);
INSERT INTO nodes
VALUES ('b', 'c', 35);
INSERT INTO nodes
VALUES ('c', 'b', 35);
INSERT INTO nodes
VALUES ('b', 'd', 25);
INSERT INTO nodes
VALUES ('d', 'b', 25);
INSERT INTO nodes
VALUES ('c', 'd', 30);
INSERT INTO nodes
VALUES ('d', 'c', 30);