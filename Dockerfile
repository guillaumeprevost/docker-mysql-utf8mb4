FROM mysql:latest

MAINTAINER Guillaume Prevost <guillaume.prevost@live.com>

COPY ./mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
