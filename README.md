# docker-mysql-utf8mb4

Inherits the standard mysql image and adds support for real UTF-8 standard.
See https://hub.docker.com/_/mysql/ for more details on the standard mysql image.

Check that the encoding has changed using the following command on your MySQL server:

    mysql> SHOW VARIABLES WHERE Variable_name LIKE 'character\_set\_%' OR Variable_name LIKE 'collation%';
    
    +--------------------------+--------------------+
    | Variable_name            | Value              |
    +--------------------------+--------------------+
    | character_set_client     | utf8mb4            |
    | character_set_connection | utf8mb4            |
    | character_set_database   | utf8mb4            |
    | character_set_filesystem | binary             |
    | character_set_results    | utf8mb4            |
    | character_set_server     | utf8mb4            |
    | character_set_system     | utf8               |
    | collation_connection     | utf8mb4_unicode_ci |
    | collation_database       | utf8mb4_unicode_ci |
    | collation_server         | utf8mb4_unicode_ci |
    +--------------------------+--------------------+

# Why this?

This is because MySQL "utf8" encodes characters on 3 bits instead of 4 bits in UTF-8 standard, which is what "utf8mb4" does.

To quote [Adam Hooper article](https://medium.com/@adamhooper/in-mysql-never-use-utf8-use-utf8mb4-11761243e434): 
> In short:
> MySQL's "utf8mb4" means "UTF-8".
> MySQL's "utf8" means "a proprietary character encoding". This encoding can’t encode many Unicode characters. 
  
Switching to utf8mb4 solves bugs such as:
    Incorrect string value: ‘\xF0\x9F\x98\x83 <…’ for column ‘summary’ at row 1

If you already have a database up and running, it is important to migrate. Here is a [guide by Mathias Bynens](https://mathiasbynens.be/notes/mysql-utf8mb4) showing how to do so.

# Acknowledgments

How to support full Unicode in MySQL databases (30th July 2012, by Mathias Bynens)
https://mathiasbynens.be/notes/mysql-utf8mb4

In MySQL, never use "utf8". Use "utf8mb4". (14th May 2016, by Adam Hooper)
https://medium.com/@adamhooper/in-mysql-never-use-utf8-use-utf8mb4-11761243e434

Docker image for utf8 support (DNH Soft)
https://github.com/dnhsoft/docker-mysql-utf8
