Database server. Was FOSS but now is owned by Oracle.

# Examples

## Show variables of the running server

```
mysqladmin variables
```

## Enable bin logging

Edit /etc/my.cnf:

```
log-bin=/var/lib/mysql/mysql-bin
```

## Show how a table was created

```
SHOW CREATE TABLE table_name \G
```

## Create a table

```
CREATE TABLE photo_sizes (
  `photo_id` char(32) NOT NULL,
  `format` mediumtext,
  `width` mediumtext,
  `height` mediumtext,
  `source` mediumtext,
  `url` mediumtext,
  PRIMARY KEY(`photo_id`)
) ;
```

## Create a table with multiple columns as the primary key

```
CREATE TABLE `photo_sizes` (
  `photo_id` char(32) NOT NULL,
  `format` char(32) NOT NULL DEFAULT '',
  `width` mediumtext,
  `height` mediumtext,
  `source` mediumtext,
  `url` mediumtext,
  PRIMARY KEY (`photo_id`,`format`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
```

## Show what processes are running

```
show processlist;
```

## Dump a database

```
mysqldump -u root -p --all-databases | gzip -9 > ~/$(date +%Y%m%d-%H%m).sql.gz
```

## Duplicate a database

```
sudo mysqldump -v mogilefs | sudo mysql -D mogilefs_sjc
```

## Dump the schema of a database with no actual data

```
sudo mysqldump --no-data dbname > schema.sql
```

## Show privileges

```
show GRANTS ;
```

## Create a new user

`CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'some_pass';`\ `GRANT ALL PRIVILEGES ON databasename.* TO 'newuser'@'localhost' WITH GRANT OPTION;`

## Delete a user

```
DROP USER 'user_name'@'localhost';
```

## Grant Privileges

```
GRANT ALL ON database.* TO 'newuser'@'localhost';
```

## Change root password

`/usr/bin/mysqladmin -u root password 'new-password'`\ `/usr/bin/mysqladmin -u root -h hostname password 'new-password'`

or...

```
UPDATE mysql.user SET Password=PASSWORD('password') WHERE User='user_name' AND Host='localhost';
```

## Create statements

### Create an index on table images for column rating\_count

```
create index rating_count on images (rating_count) ;
```

### Drop an index from a table

```
drop index rating_count on images ;
```

## Table Alters

### Add a column

```
alter table flixplor add o_width char(12);
```

### Drop a column

```
alter table flixplor drop column o_width;
```

### Change the type of a column

```
alter table flixplor modify o_height mediumint ;
```

### Add a current timestamp column

```
alter table images add last_updated timestamp not null default current_timestamp on update current_timestamp;
```

### Change the table engine to innodb

```
ALTER TABLE images ENGINE=INNODB;
```

### Change a table's encoding

```
alter table raw_flickr_data CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
```

## Table Inserts

### Add a record

## Table Updates

### Update if key exists

- <http://dev.mysql.com/doc/refman/5.0/en/insert-on-duplicate.html>

### Update some fields in a record

## Table Selects

### Select values and don't show duplicates

```
select col from servers group by col ;
```

### Select photo_id and discard duplicates (uniq)

```
select photo_id from photo_sizes group by photo_id ;
```

### Select and count unique pairs of columns

```
select model, unit, count(*) as n from servers group by model, unit having n > 1 order by model asc ;
```

### Select the count of rows in a table

```
select count(*) from flixplor where o_height > 100 ;
```

### Do some math to create a new column during a select

```
select photo_id,last_retrieval,o_height,o_width,(o_height * o_width) as pixels from flixplor
where last_reposted < from_unixtime('1384268667') or last_reposted is NULL
order by (o_height * o_width) limit 10 ;
```

## Statement explanations

The EXPLAIN statement can give you additional info about how complex your statement is.

### Explain select

```
mysql> explain select *,(rating_sum / rating_count) as average from images where (rating_sum / rating_count) > 20 or rating_count=0 ORDER BY RAND() LIMIT 1 ;
+----+-------------+--------+------+---------------+------+---------+------+--------+----------------------------------------------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows   | Extra                                        |
+----+-------------+--------+------+---------------+------+---------+------+--------+----------------------------------------------+
|  1 | SIMPLE      | images | ALL  | rating_count  | NULL | NULL    | NULL | 301937 | Using where; Using temporary; Using filesort |
+----+-------------+--------+------+---------------+------+---------+------+--------+----------------------------------------------+
1 row in set (0.00 sec)
```

# Misc

- Complete statement with \G for different output format
- `ERROR 1045 (28000)` may be caused by invalid hostname in connect command.  Replace the --host token with the full hostname of the db server.  Or, restart mysql and try again.

# Recommended reading

- MySQL (5th Edition) (Developer's Library)
- High Performance MySQL: Optimization, Backups, Replication, and More

# See Also

- <http://www.sqlalchemy.org/> - ORM, better for abstracting database in code
