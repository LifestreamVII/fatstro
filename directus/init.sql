-- directus/init.sql
-- Seed database for directus/directus:10.8.3 (SQLite3).
-- Run once on a fresh database:
--   sqlite3 /directus/database/data.db < /directus/init.sql

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- ── Migrations ───────────────────────────────────────────────────────────────
-- Directus checks this table on startup to decide which migrations to apply.
-- Providing the full list prevents re-running migrations on every container start.

CREATE TABLE `directus_migrations` (
  `version`   varchar(255) not null,
  `name`      varchar(255) not null,
  `timestamp` datetime default CURRENT_TIMESTAMP,
  primary key (`version`)
);

INSERT INTO directus_migrations VALUES('20201028A','Remove Collection Foreign Keys','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20201029A','Remove System Relations','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20201029B','Remove System Collections','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20201029C','Remove System Fields','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20201105A','Add Cascade System Relations','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20201105B','Change Webhook URL Type','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20210225A','Add Relations Sort Field','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20210304A','Remove Locked Fields','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20210312A','Webhooks Collections Text','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20210331A','Add Refresh Interval','2024-01-19 11:52:54');
INSERT INTO directus_migrations VALUES('20210415A','Make Filesize Nullable','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210416A','Add Collections Accountability','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210422A','Remove Files Interface','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210506A','Rename Interfaces','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210510A','Restructure Relations','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210518A','Add Foreign Key Constraints','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210519A','Add System Fk Triggers','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210521A','Add Collections Icon Color','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210525A','Add Insights','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210608A','Add Deep Clone Config','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210626A','Change Filesize Bigint','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210716A','Add Conditions to Fields','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210721A','Add Default Folder','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210802A','Replace Groups','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210803A','Add Required to Fields','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210805A','Update Groups','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210805B','Change Image Metadata Structure','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210811A','Add Geometry Config','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210831A','Remove Limit Column','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210903A','Add Auth Provider','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210907A','Webhooks Collections Not Null','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210910A','Move Module Setup','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210920A','Webhooks URL Not Null','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210924A','Add Collection Organization','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210927A','Replace Fields Group','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210927B','Replace M2M Interface','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20210929A','Rename Login Action','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20211007A','Update Presets','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20211009A','Add Auth Data','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20211016A','Add Webhook Headers','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20211103A','Set Unique to User Token','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20211103B','Update Special Geometry','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20211104A','Remove Collections Listing','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20211118A','Add Notifications','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20211211A','Add Shares','2024-01-19 11:52:55');
INSERT INTO directus_migrations VALUES('20211230A','Add Project Descriptor','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220303A','Remove Default Project Color','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220308A','Add Bookmark Icon and Color','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220314A','Add Translation Strings','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220322A','Rename Field Typecast Flags','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220323A','Add Field Validation','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220325A','Fix Typecast Flags','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220325B','Add Default Language','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220402A','Remove Default Value Panel Icon','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220429A','Add Flows','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220429B','Add Color to Insights Icon','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220429C','Drop Non Null From IP of Activity','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220429D','Drop Non Null From Sender of Notifications','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220614A','Rename Hook Trigger to Event','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220801A','Update Notifications Timestamp Column','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220802A','Add Custom Aspect Ratios','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20220826A','Add Origin to Accountability','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20230401A','Update Material Icons','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20230525A','Add Preview Settings','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20230526A','Migrate Translation Strings','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20230721A','Require Shares Fields','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20230823A','Add Content Versioning','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20230927A','Themes','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20231009A','Update CSV Fields to Text','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20231009B','Update Panel Options','2024-01-19 11:52:56');
INSERT INTO directus_migrations VALUES('20231010A','Add Extensions','2024-01-19 11:52:56');

-- ── Roles ─────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS "directus_roles" (
  `id`           char(36) NOT NULL,
  `name`         varchar(100) NOT NULL,
  `icon`         varchar(30) NOT NULL DEFAULT 'supervised_user_circle',
  `description`  text,
  `ip_access`    text,
  `enforce_tfa`  boolean NOT NULL DEFAULT '0',
  `admin_access` boolean NOT NULL DEFAULT '0',
  `app_access`   boolean NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
);

INSERT INTO directus_roles VALUES('0572bb14-796b-4f49-a24e-2970be7d7461','Administrator','verified','$t:admin_description',NULL,0,1,1);

-- ── Users ─────────────────────────────────────────────────────────────────────
-- Password: d1r3ctu5 (Argon2id hash of the documented demo password — no live secrets)

CREATE TABLE IF NOT EXISTS "directus_users" (
  `id`                  char(36) NOT NULL,
  `first_name`          varchar(50),
  `last_name`           varchar(50),
  `email`               varchar(128),
  `password`            varchar(255),
  `location`            varchar(255),
  `title`               varchar(50),
  `description`         text,
  `tags`                json,
  `avatar`              char(36),
  `language`            varchar(255) DEFAULT null,
  `tfa_secret`          varchar(255),
  `status`              varchar(16) NOT NULL DEFAULT 'active',
  `role`                char(36),
  `token`               varchar(255),
  `last_access`         datetime,
  `last_page`           varchar(255),
  `provider`            varchar(128) NOT NULL DEFAULT 'default',
  `external_identifier` varchar(255),
  `auth_data`           json,
  `email_notifications` boolean DEFAULT '1',
  `appearance`          varchar(255),
  `theme_dark`          varchar(255),
  `theme_light`         varchar(255),
  `theme_light_overrides` json,
  `theme_dark_overrides`  json,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL
);

INSERT INTO directus_users VALUES(
  '7aa83f90-9068-486a-93cc-4e9119fd935e',
  'Admin','User','admin@example.com',
  '$argon2id$v=19$m=65536,t=3,p=4$41a+WF9MFpXCMwC1XLi2Iw$rfv1uVh91TMbg+I3Cp7UCS5Um+EAUwtBVSfPcC1SoLQ',
  NULL,NULL,NULL,NULL,NULL,NULL,NULL,
  'active',
  '0572bb14-796b-4f49-a24e-2970be7d7461',
  NULL,1782714562857,'/content/Posts','default',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL
);

-- ── Folders (empty — no folders were created) ─────────────────────────────────

CREATE TABLE IF NOT EXISTS "directus_folders" (
  `id`     char(36) NOT NULL,
  `name`   varchar(255) NOT NULL,
  `parent` char(36),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`parent`) REFERENCES `directus_folders` (`id`)
);

-- ── Files ─────────────────────────────────────────────────────────────────────
-- Three image files referenced by Posts.image.
-- Physical files are downloaded by init-uploads.sh at container startup.

CREATE TABLE IF NOT EXISTS "directus_files" (
  `id`                char(36) NOT NULL,
  `storage`           varchar(255) NOT NULL,
  `filename_disk`     varchar(255),
  `filename_download` varchar(255) NOT NULL,
  `title`             varchar(255),
  `type`              varchar(255),
  `folder`            char(36),
  `uploaded_by`       char(36),
  `uploaded_on`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by`       char(36),
  `modified_on`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `charset`           varchar(50),
  `filesize`          bigint DEFAULT null,
  `width`             integer,
  `height`            integer,
  `duration`          integer,
  `embed`             varchar(200),
  `description`       text,
  `location`          text,
  `tags`              text,
  `metadata`          json,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`uploaded_by`) REFERENCES `directus_users` (`id`),
  FOREIGN KEY (`modified_by`) REFERENCES `directus_users` (`id`),
  FOREIGN KEY (`folder`)      REFERENCES `directus_folders` (`id`) ON DELETE SET NULL
);

INSERT INTO directus_files VALUES(
  '2c5d3509-77ed-43ec-b0bc-7c267dbd434b','local',
  '2c5d3509-77ed-43ec-b0bc-7c267dbd434b.jpeg','becoming-a-productive-rabbit.jpeg',
  'Becoming a Productive Rabbit.jpeg','image/jpeg',
  NULL,'7aa83f90-9068-486a-93cc-4e9119fd935e','2024-01-19 14:35:52',
  NULL,1705674952302,NULL,623216,3072,2048,NULL,NULL,NULL,NULL,NULL,'{}'
);
INSERT INTO directus_files VALUES(
  'be5f1382-41ff-47ee-bcc0-9db0397b3973','local',
  'be5f1382-41ff-47ee-bcc0-9db0397b3973.jpeg','rabbit-facts.jpeg',
  'Rabbit Facts.jpeg','image/jpeg',
  NULL,'7aa83f90-9068-486a-93cc-4e9119fd935e','2024-01-19 21:22:35',
  NULL,1705699355321,NULL,436449,3072,2048,NULL,NULL,NULL,NULL,NULL,'{}'
);
INSERT INTO directus_files VALUES(
  '4054c42b-3a42-4038-ab02-76925a2d9936','local',
  '4054c42b-3a42-4038-ab02-76925a2d9936.jpeg','steampunk-rabbits.jpeg',
  'Steampunk Rabbits.jpeg','image/jpeg',
  NULL,'7aa83f90-9068-486a-93cc-4e9119fd935e','2024-01-19 21:24:51',
  NULL,1705699491623,NULL,381556,3072,2048,NULL,NULL,NULL,NULL,NULL,'{}'
);

-- ── Collections ───────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS "directus_collections" (
  `collection`             varchar(64) NOT NULL,
  `icon`                   varchar(30),
  `note`                   text,
  `display_template`       varchar(255),
  `hidden`                 boolean NOT NULL DEFAULT '0',
  `singleton`              boolean NOT NULL DEFAULT '0',
  `translations`           json,
  `archive_field`          varchar(64),
  `archive_app_filter`     boolean NOT NULL DEFAULT '1',
  `archive_value`          varchar(255),
  `unarchive_value`        varchar(255),
  `sort_field`             varchar(64),
  `accountability`         varchar(255) DEFAULT 'all',
  `color`                  varchar(255) NULL,
  `item_duplication_fields` json NULL,
  `sort`                   integer,
  `group`                  varchar(64),
  `collapse`               varchar(255) NOT NULL DEFAULT 'open',
  `preview_url`            varchar(255) null,
  `versioning`             boolean not null default '0',
  PRIMARY KEY (`collection`),
  FOREIGN KEY (`group`) REFERENCES `directus_collections` (`collection`)
);

INSERT INTO directus_collections VALUES('global',NULL,NULL,NULL,0,1,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,NULL,NULL,'open',NULL,0);
INSERT INTO directus_collections VALUES('pages', NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,NULL,NULL,'open',NULL,0);
INSERT INTO directus_collections VALUES('authors',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,NULL,NULL,'open',NULL,0);
INSERT INTO directus_collections VALUES('Posts', NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,NULL,NULL,'open',NULL,0);

-- ── Fields ────────────────────────────────────────────────────────────────────
-- Note: ID 12 ('Posts','Image') was deleted and superseded by ID 13 ('Posts','image').

CREATE TABLE IF NOT EXISTS "directus_fields" (
  `id`                 integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `collection`         varchar(64) NOT NULL,
  `field`              varchar(64) NOT NULL,
  `special`            varchar(64),
  `interface`          varchar(64),
  `options`            json,
  `display`            varchar(64),
  `display_options`    json,
  `readonly`           boolean NOT NULL DEFAULT '0',
  `hidden`             boolean NOT NULL DEFAULT '0',
  `sort`               integer,
  `width`              varchar(30) DEFAULT 'full',
  `translations`       json,
  `note`               text,
  `conditions`         json,
  `required`           boolean DEFAULT '0',
  `group`              varchar(64),
  `validation`         json,
  `validation_message` text
);

INSERT INTO directus_fields VALUES(1, 'global', 'id',           NULL,                    'input',                NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(2, 'global', 'title',        NULL,                    'input',                NULL,NULL,NULL,0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(3, 'global', 'description',  NULL,                    'input',                NULL,NULL,NULL,0,0,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(4, 'pages',  'slug',         NULL,                    'input',                NULL,NULL,NULL,0,0,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(5, 'pages',  'title',        NULL,                    'input',                NULL,NULL,NULL,0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(6, 'pages',  'content',      NULL,                    'input-rich-text-html', NULL,NULL,NULL,0,0,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(7, 'authors','id',           NULL,                    'input',                NULL,NULL,NULL,1,1,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(8, 'authors','name',         NULL,                    'input',                NULL,NULL,NULL,0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(9, 'Posts',  'slug',         NULL,                    'input',                NULL,NULL,NULL,0,0,1,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(10,'Posts',  'title',        NULL,                    'input',                NULL,NULL,NULL,0,0,2,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(11,'Posts',  'content',      NULL,                    'input-rich-text-html', NULL,NULL,NULL,0,0,3,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(13,'Posts',  'image',        'file',                  'file-image',           NULL,NULL,NULL,0,0,4,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(14,'Posts',  'publish_date', NULL,                    'datetime',             NULL,NULL,NULL,0,0,5,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO directus_fields VALUES(15,'Posts',  'author',       'm2o',                   'select-dropdown-m2o',  NULL,NULL,NULL,0,0,6,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);

-- ── Relations ─────────────────────────────────────────────────────────────────
-- IDs start at 2 because relation 1 was deleted during schema evolution.

CREATE TABLE IF NOT EXISTS "directus_relations" (
  `id`                    integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `many_collection`       varchar(64) NOT NULL,
  `many_field`            varchar(64) NOT NULL,
  `one_collection`        varchar(64),
  `one_field`             varchar(64),
  `one_collection_field`  varchar(64),
  `one_allowed_collections` text,
  `junction_field`        varchar(64),
  `sort_field`            varchar(64),
  `one_deselect_action`   varchar(255) NOT NULL DEFAULT 'nullify'
);

INSERT INTO directus_relations VALUES(2,'Posts','image', 'directus_files',NULL,NULL,NULL,NULL,NULL,'nullify');
INSERT INTO directus_relations VALUES(3,'Posts','author','authors',        NULL,NULL,NULL,NULL,NULL,'nullify');

-- ── Permissions ───────────────────────────────────────────────────────────────
-- All 21 rows grant public (role=NULL) access to every collection and action,
-- matching the demo site's fully-open configuration.

CREATE TABLE IF NOT EXISTS "directus_permissions" (
  `id`          integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `role`        char(36),
  `collection`  varchar(64) NOT NULL,
  `action`      varchar(10) NOT NULL,
  `permissions` json,
  `validation`  json,
  `presets`     json,
  `fields`      text,
  FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE
);

INSERT INTO directus_permissions VALUES(1, NULL,'global',         'read',  '{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(2, NULL,'pages',          'read',  '{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(3, NULL,'authors',        'read',  '{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(4, NULL,'Posts',          'read',  '{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(5, NULL,'directus_files', 'read',  '{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(6, NULL,'Posts',          'update','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(7, NULL,'Posts',          'delete','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(8, NULL,'Posts',          'share', '{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(9, NULL,'Posts',          'create','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(10,NULL,'authors',        'create','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(11,NULL,'authors',        'update','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(12,NULL,'authors',        'delete','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(13,NULL,'authors',        'share', '{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(14,NULL,'global',         'share', '{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(15,NULL,'global',         'delete','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(16,NULL,'global',         'update','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(17,NULL,'global',         'create','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(18,NULL,'pages',          'update','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(19,NULL,'pages',          'create','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(20,NULL,'pages',          'delete','{}','{}',NULL,'*');
INSERT INTO directus_permissions VALUES(21,NULL,'pages',          'share', '{}','{}',NULL,'*');

-- ── Empty system tables (DDL only — no data rows needed) ──────────────────────

CREATE TABLE IF NOT EXISTS "directus_settings" (
  `id`                     integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `project_name`           varchar(100) NOT NULL DEFAULT 'Directus',
  `project_url`            varchar(255),
  `project_color`          varchar(255) NOT NULL DEFAULT '#6644FF',
  `project_logo`           char(36),
  `public_foreground`      char(36),
  `public_background`      char(36),
  `public_note`            text,
  `auth_login_attempts`    integer DEFAULT '25',
  `auth_password_policy`   varchar(100),
  `storage_asset_transform` varchar(7) DEFAULT 'all',
  `storage_asset_presets`  json,
  `custom_css`             text,
  `storage_default_folder` char(36),
  `basemaps`               json,
  `mapbox_key`             varchar(255),
  `module_bar`             json,
  `project_descriptor`     varchar(100) NULL,
  `default_language`       varchar(255) NOT NULL DEFAULT 'en-US',
  `custom_aspect_ratios`   json,
  `public_favicon`         char(36),
  `default_appearance`     varchar(255) NOT NULL DEFAULT 'auto',
  `default_theme_light`    varchar(255),
  `theme_light_overrides`  json,
  `default_theme_dark`     varchar(255),
  `theme_dark_overrides`   json,
  FOREIGN KEY (`project_logo`)           REFERENCES `directus_files` (`id`),
  FOREIGN KEY (`public_foreground`)      REFERENCES `directus_files` (`id`),
  FOREIGN KEY (`public_background`)      REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_storage_default_folder_foreign`
    FOREIGN KEY (`storage_default_folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL,
  FOREIGN KEY (`public_favicon`)         REFERENCES `directus_files` (`id`)
);

CREATE TABLE IF NOT EXISTS "directus_shares" (
  `id`           char(36) NOT NULL,
  `name`         varchar(255),
  `collection`   varchar(64) NOT NULL,
  `item`         varchar(255) NOT NULL,
  `role`         char(36),
  `password`     varchar(255),
  `user_created` char(36),
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_start`   datetime NULL DEFAULT null,
  `date_end`     datetime NULL DEFAULT null,
  `times_used`   integer DEFAULT '0',
  `max_uses`     integer,
  FOREIGN KEY (`collection`)   REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  FOREIGN KEY (`role`)         REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS "directus_sessions" (
  `token`      varchar(64) NOT NULL,
  `user`       char(36),
  `expires`    datetime NOT NULL,
  `ip`         varchar(255),
  `user_agent` varchar(255),
  `share`      char(36),
  `origin`     varchar(255) null,
  PRIMARY KEY (`token`),
  FOREIGN KEY (`user`)  REFERENCES `directus_users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`share`) REFERENCES `directus_shares` (`id`) ON DELETE CASCADE
);

CREATE TABLE `directus_dashboards` (
  `id`           char(36) not null,
  `name`         varchar(255) not null,
  `icon`         varchar(30) not null default 'dashboard',
  `note`         text,
  `date_created` datetime default CURRENT_TIMESTAMP,
  `user_created` char(36),
  `color`        varchar(255) null,
  foreign key(`user_created`) references `directus_users`(`id`) on delete SET NULL,
  primary key (`id`)
);

CREATE TABLE IF NOT EXISTS "directus_panels" (
  `id`           char(36) NOT NULL,
  `dashboard`    char(36) NOT NULL,
  `name`         varchar(255),
  `icon`         varchar(30) DEFAULT null,
  `color`        varchar(10),
  `show_header`  boolean NOT NULL DEFAULT '0',
  `note`         text,
  `type`         varchar(255) NOT NULL,
  `position_x`  integer NOT NULL,
  `position_y`  integer NOT NULL,
  `width`        integer NOT NULL,
  `height`       integer NOT NULL,
  `options`      json,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36),
  FOREIGN KEY (`dashboard`)    REFERENCES `directus_dashboards` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `directus_flows` (
  `id`             char(36) not null,
  `name`           varchar(255) not null,
  `icon`           varchar(30),
  `color`          varchar(255) null,
  `description`    text,
  `status`         varchar(255) not null default 'active',
  `trigger`        varchar(255),
  `accountability` varchar(255) default 'all',
  `options`        json,
  `operation`      char(36),
  `date_created`   datetime default CURRENT_TIMESTAMP,
  `user_created`   char(36),
  foreign key(`user_created`) references `directus_users`(`id`) on delete SET NULL,
  primary key (`id`)
);

CREATE TABLE `directus_operations` (
  `id`           char(36) not null,
  `name`         varchar(255),
  `key`          varchar(255) not null,
  `type`         varchar(255) not null,
  `position_x`  integer not null,
  `position_y`  integer not null,
  `options`      json,
  `resolve`      char(36),
  `reject`       char(36),
  `flow`         char(36) not null,
  `date_created` datetime default CURRENT_TIMESTAMP,
  `user_created` char(36),
  foreign key(`resolve`)      references `directus_operations`(`id`),
  foreign key(`reject`)       references `directus_operations`(`id`),
  foreign key(`flow`)         references `directus_flows`(`id`) on delete CASCADE,
  foreign key(`user_created`) references `directus_users`(`id`) on delete SET NULL,
  primary key (`id`)
);

CREATE TABLE IF NOT EXISTS "directus_webhooks" (
  `id`          integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name`        varchar(255) NOT NULL,
  `method`      varchar(10) NOT NULL DEFAULT 'POST',
  `url`         varchar(255) NOT NULL,
  `status`      varchar(10) NOT NULL DEFAULT 'active',
  `data`        boolean NOT NULL DEFAULT '1',
  `actions`     varchar(100) NOT NULL,
  `collections` varchar(255) NOT NULL,
  `headers`     json
);

CREATE TABLE IF NOT EXISTS "directus_activity" (
  `id`         integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `action`     varchar(45) NOT NULL,
  `user`       char(36),
  `timestamp`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip`         varchar(50),
  `user_agent` varchar(255),
  `collection` varchar(64) NOT NULL,
  `item`       varchar(255) NOT NULL,
  `comment`    text,
  `origin`     varchar(255) null
);

CREATE TABLE IF NOT EXISTS "directus_notifications" (
  `id`         integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `timestamp`  datetime DEFAULT CURRENT_TIMESTAMP,
  `status`     varchar(255) DEFAULT 'inbox',
  `recipient`  char(36) NOT NULL,
  `sender`     char(36),
  `subject`    varchar(255) NOT NULL,
  `message`    text,
  `collection` varchar(64),
  `item`       varchar(255),
  FOREIGN KEY (`recipient`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`sender`)    REFERENCES `directus_users` (`id`)
);

CREATE TABLE IF NOT EXISTS "directus_presets" (
  `id`              integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `bookmark`        varchar(255),
  `user`            char(36),
  `role`            char(36),
  `collection`      varchar(64),
  `search`          varchar(100),
  `layout`          varchar(100) DEFAULT 'tabular',
  `layout_query`    json,
  `layout_options`  json,
  `refresh_interval` integer,
  `filter`          json,
  `icon`            varchar(30) DEFAULT 'bookmark',
  `color`           varchar(255) NULL,
  FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE
);

CREATE TABLE `directus_translations` (
  `id`       char(36) not null,
  `language` varchar(255) not null,
  `key`      varchar(255) not null,
  `value`    text not null,
  primary key (`id`)
);

CREATE TABLE IF NOT EXISTS "directus_versions" (
  `id`           char(36) not null,
  `key`          varchar(64) not null,
  `name`         varchar(255),
  `collection`   varchar(64) not null,
  `item`         varchar(255) not null,
  `hash`         varchar(255),
  `date_created` datetime default CURRENT_TIMESTAMP,
  `date_updated` datetime default CURRENT_TIMESTAMP,
  `user_created` char(36),
  `user_updated` char(36),
  foreign key(`collection`)   references `directus_collections`(`collection`) on delete CASCADE,
  foreign key(`user_created`) references `directus_users`(`id`) on delete SET NULL,
  foreign key(`user_updated`) references `directus_users`(`id`),
  primary key (`id`)
);

CREATE TABLE IF NOT EXISTS "directus_revisions" (
  `id`         integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `activity`   integer NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item`       varchar(255) NOT NULL,
  `data`       json,
  `delta`      json,
  `parent`     integer,
  `version`    char(36),
  FOREIGN KEY (`parent`)   REFERENCES `directus_revisions` (`id`),
  FOREIGN KEY (`activity`) REFERENCES `directus_activity` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`version`)  REFERENCES `directus_versions` (`id`) ON DELETE CASCADE
);

CREATE TABLE `directus_extensions` (
  `name`    varchar(255) not null,
  `enabled` boolean not null default '1',
  primary key (`name`)
);

-- ── Custom collections ────────────────────────────────────────────────────────

CREATE TABLE `global` (
  `id`          integer not null primary key autoincrement,
  `title`       varchar(255) null,
  `description` varchar(255) null
);

INSERT INTO global VALUES(1,'Hugo Directus Site','This is a demo site illustrating how you can integrate Hugo with Directus.');

CREATE TABLE `pages` (
  `slug`    varchar(255) not null,
  `title`   varchar(255) null,
  `content` text null,
  primary key (`slug`)
);

INSERT INTO pages VALUES('about','About Us','<p>Directus is an Open Data Platform purpose-built for democratizing the world''s data. By staying small and agile, we remain completely focused on the product itself, avoiding the financial trap that often comes with taking on capital too early and concentrating solely on sales and rapid expansion. We believe in stable, informed growth, with every decision based on real-world usage and research.</p>
<h2>A team of passionate creators</h2>
<p>We are a team of developers, designers, innovators, and entrepreneurs, all laser-focused on building something truly amazing.</p>
<h2>An all-remote team</h2>
<p>Our team is 100% remote, with flexible working hours, asynchronous communication, and the freedom to work from anywhere that has a reliable internet connection.</p>
<h2>International by design</h2>
<p>To build a global platform, you need a global team. It''s no accident that our talented, diverse, and multilingual team is distributed around the entire world.</p>
<h2>Contributor-first hiring</h2>
<p>Many of our hires start off as contributors, so they are already familiar with our codebase, understand the pull request flow, and are engaged in open-source.</p>');

INSERT INTO pages VALUES('conduct','Code Of Conduct','<h2 id="our-pledge">Our Pledge</h2>
<p>We as members, contributors, and leaders pledge to make participation in our community a harassment-free experience for everyone, regardless of age, body size, visible or invisible disability, ethnicity, sex characteristics, gender identity and expression, level of experience, education, socio-economic status, nationality, personal appearance, race, caste, color, religion, or sexual identity and orientation.</p>
<p>We pledge to act and interact in ways that contribute to an open, welcoming, diverse, inclusive, and healthy community.</p>
<h2 id="our-standards">Our Standards</h2>
<p>Examples of behavior that contributes to a positive environment for our community include:</p>
<ul>
<li>Demonstrating empathy and kindness toward other people</li>
<li>Being respectful of differing opinions, viewpoints, and experiences</li>
<li>Giving and gracefully accepting constructive feedback</li>
<li>Accepting responsibility and apologizing to those affected by our mistakes, and learning from the experience</li>
<li>Focusing on what is best not just for us as individuals, but for the overall community</li>
</ul>
<p>Examples of unacceptable behavior include:</p>
<ul>
<li>The use of sexualized language or imagery, and sexual attention or advances of any kind</li>
<li>Trolling, insulting or derogatory comments, and personal or political attacks</li>
<li>Public or private harassment</li>
<li>Publishing others&rsquo; private information, such as a physical or email address, without their explicit permission</li>
<li>Other conduct which could reasonably be considered inappropriate in a professional setting</li>
</ul>
<h2 id="enforcement-responsibilities">Enforcement Responsibilities</h2>
<p>Community leaders are responsible for clarifying and enforcing our standards of acceptable behavior and will take appropriate and fair corrective action in response to any behavior that they deem inappropriate, threatening, offensive, or harmful.</p>
<p>Community leaders have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct, and will communicate reasons for moderation decisions when appropriate.</p>
<h2 id="scope">Scope</h2>
<p>This Code of Conduct applies within all community spaces, and also applies when an individual is officially representing the community in public spaces. Examples of representing our community include using an official e-mail address, posting via an official social media account, or acting as an appointed representative at an online or offline event.</p>
<h2 id="enforcement">Enforcement</h2>
<p>Instances of abusive, harassing, or otherwise unacceptable behavior may be reported to the community leaders responsible for enforcement at [INSERT CONTACT METHOD]. All complaints will be reviewed and investigated promptly and fairly.</p>
<p>All community leaders are obligated to respect the privacy and security of the reporter of any incident.</p>
<h2 id="enforcement-guidelines">Enforcement Guidelines</h2>
<p>Community leaders will follow these Community Impact Guidelines in determining the consequences for any action they deem in violation of this Code of Conduct:</p>
<h3 id="1-correction">1. Correction</h3>
<p><strong>Community Impact</strong>: Use of inappropriate language or other behavior deemed unprofessional or unwelcome in the community.</p>
<p><strong>Consequence</strong>: A private, written warning from community leaders, providing clarity around the nature of the violation and an explanation of why the behavior was inappropriate. A public apology may be requested.</p>
<h3 id="2-warning">2. Warning</h3>
<p><strong>Community Impact</strong>: A violation through a single incident or series of actions.</p>
<p><strong>Consequence</strong>: A warning with consequences for continued behavior. No interaction with the people involved, including unsolicited interaction with those enforcing the Code of Conduct, for a specified period of time. This includes avoiding interactions in community spaces as well as external channels like social media. Violating these terms may lead to a temporary or permanent ban.</p>
<h3 id="3-temporary-ban">3. Temporary Ban</h3>
<p><strong>Community Impact</strong>: A serious violation of community standards, including sustained inappropriate behavior.</p>
<p><strong>Consequence</strong>: A temporary ban from any sort of interaction or public communication with the community for a specified period of time. No public or private interaction with the people involved, including unsolicited interaction with those enforcing the Code of Conduct, is allowed during this period. Violating these terms may lead to a permanent ban.</p>
<h3 id="4-permanent-ban">4. Permanent Ban</h3>
<p><strong>Community Impact</strong>: Demonstrating a pattern of violation of community standards, including sustained inappropriate behavior, harassment of an individual, or aggression toward or disparagement of classes of individuals.</p>
<p><strong>Consequence</strong>: A permanent ban from any sort of public interaction within the community.</p>
<h2 id="attribution">Attribution</h2>
<p>This Code of Conduct is adapted from the <a href="https://www.contributor-covenant.org">Contributor Covenant</a>, version 2.1, available at <a href="https://www.contributor-covenant.org/version/2/1/code_of_conduct.html">https://www.contributor-covenant.org/version/2/1/code_of_conduct.html</a>.</p>
<p>Community Impact Guidelines were inspired by <a href="https://github.com/mozilla/diversity">Mozilla&rsquo;s code of conduct enforcement ladder</a>.</p>
<p>For answers to common questions about this code of conduct, see the FAQ at <a href="https://www.contributor-covenant.org/faq">https://www.contributor-covenant.org/faq</a>. Translations are available at <a href="https://www.contributor-covenant.org/translations">https://www.contributor-covenant.org/translations</a>.</p>');

INSERT INTO pages VALUES('privacy','Privacy Policy','<h2>Information that is gathered from visitors</h2>
<p>In common with other websites, log files are stored on the web server saving details such as the visitor''s IP address, browser type, referring page and time of visit.</p>
<p>Cookies may be used to remember visitor preferences when interacting with the website.</p>
<p>Where registration is required, the visitor''s email and a username will be stored on the server.</p>
<h2>How the Information is used</h2>
<p>The information is used to enhance the vistor''s experience when using the website to display personalised content and possibly advertising.</p>
<p>E-mail addresses will not be sold, rented or leased to 3rd parties.</p>
<p>E-mail may be sent to inform you of news of our services or offers by us or our affiliates.</p>
<h2>Visitor Options</h2>
<p>If you have subscribed to one of our services, you may unsubscribe by following the instructions which are included in e-mail that you receive.</p>
<p>You may be able to block cookies via your browser settings but this may prevent you from access to certain features of the website.</p>
<h2>Cookies</h2>
<p>Cookies are small digital signature files that are stored by your web browser that allow your preferences to be recorded when visiting the website. Also they may be used to track your return visits to the website.</p>
<p>3rd party advertising companies may also use cookies for tracking purposes.</p>
<h2>Google Ads</h2>
<p>Google, as a third party vendor, uses cookies to serve ads.</p>
<p>Google''s use of the DART cookie enables it to serve ads to visitors based on their visit to sites they visit on the Internet.</p>
<p>Website visitors may opt out of the use of the DART cookie by visiting the Google ad and content network privacy policy.</p>');

CREATE TABLE `authors` (
  `id`   integer not null primary key autoincrement,
  `name` varchar(255) null
);

INSERT INTO authors VALUES(1,'Alex');
INSERT INTO authors VALUES(2,'Freida');

CREATE TABLE IF NOT EXISTS "Posts" (
  `slug`         varchar(255) NOT NULL,
  `title`        varchar(255) NULL,
  `content`      text NULL,
  `image`        char(36) NULL,
  `publish_date` date NULL,
  `author`       integer NULL,
  PRIMARY KEY (`slug`),
  CONSTRAINT `posts_image_foreign`
    FOREIGN KEY (`image`)  REFERENCES `directus_files` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_author_foreign`
    FOREIGN KEY (`author`) REFERENCES `authors` (`id`) ON DELETE SET NULL
);

INSERT INTO Posts VALUES(
  'becoming-a-productive-rabbit',
  'How To Become A Very Productive Rabbit',
  '<p>Rabbits are known for their quickness and agility, but did you know they can also be incredibly productive? Here are a few tips to help you become the most productive rabbit you can be:</p>
<ol>
<li>
<p>Set clear goals. Determine what you want to achieve and make a plan to reach your goals.</p>
</li>
<li>
<p>Use your natural abilities. Rabbits are quick, so use that speed to your advantage by completing tasks quickly and efficiently.</p>
</li>
<li>
<p>Stay organized. Keep your burrow neat and tidy so you can quickly find what you need when you need it.</p>
</li>
<li>
<p>Take breaks. Despite their reputation for being quick, rabbits need breaks too. Take short hops to stretch your legs and rest your mind.</p>
</li>
<li>
<p>Surround yourself with positive influences. Make friends with other productive rabbits and learn from their habits.</p>
</li>
</ol>
<p>By following these tips, you''ll be well on your way to becoming the most productive rabbit you can be. So, get hopping and get things done!</p>
<p><img src="http://localhost:8055/assets/4054c42b-3a42-4038-ab02-76925a2d9936?width=3072&amp;height=2048" alt="Steampunk Rabbits.jpeg"></p>',
  '2c5d3509-77ed-43ec-b0bc-7c267dbd434b',
  1672531200000,
  2
);

INSERT INTO Posts VALUES(
  'rabbit-facts',
  'Rabbits Facts That Will Blow Your Mind',
  '<p>Rabbits are not just cute and cuddly, they are also talented singers! These furry creatures have a unique vocalization that is surprisingly melodic. When they''re happy, they''ll belt out a series of melodic trills that will make even the least musical person want to join in.</p>
<p>Another mind-blowing fact about rabbits is that they are incredibly fast runners. They can reach speeds of up to 45 miles per hour, which is faster than most people can run! This makes them excellent at escaping danger and ensuring their survival.</p>
<p>Did you know that rabbits have excellent eyesight? They have 360-degree vision, which allows them to see predators coming from any direction. This is why it''s so hard to sneak up on a rabbit in the wild!</p>
<p>Rabbits are also incredibly clean animals. They spend hours grooming themselves, and they''ll even clean their friends to show them affection. This behavior not only helps them stay clean, but it also strengthens their bonds with one another.</p>
<p>These are just a few of the many amazing facts about rabbits. If you''re a fan of these cute and cuddly creatures, be sure to share these fun facts with your friends</p>',
  'be5f1382-41ff-47ee-bcc0-9db0397b3973',
  1675296000000,
  1
);

INSERT INTO Posts VALUES(
  'steampunk-rabbits',
  'Why Steampunk Rabbits Are The Future Of Work',
  '<p>Steampunk rabbits, with their blend of mechanical and organic abilities, are the perfect representation of the future of work. In a world where automation and technology are constantly advancing, these unique creatures embody the perfect balance between human and machine. They possess a level of dexterity, intelligence, and problem-solving skills that allow them to take on tasks previously only performed by humans.</p>
<p>Not only do steampunk rabbits have the ability to work tirelessly without rest, but they also possess a level of creativity and innovation that is unmatched by traditional machines. Their unique design, combined with their adaptability and resourcefulness, make them the ideal candidate for a wide range of industries.</p>
<p>From manufacturing to finance, steampunk rabbits are already making a big impact in the world of work. They have the ability to learn new skills quickly and can easily adapt to new tasks and environments. They are also able to work in hazardous conditions that would be too dangerous for humans.</p>
<p>In addition to their practical benefits, steampunk rabbits also bring a level of excitement and novelty to the workplace. Their unique appearance and mechanical abilities have already captured the hearts of many and are sure to continue to do so in the future.</p>
<p>So, why are steampunk rabbits the future of work? Simply put, they offer a perfect balance of efficiency, adaptability, and creativity that is unmatched by any other form of technology. If you haven''t already, it''s time to embrace this unique and exciting new breed of worker.</p>',
  '4054c42b-3a42-4038-ab02-76925a2d9936',
  1677801600000,
  2
);

INSERT INTO Posts VALUES(
  'about',
  'About Us',
  '<p>Directus is an Open Data Platform purpose-built for democratizing the world''s data. By staying small and agile, we remain completely focused on the product itself, avoiding the financial trap that often comes with taking on capital too early and concentrating solely on sales and rapid expansion. We believe in stable, informed growth, with every decision based on real-world usage and research.</p>
<h2>A team of passionate creators</h2>
<p>We are a team of developers, designers, innovators, and entrepreneurs, all laser-focused on building something truly amazing.</p>
<h2>An all-remote team</h2>
<p>Our team is 100% remote, with flexible working hours, asynchronous communication, and the freedom to work from anywhere that has a reliable internet connection.</p>
<h2>International by design</h2>
<p>To build a global platform, you need a global team. It''s no accident that our talented, diverse, and multilingual team is distributed around the entire world.</p>
<h2>Contributor-first hiring</h2>
<p>Many of our hires start off as contributors, so they are already familiar with our codebase, understand the pull request flow, and are engaged in open-source.</p>',
  NULL,
  1782691200000,
  1
);

-- ── Unique indexes ────────────────────────────────────────────────────────────

CREATE UNIQUE INDEX `directus_flows_operation_unique`      on `directus_flows`      (`operation`);
CREATE UNIQUE INDEX `directus_operations_resolve_unique`   on `directus_operations` (`resolve`);
CREATE UNIQUE INDEX `directus_operations_reject_unique`    on `directus_operations` (`reject`);
CREATE UNIQUE INDEX `directus_users_external_identifier_unique` on `directus_users` (`external_identifier`);
CREATE UNIQUE INDEX `directus_users_email_unique`          on `directus_users`      (`email`);
CREATE UNIQUE INDEX `directus_users_token_unique`          on `directus_users`      (`token`);

PRAGMA foreign_keys=ON;
COMMIT;
