drop table IF EXISTS endpoint_hits cascade;

CREATE TABLE IF NOT EXISTS endpoint_hits(
    id INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    app VARCHAR,
    uri VARCHAR,
    ip VARCHAR,
    statistic_timestamp TIMESTAMP,
    CONSTRAINT KEY_HIT PRIMARY KEY (id)
);