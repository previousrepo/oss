-- Grant all privileges to mantisbt user
GRANT ALL PRIVILEGES ON bugtracker.* TO 'mantisbt'@'%';
FLUSH PRIVILEGES;


-- MantisBT 2.25.7 Database creation script
-- 2025-11-08T08:21:43+00:00

-- Schema step 0
CREATE TABLE mantis_config_mantis (
config_id                VARCHAR(64) NOT NULL,
project_id               INTEGER NOT NULL DEFAULT 0,
user_id                  INTEGER NOT NULL DEFAULT 0,
access_reqd              INTEGER DEFAULT 0,
type                     INTEGER DEFAULT 90,
value                    LONGTEXT NOT NULL,
                 PRIMARY KEY (config_id, project_id, user_id)
)DEFAULT CHARSET=utf8;

-- Schema step 1
ALTER TABLE mantis_config_mantis ADD  INDEX idx_config  (config_id);

-- Schema step 2
CREATE TABLE mantis_bug_file_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
bug_id                   INTEGER UNSIGNED NOT NULL DEFAULT 0,
title                    VARCHAR(250) NOT NULL DEFAULT '',
description              VARCHAR(250) NOT NULL DEFAULT '',
diskfile                 VARCHAR(250) NOT NULL DEFAULT '',
filename                 VARCHAR(250) NOT NULL DEFAULT '',
folder                   VARCHAR(250) NOT NULL DEFAULT '',
filesize                 INTEGER NOT NULL DEFAULT 0,
file_type                VARCHAR(250) NOT NULL DEFAULT '',
date_added               DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
content                  LONGBLOB,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 3
ALTER TABLE mantis_bug_file_mantis ADD  INDEX idx_bug_file_bug_id  (bug_id);

-- Schema step 4
CREATE TABLE mantis_bug_history_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
bug_id                   INTEGER UNSIGNED NOT NULL DEFAULT 0,
date_modified            DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
field_name               VARCHAR(32) NOT NULL DEFAULT '',
old_value                VARCHAR(128) NOT NULL DEFAULT '',
new_value                VARCHAR(128) NOT NULL DEFAULT '',
type                     SMALLINT NOT NULL DEFAULT 0,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 5
ALTER TABLE mantis_bug_history_mantis ADD  INDEX idx_bug_history_bug_id  (bug_id);

-- Schema step 6
ALTER TABLE mantis_bug_history_mantis ADD  INDEX idx_history_user_id  (user_id);

-- Schema step 7
CREATE TABLE mantis_bug_monitor_mantis (
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
bug_id                   INTEGER UNSIGNED NOT NULL DEFAULT 0,
                 PRIMARY KEY (user_id, bug_id)
)DEFAULT CHARSET=utf8;

-- Schema step 8
CREATE TABLE mantis_bug_relationship_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
source_bug_id            INTEGER UNSIGNED NOT NULL DEFAULT 0,
destination_bug_id       INTEGER UNSIGNED NOT NULL DEFAULT 0,
relationship_type        SMALLINT NOT NULL DEFAULT 0,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 9
ALTER TABLE mantis_bug_relationship_mantis ADD  INDEX idx_relationship_source  (source_bug_id);

-- Schema step 10
ALTER TABLE mantis_bug_relationship_mantis ADD  INDEX idx_relationship_destination  (destination_bug_id);

-- Schema step 11
CREATE TABLE mantis_bug_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
project_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
reporter_id              INTEGER UNSIGNED NOT NULL DEFAULT 0,
handler_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
duplicate_id             INTEGER UNSIGNED NOT NULL DEFAULT 0,
priority                 SMALLINT NOT NULL DEFAULT 30,
severity                 SMALLINT NOT NULL DEFAULT 50,
reproducibility          SMALLINT NOT NULL DEFAULT 10,
status                   SMALLINT NOT NULL DEFAULT 10,
resolution               SMALLINT NOT NULL DEFAULT 10,
projection               SMALLINT NOT NULL DEFAULT 10,
category                 VARCHAR(64) NOT NULL DEFAULT '',
date_submitted           DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
last_updated             DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
eta                      SMALLINT NOT NULL DEFAULT 10,
bug_text_id              INTEGER UNSIGNED NOT NULL DEFAULT 0,
os                       VARCHAR(32) NOT NULL DEFAULT '',
os_build                 VARCHAR(32) NOT NULL DEFAULT '',
platform                 VARCHAR(32) NOT NULL DEFAULT '',
version                  VARCHAR(64) NOT NULL DEFAULT '',
fixed_in_version         VARCHAR(64) NOT NULL DEFAULT '',
build                    VARCHAR(32) NOT NULL DEFAULT '',
profile_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
view_state               SMALLINT NOT NULL DEFAULT 10,
summary                  VARCHAR(128) NOT NULL DEFAULT '',
sponsorship_total        INTEGER NOT NULL DEFAULT 0,
sticky                   TINYINT NOT NULL DEFAULT '0',
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 12
ALTER TABLE mantis_bug_mantis ADD  INDEX idx_bug_sponsorship_total  (sponsorship_total);

-- Schema step 13
ALTER TABLE mantis_bug_mantis ADD  INDEX idx_bug_fixed_in_version  (fixed_in_version);

-- Schema step 14
ALTER TABLE mantis_bug_mantis ADD  INDEX idx_bug_status  (status);

-- Schema step 15
ALTER TABLE mantis_bug_mantis ADD  INDEX idx_project  (project_id);

-- Schema step 16
CREATE TABLE mantis_bug_text_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
description              LONGTEXT NOT NULL,
steps_to_reproduce       LONGTEXT NOT NULL,
additional_information   LONGTEXT NOT NULL,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 17
CREATE TABLE mantis_bugnote_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
bug_id                   INTEGER UNSIGNED NOT NULL DEFAULT 0,
reporter_id              INTEGER UNSIGNED NOT NULL DEFAULT 0,
bugnote_text_id          INTEGER UNSIGNED NOT NULL DEFAULT 0,
view_state               SMALLINT NOT NULL DEFAULT 10,
date_submitted           DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
last_modified            DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
note_type                INTEGER DEFAULT 0,
note_attr                VARCHAR(250) DEFAULT '',
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 18
ALTER TABLE mantis_bugnote_mantis ADD  INDEX idx_bug  (bug_id);

-- Schema step 19
ALTER TABLE mantis_bugnote_mantis ADD  INDEX idx_last_mod  (last_modified);

-- Schema step 20
CREATE TABLE mantis_bugnote_text_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
note                     LONGTEXT NOT NULL,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 21
CREATE TABLE mantis_custom_field_project_mantis (
field_id                 INTEGER NOT NULL DEFAULT 0,
project_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
sequence                 SMALLINT NOT NULL DEFAULT 0,
                 PRIMARY KEY (field_id, project_id)
)DEFAULT CHARSET=utf8;

-- Schema step 22
CREATE TABLE mantis_custom_field_string_mantis (
field_id                 INTEGER NOT NULL DEFAULT 0,
bug_id                   INTEGER NOT NULL DEFAULT 0,
value                    VARCHAR(255) NOT NULL DEFAULT '',
                 PRIMARY KEY (field_id, bug_id)
)DEFAULT CHARSET=utf8;

-- Schema step 23
ALTER TABLE mantis_custom_field_string_mantis ADD  INDEX idx_custom_field_bug  (bug_id);

-- Schema step 24
CREATE TABLE mantis_custom_field_mantis (
id                       INTEGER NOT NULL AUTO_INCREMENT,
name                     VARCHAR(64) NOT NULL DEFAULT '',
type                     SMALLINT NOT NULL DEFAULT 0,
possible_values          VARCHAR(255) NOT NULL DEFAULT '',
default_value            VARCHAR(255) NOT NULL DEFAULT '',
valid_regexp             VARCHAR(255) NOT NULL DEFAULT '',
access_level_r           SMALLINT NOT NULL DEFAULT 0,
access_level_rw          SMALLINT NOT NULL DEFAULT 0,
length_min               INTEGER NOT NULL DEFAULT 0,
length_max               INTEGER NOT NULL DEFAULT 0,
advanced                 TINYINT NOT NULL DEFAULT '0',
require_report           TINYINT NOT NULL DEFAULT '0',
require_update           TINYINT NOT NULL DEFAULT '0',
display_report           TINYINT NOT NULL DEFAULT '0',
display_update           TINYINT NOT NULL DEFAULT '1',
require_resolved         TINYINT NOT NULL DEFAULT '0',
display_resolved         TINYINT NOT NULL DEFAULT '0',
display_closed           TINYINT NOT NULL DEFAULT '0',
require_closed           TINYINT NOT NULL DEFAULT '0',
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 25
ALTER TABLE mantis_custom_field_mantis ADD  INDEX idx_custom_field_name  (name);

-- Schema step 26
CREATE TABLE mantis_filters_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
user_id                  INTEGER NOT NULL DEFAULT 0,
project_id               INTEGER NOT NULL DEFAULT 0,
is_public                TINYINT DEFAULT NULL,
name                     VARCHAR(64) NOT NULL DEFAULT '',
filter_string            LONGTEXT NOT NULL,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 27
CREATE TABLE mantis_news_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
project_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
poster_id                INTEGER UNSIGNED NOT NULL DEFAULT 0,
date_posted              DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
last_modified            DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
view_state               SMALLINT NOT NULL DEFAULT 10,
announcement             TINYINT NOT NULL DEFAULT '0',
headline                 VARCHAR(64) NOT NULL DEFAULT '',
body                     LONGTEXT NOT NULL,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 28
CREATE TABLE mantis_project_category_mantis (
project_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
category                 VARCHAR(64) NOT NULL DEFAULT '',
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
                 PRIMARY KEY (project_id, category)
)DEFAULT CHARSET=utf8;

-- Schema step 29
CREATE TABLE mantis_project_file_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
project_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
title                    VARCHAR(250) NOT NULL DEFAULT '',
description              VARCHAR(250) NOT NULL DEFAULT '',
diskfile                 VARCHAR(250) NOT NULL DEFAULT '',
filename                 VARCHAR(250) NOT NULL DEFAULT '',
folder                   VARCHAR(250) NOT NULL DEFAULT '',
filesize                 INTEGER NOT NULL DEFAULT 0,
file_type                VARCHAR(250) NOT NULL DEFAULT '',
date_added               DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
content                  LONGBLOB,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 30
CREATE TABLE mantis_project_hierarchy_mantis (
child_id                 INTEGER UNSIGNED NOT NULL,
parent_id                INTEGER UNSIGNED NOT NULL
)DEFAULT CHARSET=utf8;

-- Schema step 31
CREATE TABLE mantis_project_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
name                     VARCHAR(128) NOT NULL DEFAULT '',
status                   SMALLINT NOT NULL DEFAULT 10,
enabled                  TINYINT NOT NULL DEFAULT '1',
view_state               SMALLINT NOT NULL DEFAULT 10,
access_min               SMALLINT NOT NULL DEFAULT 10,
file_path                VARCHAR(250) NOT NULL DEFAULT '',
description              LONGTEXT NOT NULL,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 32
ALTER TABLE mantis_project_mantis ADD  INDEX idx_project_id  (id);

-- Schema step 33
ALTER TABLE mantis_project_mantis ADD  UNIQUE INDEX idx_project_name  (name);

-- Schema step 34
ALTER TABLE mantis_project_mantis ADD  INDEX idx_project_view  (view_state);

-- Schema step 35
CREATE TABLE mantis_project_user_list_mantis (
project_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
access_level             SMALLINT NOT NULL DEFAULT 10,
                 PRIMARY KEY (project_id, user_id)
)DEFAULT CHARSET=utf8;

-- Schema step 36
ALTER TABLE mantis_project_user_list_mantis ADD  INDEX idx_project_user  (user_id);

-- Schema step 37
CREATE TABLE mantis_project_version_mantis (
id                       INTEGER NOT NULL AUTO_INCREMENT,
project_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
version                  VARCHAR(64) NOT NULL DEFAULT '',
date_order               DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
description              LONGTEXT NOT NULL,
released                 TINYINT NOT NULL DEFAULT '1',
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 38
ALTER TABLE mantis_project_version_mantis ADD  UNIQUE INDEX idx_project_version  (project_id, version);

-- Schema step 39
CREATE TABLE mantis_sponsorship_mantis (
id                       INTEGER NOT NULL AUTO_INCREMENT,
bug_id                   INTEGER NOT NULL DEFAULT 0,
user_id                  INTEGER NOT NULL DEFAULT 0,
amount                   INTEGER NOT NULL DEFAULT 0,
logo                     VARCHAR(128) NOT NULL DEFAULT '',
url                      VARCHAR(128) NOT NULL DEFAULT '',
paid                     TINYINT NOT NULL DEFAULT '0',
date_submitted           DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
last_updated             DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 40
ALTER TABLE mantis_sponsorship_mantis ADD  INDEX idx_sponsorship_bug_id  (bug_id);

-- Schema step 41
ALTER TABLE mantis_sponsorship_mantis ADD  INDEX idx_sponsorship_user_id  (user_id);

-- Schema step 42
CREATE TABLE mantis_tokens_mantis (
id                       INTEGER NOT NULL AUTO_INCREMENT,
owner                    INTEGER NOT NULL,
type                     INTEGER NOT NULL,
timestamp                DATETIME NOT NULL,
expiry                   DATETIME,
value                    LONGTEXT NOT NULL,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 43
CREATE TABLE mantis_user_pref_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
project_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
default_profile          INTEGER UNSIGNED NOT NULL DEFAULT 0,
default_project          INTEGER UNSIGNED NOT NULL DEFAULT 0,
advanced_report          TINYINT NOT NULL DEFAULT '0',
advanced_view            TINYINT NOT NULL DEFAULT '0',
advanced_update          TINYINT NOT NULL DEFAULT '0',
refresh_delay            INTEGER NOT NULL DEFAULT 0,
redirect_delay           TINYINT NOT NULL DEFAULT '0',
bugnote_order            VARCHAR(4) NOT NULL DEFAULT 'ASC',
email_on_new             TINYINT NOT NULL DEFAULT '0',
email_on_assigned        TINYINT NOT NULL DEFAULT '0',
email_on_feedback        TINYINT NOT NULL DEFAULT '0',
email_on_resolved        TINYINT NOT NULL DEFAULT '0',
email_on_closed          TINYINT NOT NULL DEFAULT '0',
email_on_reopened        TINYINT NOT NULL DEFAULT '0',
email_on_bugnote         TINYINT NOT NULL DEFAULT '0',
email_on_status          TINYINT NOT NULL DEFAULT '0',
email_on_priority        TINYINT NOT NULL DEFAULT '0',
email_on_priority_min_severity SMALLINT NOT NULL DEFAULT 10,
email_on_status_min_severity SMALLINT NOT NULL DEFAULT 10,
email_on_bugnote_min_severity SMALLINT NOT NULL DEFAULT 10,
email_on_reopened_min_severity SMALLINT NOT NULL DEFAULT 10,
email_on_closed_min_severity SMALLINT NOT NULL DEFAULT 10,
email_on_resolved_min_severity SMALLINT NOT NULL DEFAULT 10,
email_on_feedback_min_severity SMALLINT NOT NULL DEFAULT 10,
email_on_assigned_min_severity SMALLINT NOT NULL DEFAULT 10,
email_on_new_min_severity SMALLINT NOT NULL DEFAULT 10,
email_bugnote_limit      SMALLINT NOT NULL DEFAULT 0,
language                 VARCHAR(32) NOT NULL DEFAULT 'english',
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 44
CREATE TABLE mantis_user_print_pref_mantis (
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
print_pref               VARCHAR(27) NOT NULL DEFAULT '',
                 PRIMARY KEY (user_id)
)DEFAULT CHARSET=utf8;

-- Schema step 45
CREATE TABLE mantis_user_profile_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
platform                 VARCHAR(32) NOT NULL DEFAULT '',
os                       VARCHAR(32) NOT NULL DEFAULT '',
os_build                 VARCHAR(32) NOT NULL DEFAULT '',
description              LONGTEXT NOT NULL,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 46
CREATE TABLE mantis_user_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
username                 VARCHAR(32) NOT NULL DEFAULT '',
realname                 VARCHAR(64) NOT NULL DEFAULT '',
email                    VARCHAR(64) NOT NULL DEFAULT '',
password                 VARCHAR(32) NOT NULL DEFAULT '',
date_created             DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
last_visit               DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
enabled                  TINYINT NOT NULL DEFAULT '1',
protected                TINYINT NOT NULL DEFAULT '0',
access_level             SMALLINT NOT NULL DEFAULT 10,
login_count              INTEGER NOT NULL DEFAULT 0,
lost_password_request_count SMALLINT NOT NULL DEFAULT 0,
failed_login_count       SMALLINT NOT NULL DEFAULT 0,
cookie_string            VARCHAR(64) NOT NULL DEFAULT '',
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 47
ALTER TABLE mantis_user_mantis ADD  UNIQUE INDEX idx_user_cookie_string  (cookie_string);

-- Schema step 48
ALTER TABLE mantis_user_mantis ADD  UNIQUE INDEX idx_user_username  (username);

-- Schema step 49
ALTER TABLE mantis_user_mantis ADD  INDEX idx_enable  (enabled);

-- Schema step 50
ALTER TABLE mantis_user_mantis ADD  INDEX idx_access  (access_level);

-- Schema step 51
INSERT INTO mantis_user_mantis(
		username, realname, email, password,
		date_created, last_visit, enabled, protected, access_level,
		login_count, lost_password_request_count, failed_login_count,
		cookie_string
	)
	VALUES (
		'mantisbt', '', 'mantisbt@localhost', '27e7a36bcf13fb4fdc9994adc0f366d3',
		'2025-11-08 08:21:43', '2025-11-08 08:21:43', '1', '0', 90,
		3, 0, 0, MD5(RAND())
	);

-- Schema step 52
ALTER TABLE mantis_bug_history_mantis MODIFY COLUMN old_value VARCHAR(255) NOT NULL;

-- Schema step 53
ALTER TABLE mantis_bug_history_mantis MODIFY COLUMN new_value VARCHAR(255) NOT NULL;

-- Schema step 54
CREATE TABLE mantis_email_mantis (
email_id                 INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
email                    VARCHAR(64) NOT NULL DEFAULT '',
subject                  VARCHAR(250) NOT NULL DEFAULT '',
submitted                DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
metadata                 LONGTEXT NOT NULL,
body                     LONGTEXT NOT NULL,
                 PRIMARY KEY (email_id)
)DEFAULT CHARSET=utf8;

-- Schema step 55
ALTER TABLE mantis_email_mantis ADD  INDEX idx_email_id  (email_id);

-- Schema step 56
ALTER TABLE mantis_bug_mantis ADD target_version VARCHAR(64) NOT NULL DEFAULT '';

-- Schema step 57
ALTER TABLE mantis_bugnote_mantis ADD time_tracking INTEGER UNSIGNED NOT NULL DEFAULT 0;

-- Schema step 58
ALTER TABLE mantis_bug_file_mantis ADD  INDEX idx_diskfile  (diskfile);

-- Schema step 59
ALTER TABLE mantis_user_print_pref_mantis MODIFY COLUMN print_pref VARCHAR(64) NOT NULL;

-- Schema step 60
ALTER TABLE mantis_bug_history_mantis MODIFY COLUMN field_name VARCHAR(64) NOT NULL;

-- Schema step 61
CREATE TABLE mantis_tag_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
name                     VARCHAR(100) NOT NULL DEFAULT '',
description              LONGTEXT NOT NULL,
date_created             DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
date_updated             DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
                 PRIMARY KEY (id, name)
)DEFAULT CHARSET=utf8;

-- Schema step 62
CREATE TABLE mantis_bug_tag_mantis (
bug_id                   INTEGER UNSIGNED NOT NULL DEFAULT 0,
tag_id                   INTEGER UNSIGNED NOT NULL DEFAULT 0,
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
date_attached            DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
                 PRIMARY KEY (bug_id, tag_id)
)DEFAULT CHARSET=utf8;

-- Schema step 63
ALTER TABLE mantis_tokens_mantis ADD  INDEX idx_typeowner  (type, owner);

-- Schema step 64
CREATE TABLE mantis_plugin_mantis (
basename                 VARCHAR(40) NOT NULL,
enabled                  TINYINT NOT NULL DEFAULT '0',
                 PRIMARY KEY (basename)
)DEFAULT CHARSET=utf8;

-- Schema step 65
ALTER TABLE mantis_user_pref_mantis MODIFY COLUMN redirect_delay INTEGER NOT NULL DEFAULT 0;

-- Schema step 66
ALTER TABLE mantis_custom_field_mantis MODIFY COLUMN possible_values TEXT;

-- Schema step 67
CREATE TABLE mantis_category_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
project_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
user_id                  INTEGER UNSIGNED NOT NULL DEFAULT 0,
name                     VARCHAR(128) NOT NULL DEFAULT '',
status                   INTEGER UNSIGNED NOT NULL DEFAULT 0,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 68
ALTER TABLE mantis_category_mantis ADD  UNIQUE INDEX idx_category_project_name  (project_id, name);

-- Schema step 69
INSERT INTO mantis_category_mantis
	( project_id, user_id, name, status )
	VALUES
	( '0', '0', 'General', '0' );

-- Schema step 70
ALTER TABLE mantis_bug_mantis ADD category_id INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 71
-- Execute PHP Update Function: install_category_migrate()

-- Schema step 72
ALTER TABLE mantis_bug_mantis DROP COLUMN category;

-- Schema step 73
DROP TABLE IF EXISTS mantis_project_category_mantis;

-- Schema step 74
ALTER TABLE mantis_project_mantis ADD category_id INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 75
-- No operation

-- Schema step 76
-- No operation

-- Schema step 77
INSERT INTO mantis_plugin_mantis
	( basename, enabled )
	VALUES
	( 'MantisCoreFormatting', '1' );

-- Schema step 78
ALTER TABLE mantis_project_mantis ADD inherit_global INTEGER UNSIGNED NOT NULL DEFAULT 0;

-- Schema step 79
ALTER TABLE mantis_project_hierarchy_mantis ADD inherit_parent INTEGER UNSIGNED NOT NULL DEFAULT 0;

-- Schema step 80
ALTER TABLE mantis_plugin_mantis ADD protected TINYINT NOT NULL DEFAULT '0';ALTER TABLE mantis_plugin_mantis ADD priority INTEGER UNSIGNED NOT NULL DEFAULT 3;

-- Schema step 81
ALTER TABLE mantis_project_version_mantis ADD obsolete TINYINT NOT NULL DEFAULT '0';

-- Schema step 82
ALTER TABLE mantis_bug_mantis ADD due_date DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01';

-- Schema step 83
ALTER TABLE mantis_custom_field_mantis ADD filter_by TINYINT NOT NULL DEFAULT '1';

-- Schema step 84
CREATE TABLE mantis_bug_revision_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
bug_id                   INTEGER UNSIGNED NOT NULL,
bugnote_id               INTEGER UNSIGNED NOT NULL DEFAULT 0,
user_id                  INTEGER UNSIGNED NOT NULL,
timestamp                DATETIME NOT NULL DEFAULT '1970-01-01 00:00:01',
type                     INTEGER UNSIGNED NOT NULL,
value                    LONGTEXT NOT NULL,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 85
ALTER TABLE mantis_bug_revision_mantis ADD  INDEX idx_bug_rev_id_time  (bug_id, timestamp);

-- Schema step 86
ALTER TABLE mantis_bug_revision_mantis ADD  INDEX idx_bug_rev_type  (type);

-- Schema step 87
ALTER TABLE mantis_bug_mantis ADD date_submitted_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 88
ALTER TABLE mantis_bug_mantis ADD due_date_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 89
ALTER TABLE mantis_bug_mantis ADD last_updated_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 90
-- Execute PHP Update Function: install_date_migrate('mantis_bug_mantis', 'id', array ( 'date_submitted', 'due_date', 'last_updated' ), array ( 'date_submitted_int', 'due_date_int', 'last_updated_int' ))

-- Schema step 91
ALTER TABLE mantis_bug_mantis DROP COLUMN date_submitted;

-- Schema step 92
ALTER TABLE mantis_bug_mantis CHANGE COLUMN date_submitted_int date_submitted INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 93
ALTER TABLE mantis_bug_mantis DROP COLUMN due_date;

-- Schema step 94
ALTER TABLE mantis_bug_mantis CHANGE COLUMN due_date_int due_date INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 95
ALTER TABLE mantis_bug_mantis DROP COLUMN last_updated;

-- Schema step 96
ALTER TABLE mantis_bug_mantis CHANGE COLUMN last_updated_int last_updated INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 97
-- No operation

-- Schema step 98
ALTER TABLE mantis_bugnote_mantis ADD last_modified_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 99
ALTER TABLE mantis_bugnote_mantis ADD date_submitted_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 100
-- Execute PHP Update Function: install_date_migrate('mantis_bugnote_mantis', 'id', array ( 'last_modified', 'date_submitted' ), array ( 'last_modified_int', 'date_submitted_int' ))

-- Schema step 101
ALTER TABLE mantis_bugnote_mantis DROP COLUMN last_modified;

-- Schema step 102
ALTER TABLE mantis_bugnote_mantis CHANGE COLUMN last_modified_int last_modified INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 103
ALTER TABLE mantis_bugnote_mantis ADD  INDEX idx_last_mod  (last_modified);

-- Schema step 104
ALTER TABLE mantis_bugnote_mantis DROP COLUMN date_submitted;

-- Schema step 105
ALTER TABLE mantis_bugnote_mantis CHANGE COLUMN date_submitted_int date_submitted INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 106
ALTER TABLE mantis_bug_file_mantis ADD date_added_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 107
-- Execute PHP Update Function: install_date_migrate('mantis_bug_file_mantis', 'id', 'date_added', 'date_added_int')

-- Schema step 108
ALTER TABLE mantis_bug_file_mantis DROP COLUMN date_added;

-- Schema step 109
ALTER TABLE mantis_bug_file_mantis CHANGE COLUMN date_added_int date_added INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 110
ALTER TABLE mantis_project_file_mantis ADD date_added_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 111
-- Execute PHP Update Function: install_date_migrate('mantis_project_file_mantis', 'id', 'date_added', 'date_added_int')

-- Schema step 112
ALTER TABLE mantis_project_file_mantis DROP COLUMN date_added;

-- Schema step 113
ALTER TABLE mantis_project_file_mantis CHANGE COLUMN date_added_int date_added INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 114
ALTER TABLE mantis_bug_history_mantis ADD date_modified_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 115
-- Execute PHP Update Function: install_date_migrate('mantis_bug_history_mantis', 'id', 'date_modified', 'date_modified_int')

-- Schema step 116
ALTER TABLE mantis_bug_history_mantis DROP COLUMN date_modified;

-- Schema step 117
ALTER TABLE mantis_bug_history_mantis CHANGE COLUMN date_modified_int date_modified INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 118
ALTER TABLE mantis_user_mantis ADD last_visit_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 119
ALTER TABLE mantis_user_mantis ADD date_created_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 120
-- Execute PHP Update Function: install_date_migrate('mantis_user_mantis', 'id', array ( 'last_visit', 'date_created' ), array ( 'last_visit_int', 'date_created_int' ))

-- Schema step 121
ALTER TABLE mantis_user_mantis DROP COLUMN date_created;

-- Schema step 122
ALTER TABLE mantis_user_mantis CHANGE COLUMN date_created_int date_created INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 123
ALTER TABLE mantis_user_mantis DROP COLUMN last_visit;

-- Schema step 124
ALTER TABLE mantis_user_mantis CHANGE COLUMN last_visit_int last_visit INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 125
ALTER TABLE mantis_email_mantis ADD submitted_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 126
-- Execute PHP Update Function: install_date_migrate('mantis_email_mantis', 'email_id', 'submitted', 'submitted_int')

-- Schema step 127
ALTER TABLE mantis_email_mantis DROP COLUMN submitted;

-- Schema step 128
ALTER TABLE mantis_email_mantis CHANGE COLUMN submitted_int submitted INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 129
ALTER TABLE mantis_tag_mantis ADD date_created_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 130
ALTER TABLE mantis_tag_mantis ADD date_updated_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 131
-- Execute PHP Update Function: install_date_migrate('mantis_tag_mantis', 'id', array ( 'date_created', 'date_updated' ), array ( 'date_created_int', 'date_updated_int' ))

-- Schema step 132
ALTER TABLE mantis_tag_mantis DROP COLUMN date_created;

-- Schema step 133
ALTER TABLE mantis_tag_mantis CHANGE COLUMN date_created_int date_created INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 134
ALTER TABLE mantis_tag_mantis DROP COLUMN date_updated;

-- Schema step 135
ALTER TABLE mantis_tag_mantis CHANGE COLUMN date_updated_int date_updated INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 136
ALTER TABLE mantis_bug_tag_mantis ADD date_attached_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 137
-- Execute PHP Update Function: install_date_migrate('mantis_bug_tag_mantis', 'bug_id', 'date_attached', 'date_attached_int')

-- Schema step 138
ALTER TABLE mantis_bug_tag_mantis DROP COLUMN date_attached;

-- Schema step 139
ALTER TABLE mantis_bug_tag_mantis CHANGE COLUMN date_attached_int date_attached INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 140
ALTER TABLE mantis_tokens_mantis ADD timestamp_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 141
ALTER TABLE mantis_tokens_mantis ADD expiry_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 142
-- Execute PHP Update Function: install_date_migrate('mantis_tokens_mantis', 'id', array ( 'timestamp', 'expiry' ), array ( 'timestamp_int', 'expiry_int' ))

-- Schema step 143
ALTER TABLE mantis_tokens_mantis DROP COLUMN timestamp;

-- Schema step 144
ALTER TABLE mantis_tokens_mantis CHANGE COLUMN timestamp_int timestamp INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 145
ALTER TABLE mantis_tokens_mantis DROP COLUMN expiry;

-- Schema step 146
ALTER TABLE mantis_tokens_mantis CHANGE COLUMN expiry_int expiry INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 147
ALTER TABLE mantis_news_mantis ADD last_modified_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 148
ALTER TABLE mantis_news_mantis ADD date_posted_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 149
-- Execute PHP Update Function: install_date_migrate('mantis_news_mantis', 'id', array ( 'date_posted', 'last_modified' ), array ( 'date_posted_int', 'last_modified_int' ))

-- Schema step 150
ALTER TABLE mantis_news_mantis DROP COLUMN last_modified;

-- Schema step 151
ALTER TABLE mantis_news_mantis CHANGE COLUMN last_modified_int last_modified INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 152
ALTER TABLE mantis_news_mantis DROP COLUMN date_posted;

-- Schema step 153
ALTER TABLE mantis_news_mantis CHANGE COLUMN date_posted_int date_posted INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 154
-- No operation

-- Schema step 155
ALTER TABLE mantis_bug_revision_mantis ADD timestamp_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 156
-- Execute PHP Update Function: install_date_migrate('mantis_bug_revision_mantis', 'id', 'timestamp', 'timestamp_int')

-- Schema step 157
ALTER TABLE mantis_bug_revision_mantis DROP COLUMN timestamp;

-- Schema step 158
ALTER TABLE mantis_bug_revision_mantis CHANGE COLUMN timestamp_int timestamp INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 159
ALTER TABLE mantis_bug_revision_mantis ADD  INDEX idx_bug_rev_id_time  (bug_id, timestamp);

-- Schema step 160
ALTER TABLE mantis_user_pref_mantis ADD timezone VARCHAR(32) NOT NULL DEFAULT '';

-- Schema step 161
ALTER TABLE mantis_project_version_mantis ADD date_order_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 162
-- Execute PHP Update Function: install_date_migrate('mantis_project_version_mantis', 'id', 'date_order', 'date_order_int')

-- Schema step 163
ALTER TABLE mantis_project_version_mantis DROP COLUMN date_order;

-- Schema step 164
ALTER TABLE mantis_project_version_mantis CHANGE COLUMN date_order_int date_order INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 165
ALTER TABLE mantis_sponsorship_mantis ADD date_submitted_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 166
ALTER TABLE mantis_sponsorship_mantis ADD last_updated_int INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 167
-- Execute PHP Update Function: install_date_migrate('mantis_sponsorship_mantis', 'id', array ( 'date_submitted', 'last_updated' ), array ( 'date_submitted_int', 'last_updated_int' ))

-- Schema step 168
ALTER TABLE mantis_sponsorship_mantis DROP COLUMN last_updated;

-- Schema step 169
ALTER TABLE mantis_sponsorship_mantis CHANGE COLUMN last_updated_int last_updated INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 170
ALTER TABLE mantis_sponsorship_mantis DROP COLUMN date_submitted;

-- Schema step 171
ALTER TABLE mantis_sponsorship_mantis CHANGE COLUMN date_submitted_int date_submitted INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 172
ALTER TABLE mantis_project_file_mantis ADD user_id INTEGER UNSIGNED NOT NULL DEFAULT 0;

-- Schema step 173
ALTER TABLE mantis_bug_file_mantis ADD user_id INTEGER UNSIGNED NOT NULL DEFAULT 0;

-- Schema step 174
ALTER TABLE mantis_custom_field_mantis DROP COLUMN advanced;

-- Schema step 175
ALTER TABLE mantis_user_pref_mantis DROP COLUMN advanced_report;

-- Schema step 176
ALTER TABLE mantis_user_pref_mantis DROP COLUMN advanced_view;

-- Schema step 177
ALTER TABLE mantis_user_pref_mantis DROP COLUMN advanced_update;

-- Schema step 178
ALTER TABLE mantis_project_hierarchy_mantis ADD  INDEX idx_project_hierarchy_child_id  (child_id);

-- Schema step 179
ALTER TABLE mantis_project_hierarchy_mantis ADD  INDEX idx_project_hierarchy_parent_id  (parent_id);

-- Schema step 180
ALTER TABLE mantis_tag_mantis ADD  INDEX idx_tag_name  (name);

-- Schema step 181
ALTER TABLE mantis_bug_tag_mantis ADD  INDEX idx_bug_tag_tag_id  (tag_id);

-- Schema step 182
-- No operation

-- Schema step 183
-- Execute PHP Update Function: install_correct_multiselect_custom_fields_db_format()

-- Schema step 184
-- No operation

-- Schema step 185
ALTER TABLE mantis_custom_field_string_mantis ADD text LONGTEXT DEFAULT NULL;

-- Schema step 186
-- Execute PHP Update Function: install_update_history_long_custom_fields()

-- Schema step 187
ALTER TABLE mantis_bug_monitor_mantis ADD  INDEX idx_bug_id  (bug_id);

-- Schema step 188
ALTER TABLE mantis_project_mantis MODIFY COLUMN inherit_global TINYINT NOT NULL DEFAULT 0;

-- Schema step 189
ALTER TABLE mantis_project_hierarchy_mantis MODIFY COLUMN inherit_parent TINYINT NOT NULL DEFAULT 0;

-- Schema step 190
-- Execute PHP Update Function: install_check_project_hierarchy()

-- Schema step 191
ALTER TABLE mantis_project_hierarchy_mantis ADD  UNIQUE INDEX idx_project_hierarchy  (child_id, parent_id);

-- Schema step 192
ALTER TABLE mantis_bug_history_mantis ADD  INDEX idx_bug_history_date_modified  (date_modified);

-- Schema step 193
-- Execute PHP Update Function: install_check_config_serialization()

-- Schema step 194
-- Execute PHP Update Function: install_check_token_serialization()

-- Schema step 195
-- Execute PHP Update Function: install_stored_filter_migrate()

-- Schema step 196
-- No operation

-- Schema step 197
-- No operation

-- Schema step 198
ALTER TABLE mantis_user_mantis MODIFY COLUMN password VARCHAR(64) NOT NULL DEFAULT '';

-- Schema step 199
-- No operation

-- Schema step 200
CREATE TABLE mantis_api_token_mantis (
id                       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
user_id                  INTEGER NOT NULL DEFAULT 0,
name                     VARCHAR(128) NOT NULL,
hash                     VARCHAR(128) NOT NULL,
date_created             INTEGER UNSIGNED NOT NULL DEFAULT 0,
date_used                INTEGER UNSIGNED NOT NULL DEFAULT 0,
                 PRIMARY KEY (id)
)DEFAULT CHARSET=utf8;

-- Schema step 201
ALTER TABLE mantis_api_token_mantis ADD  UNIQUE INDEX idx_user_id_name  (user_id, name);

-- Schema step 202
ALTER TABLE mantis_user_mantis ADD  INDEX idx_email  (email);

-- Schema step 203
ALTER TABLE mantis_bug_file_mantis MODIFY COLUMN content LONGBLOB;

-- Schema step 204
ALTER TABLE mantis_project_file_mantis MODIFY COLUMN content LONGBLOB;

-- Schema step 205
-- Execute PHP Update Function: install_gravatar_plugin()

-- Schema step 206
ALTER TABLE mantis_user_mantis MODIFY COLUMN username VARCHAR(191) NOT NULL DEFAULT '';

-- Schema step 207
ALTER TABLE mantis_user_mantis MODIFY COLUMN realname VARCHAR(191) NOT NULL DEFAULT '';

-- Schema step 208
ALTER TABLE mantis_user_mantis MODIFY COLUMN email VARCHAR(191) NOT NULL DEFAULT '';

-- Schema step 209
ALTER TABLE mantis_api_token_mantis MODIFY COLUMN user_id INTEGER UNSIGNED NOT NULL DEFAULT 0;ALTER TABLE mantis_api_token_mantis MODIFY COLUMN date_created INTEGER UNSIGNED NOT NULL DEFAULT 1;ALTER TABLE mantis_api_token_mantis MODIFY COLUMN date_used INTEGER UNSIGNED NOT NULL DEFAULT 1;

-- Schema step 210
ALTER TABLE mantis_bug_file_mantis ADD bugnote_id INTEGER UNSIGNED DEFAULT 0;

-- Schema step 211
ALTER TABLE mantis_email_mantis MODIFY COLUMN email VARCHAR(191) NOT NULL DEFAULT '';

-- Set database version
INSERT INTO mantis_config_mantis ( value, type, access_reqd, config_id, project_id, user_id ) VALUES (211, 1, 90, 'database_version', 0, 0 );