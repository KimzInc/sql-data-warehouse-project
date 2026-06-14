/*
==============================================================================================================
Create Database and Schemas
==============================================================================================================
Script Purpose
  This script creates a new database named 'datawarehouse' after checking if it already exists.
  if the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
  within the database: 'bronze', 'silver', and 'gold'. 
Warning:
  Running this script wlll drop the entire 'datawarehouse' database if it exists.
  All data in the database will be permanently deleted. Proceed with caution and ensure you have
  proper backups before running this script.

*/

--
-- PostgreSQL database dump
--

\restrict 1gTcQ8ronG9moNcZI17Afw5oZ8snFJt7eEoBKRGjxtyrchmU4QRYOpGvQlLtrcf

-- Dumped from database version 17.6 (Ubuntu 17.6-1.pgdg22.04+1)
-- Dumped by pg_dump version 17.6 (Ubuntu 17.6-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS datawarehouse;
--
-- Name: datawarehouse; Type: DATABASE; Schema: -; Owner: dwh_owner
--

CREATE DATABASE datawarehouse WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE datawarehouse OWNER TO dwh_owner;

\unrestrict 1gTcQ8ronG9moNcZI17Afw5oZ8snFJt7eEoBKRGjxtyrchmU4QRYOpGvQlLtrcf
\connect datawarehouse
\restrict 1gTcQ8ronG9moNcZI17Afw5oZ8snFJt7eEoBKRGjxtyrchmU4QRYOpGvQlLtrcf

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: bronze; Type: SCHEMA; Schema: -; Owner: dwh_owner
--

CREATE SCHEMA bronze;


ALTER SCHEMA bronze OWNER TO dwh_owner;

--
-- Name: gold; Type: SCHEMA; Schema: -; Owner: dwh_owner
--

CREATE SCHEMA gold;


ALTER SCHEMA gold OWNER TO dwh_owner;

--
-- Name: silver; Type: SCHEMA; Schema: -; Owner: dwh_owner
--

CREATE SCHEMA silver;


ALTER SCHEMA silver OWNER TO dwh_owner;

--
-- PostgreSQL database dump complete
--

\unrestrict 1gTcQ8ronG9moNcZI17Afw5oZ8snFJt7eEoBKRGjxtyrchmU4QRYOpGvQlLtrcf

