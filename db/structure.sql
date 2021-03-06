--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: article_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE article_authors (
    id integer NOT NULL,
    article_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- Name: article_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_authors_id_seq OWNED BY article_authors.id;


--
-- Name: article_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE article_tags (
    id integer NOT NULL,
    article_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: article_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_tags_id_seq OWNED BY article_tags.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE articles (
    id integer NOT NULL,
    url citext NOT NULL,
    bs_index double precision DEFAULT 0.5 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    medium_id integer
);


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authors (
    id integer NOT NULL,
    name character varying NOT NULL,
    twitter_handle character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE media (
    id integer NOT NULL,
    url character varying NOT NULL,
    name character varying,
    logo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE media_id_seq OWNED BY media.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: subscriptors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE subscriptors (
    id integer NOT NULL,
    email citext NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: subscriptors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subscriptors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subscriptors_id_seq OWNED BY subscriptors.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tags (
    id integer NOT NULL,
    name citext NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    google_id character varying NOT NULL,
    authentication_token character varying NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE votes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    article_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rating double precision NOT NULL
);


--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: article_authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_authors ALTER COLUMN id SET DEFAULT nextval('article_authors_id_seq'::regclass);


--
-- Name: article_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_tags ALTER COLUMN id SET DEFAULT nextval('article_tags_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY media ALTER COLUMN id SET DEFAULT nextval('media_id_seq'::regclass);


--
-- Name: subscriptors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptors ALTER COLUMN id SET DEFAULT nextval('subscriptors_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: article_authors article_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_authors
    ADD CONSTRAINT article_authors_pkey PRIMARY KEY (id);


--
-- Name: article_tags article_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_tags
    ADD CONSTRAINT article_tags_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: subscriptors subscriptors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptors
    ADD CONSTRAINT subscriptors_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: index_article_authors_on_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_authors_on_article_id ON article_authors USING btree (article_id);


--
-- Name: index_article_authors_on_article_id_and_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_article_authors_on_article_id_and_author_id ON article_authors USING btree (article_id, author_id);


--
-- Name: index_article_authors_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_authors_on_author_id ON article_authors USING btree (author_id);


--
-- Name: index_article_tags_on_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_tags_on_article_id ON article_tags USING btree (article_id);


--
-- Name: index_article_tags_on_article_id_and_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_article_tags_on_article_id_and_tag_id ON article_tags USING btree (article_id, tag_id);


--
-- Name: index_article_tags_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_tags_on_tag_id ON article_tags USING btree (tag_id);


--
-- Name: index_articles_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_articles_on_medium_id ON articles USING btree (medium_id);


--
-- Name: index_articles_on_url; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_articles_on_url ON articles USING btree (url);


--
-- Name: index_authors_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authors_on_name ON authors USING btree (name);


--
-- Name: index_media_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_name ON media USING btree (name);


--
-- Name: index_media_on_url; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_media_on_url ON media USING btree (url);


--
-- Name: index_subscriptors_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_subscriptors_on_email ON subscriptors USING btree (email);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tags_on_name ON tags USING btree (name);


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_authentication_token ON users USING btree (authentication_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_google_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_google_id ON users USING btree (google_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_votes_on_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_article_id ON votes USING btree (article_id);


--
-- Name: index_votes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_user_id ON votes USING btree (user_id);


--
-- Name: index_votes_on_user_id_and_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_votes_on_user_id_and_article_id ON votes USING btree (user_id, article_id);


--
-- Name: votes fk_rails_041a10f835; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT fk_rails_041a10f835 FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE;


--
-- Name: article_authors fk_rails_1b41504f0f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_authors
    ADD CONSTRAINT fk_rails_1b41504f0f FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE;


--
-- Name: articles fk_rails_47db0a7ada; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT fk_rails_47db0a7ada FOREIGN KEY (medium_id) REFERENCES media(id) ON DELETE SET NULL;


--
-- Name: article_tags fk_rails_646e8d3122; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_tags
    ADD CONSTRAINT fk_rails_646e8d3122 FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE;


--
-- Name: article_authors fk_rails_88fdd15289; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_authors
    ADD CONSTRAINT fk_rails_88fdd15289 FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE;


--
-- Name: article_tags fk_rails_b651172c61; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_tags
    ADD CONSTRAINT fk_rails_b651172c61 FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE;


--
-- Name: votes fk_rails_c9b3bef597; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT fk_rails_c9b3bef597 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20161210062100'), ('20161210064200'), ('20161210070349'), ('20161210072256'), ('20161210180133'), ('20161210180900'), ('20161210183056'), ('20161210185832'), ('20161210192027'), ('20161210234549'), ('20161210235250'), ('20161211183447'), ('20161211203556'), ('20161221021710');


