Title: php

The PHP scripting language.

# Code Guidelines

- The PEAR code guidelines are pretty good - <http://pear.activeventure.com/standards.html>
- Even better coding standards - <https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-1-basic-coding-standard.md>

# Examples

## Convert date formats

This converts mysql time to epoch unix timestamp and back `$timestamp = strtotime($mysqltime); echo date("Y-m-d H:i:s", $timestamp);`

## Run code from CLI

```
php -r "phpinfo();"
```

## Show php CLI env vars

This shows the location of the ini file used for CLI. `php -i`

## Enable Errors

Set `display_errors = On` in php.ini, or in a php file add:

```
error_reporting(E_ALL);
ini_set('display_errors', 1);
```

## Disable timeout

```
set_time_limit(0);
ini_set ('max_execution_time', 0);
```

## Random numbers

```
rand() ; # random int
rand(1,10) ; # random int between 1 and 10
rand(100,1000)/100 ; # workaround for generating floats with 2 decimal points
```
