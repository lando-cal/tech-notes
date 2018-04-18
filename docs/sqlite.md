Title: sqlite

- CLI Shell info: <http://www.sqlite.org/sqlite.html>
- Better CLI tutorial: <http://souptonuts.sourceforge.net/readme_sqlite_tutorial.html>
- FAQ - <http://www.sqlite.org/faq.html>
- When to use SQLite - https://www.sqlite.org/whentouse.html

# Syntax Examples

## Exit the CLI

```
.exit
```

## Create a table

```
CREATE TABLE servers (id INTEGER NOT NULL, hostname VARCHAR(255), ip_addr VARCHAR(32), PRIMARY KEY (id), UNIQUE (id,hostname));
```

Or from a unix shell

```
sqlite3 foo.db "CREATE TABLE servers (id INTEGER NOT NULL, hostname VARCHAR(255), ip_addr VARCHAR(32), PRIMARY KEY (id), UNIQUE (id,hostname));"
```

## Add a column to the table

```
ALTER TABLE servers ADD os varchar(255);
```

## Add rows to the table from unix shell

```
sqlite3 foo.db "insert into baz values ('50','some text');"
```

## Add rows or update if the row already exists

This syntax is different from other SQL implementations

```
insert or replace into tablename(filename, hash) values
  ('/etc/hosts', 'somehash'),
  ('/etc/resolv.conf', 'someotherhash');
```

## Output rows via the unix shell

This outputs as columns, but csv, html line, and list exist too.

```
sqlite3 -column foo.db "select * from baz limit 5;"
```

If -column is truncating your output, instead use `-list -separator ' '`

## Dump the db from CLI

```
sqlite3 foo.db ".dump" > db.sql
```

## Search Skype chat history

```
sqlite3 ~/Library/Application\ Support/Skype/daniel.austin/main.db  "select author, timestamp, body_xml from messages where body_xml like '%veewee%' ;"
```

### Expanded functionality skype history search

```
function skypesearch(){
  skypeusername=$1
  searchstring=$2
  /usr/bin/env sqlite3 ~/Library/Application\ Support/Skype/${skypeusername}/main.db  "select author, datetime(timestamp,'unixepoch','localtime'), body_xml from messages where body_xml like '%${searchstring}%' ;"
}
alias ss="skypesearch username"
```

## Quickly create an image database

```
# Create the database
sqlite3 images.db "create table images (filename varchar(255), createdate timestamp, unique(filename))"
# Populate the database. This can be blindly re-run when new files are added.
exiftool -d "%s" -p 'insert into images values ("$filename", "$DateTimeOriginal");' -q -f -r . | sqlite3 images.db 2> /dev/null
# Query the database
sqlite3 images.db "select filename,datetime(createdate,'unixepoch','localtime') as date from images where date like '2014-08-02%';"
```

## Use sqlite3 in PHP

```
<?php
$db = new SQLite3("images.db");
if (!is_object($db)) { echo "Couldn't connect to DB." ; exit ; }
$query = "select filename,datetime(createdate,'unixepoch','localtime') as date from images where date like '2014-08-02%';" ;
$result = $db->query($query);
while($row = $result->fetchArray(SQLITE3_ASSOC)){
       $i++ ;
       if(!isset($row['filename'])) continue;
       echo "$row[filename] : $row[date]&lt;br>\n";
}
?>
```
