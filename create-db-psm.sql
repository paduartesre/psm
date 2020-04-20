----------------------------------------------------------------------------------
-- CREATE TABLE LOG MESSAGES - ANALYZE ERRORS IN LOGS OF APPLICATION -  PARSER ---
----------------------------------------------------------------------------------

DROP TABLE psm.log_messages;

CREATE TABLE psm.log_messages_proc
(
    dt_creation timestamp without time zone DEFAULT now(),
    date_log timestamp without time zone,
    log_type character varying(10) COLLATE pg_catalog."default",
    log_message character varying(500) COLLATE pg_catalog."default",
    return_code integer
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE psm.log_messages
    OWNER to psm;
	
	
---------------------------------------------------
-- CREATE TABLE PROCESS HISTORY - PROCESS IN VMs --
---------------------------------------------------

DROP TABLE psm.proc_history;

CREATE TABLE psm.proc_history
(
    dt_creation timestamp without time zone DEFAULT now(),
    date_log timestamp without time zone,
    pmem character varying(5) COLLATE pg_catalog."default",
    pcpu character varying(5) COLLATE pg_catalog."default",
    pid character varying(8) COLLATE pg_catalog."default",
    args character varying(500) COLLATE pg_catalog."default",
    test_data date DEFAULT (now() - '01:00:00'::interval)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE psm.proc_history
    OWNER to psm;
	
--------------------------------------------------------------------
-- CREATE TABLE APPLICATION SYSTEMS TO ANALYZE WEBSERVICES - URLS --
--------------------------------------------------------------------

DROP TABLE psm.name_application;

CREATE TABLE psm.name_application
(
    dt_creation timestamp without time zone NOT NULL DEFAULT now(),
    data character varying(20) COLLATE pg_catalog."default",
    code_error numeric(10,0) NOT NULL,
    system character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_name_application PRIMARY KEY (dt_creation, system)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE psm.name_application
    OWNER to psm;

	
--------------------------------------------------------------------
-- CREATE TABLE CPU PARA psmAMENTOS DOS PROCESSADORES DAS VMS --
--------------------------------------------------------------------

DROP TABLE psm.cpu;

CREATE TABLE psm.cpu
(
    dt_creation timestamp without time zone NOT NULL DEFAULT now(),
    hostname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    metric character varying(30) COLLATE pg_catalog."default" NOT NULL,
    m_value numeric(7,2),
    CONSTRAINT pk_cpu PRIMARY KEY (dt_creation, hostname, metric)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE psm.cpu
    OWNER to psm;


------------------------------------------------------
-- CREATE TABLE DISK TO ANALYZE DISK IN SERVERS --
------------------------------------------------------

-- Table: psm.disk

DROP TABLE psm.disk;

CREATE TABLE psm.disk
(
    dt_creation timestamp without time zone NOT NULL DEFAULT now(),
    hostname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    metric character varying(30) COLLATE pg_catalog."default" NOT NULL,
    ds_path character varying(50) COLLATE pg_catalog."default" NOT NULL,
    m_value bigint,
    CONSTRAINT pk_disk PRIMARY KEY (dt_creation, hostname, ds_path, metric)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE psm.disk
    OWNER to psm;
	
	
----------------------------------------------------------
-- CREATE TABLE MEMORY TO ANALYZE MEMORY IN SERVERS --
----------------------------------------------------------

DROP TABLE psm.memory;

CREATE TABLE psm.memory
(
    dt_creation timestamp without time zone NOT NULL DEFAULT now(),
    hostname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    metric character varying(30) COLLATE pg_catalog."default" NOT NULL,
    m_value bigint,
    CONSTRAINT pk_memory PRIMARY KEY (dt_creation, hostname, metric)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE psm.memory
    OWNER to psm;
	
-------------------------------------------
-- Set permission schema and role to psm --
-------------------------------------------
	
GRANT ALL ON SCHEMA psm TO psm;
SET ROLE TO psm;
