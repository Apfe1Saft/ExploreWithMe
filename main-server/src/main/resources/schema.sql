drop table IF EXISTS users cascade;
drop table IF EXISTS categories cascade;
drop table IF EXISTS events cascade;
drop table IF EXISTS locations cascade;
drop table IF EXISTS events cascade;
drop table IF EXISTS requests cascade;
drop table IF EXISTS compilations cascade;
drop table IF EXISTS compilation_event cascade;
drop table IF EXISTS comments cascade;

create table if not exists users (
    user_id integer GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    user_email VARCHAR(512) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (user_id),
    CONSTRAINT UQ_USER_ID UNIQUE (user_id)
);

create table if not exists categories (
    category_id integer GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    category_name VARCHAR,
    CONSTRAINT  pk_category PRIMARY KEY (category_id),
    CONSTRAINT UQ_CATEGORY_ID UNIQUE (category_id)
);

create table if not exists events(
    event_id integer GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    annotation VARCHAR,
    category_id INTEGER REFERENCES categories(category_id),
    confirmed_requests INTEGER,
    created_on TIMESTAMP WITHOUT TIME ZONE,
    description VARCHAR,
    event_date TIMESTAMP WITHOUT TIME ZONE,
    initiator INTEGER REFERENCES users(user_id),
    paid BOOLEAN,
    participant_limit INTEGER,
    published_on TIMESTAMP WITHOUT TIME ZONE,
    request_moderation BOOLEAN,
    event_state VARCHAR,
    title VARCHAR,
    views INTEGER,
    CONSTRAINT  pk_event PRIMARY KEY (event_id),
    CONSTRAINT UQ_EVENT_ID UNIQUE (event_id)
);

create table if not exists locations (
    event_id integer constraint EVENT_TO_LOCATION references events on update cascade on delete cascade,
    lat NUMERIC,
    lon NUMERIC,
    CONSTRAINT LOCATIONS FOREIGN KEY (event_id) REFERENCES events (event_id)
);

CREATE TABLE IF NOT EXISTS requests(
    request_id INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    requester_id INTEGER REFERENCES users (user_id),
    event_id INTEGER REFERENCES events (event_id),
    created TIMESTAMP WITHOUT TIME ZONE,
    status VARCHAR,
    CONSTRAINT pk_request PRIMARY KEY (request_id)
);


create table if not exists compilations (
    compilation_id integer GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    title VARCHAR,
    pinned BOOLEAN,
    CONSTRAINT  pk_compilation PRIMARY KEY (compilation_id),
    CONSTRAINT UQ_COMPILATION_ID UNIQUE (compilation_id)
);

create table if not exists compilation_event (
    compilation_id INTEGER,
    event_id INTEGER,
    CONSTRAINT compilation_event_pk PRIMARY KEY (compilation_id, event_id),
    CONSTRAINT compilation_event_fk FOREIGN KEY (compilation_id) REFERENCES compilations (compilation_id) ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES events (event_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS comments (
comment_id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
created TIMESTAMP WITHOUT TIME ZONE,
text VARCHAR(255) NOT NULL,
event_id BIGINT NOT NULL,
author_id BIGINT NOT NULL,
CONSTRAINT pk_comments PRIMARY KEY (comment_id));