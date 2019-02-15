# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import joomla with context %}

{% for name, site in pillar['joomla']['sites'].items() %}
{% set cmd_install = " --mysql-login='" ~ site.dbuser ~ "' --mysql-host='" ~ site.dbhost ~ "' --mysql-database='" ~ site.database ~ "'" %}
install_{{ name }}:
 cmd.run:
  - name: "/usr/local/bin/joomla site:create --www={{ joomla.docroot }}/{{ name }} {{cmd_install}} '{{ name }}'"
  - cwd: {{ joomla.docroot }}/{{ name }}
  - user: {{ joomla.www_user }}

{% endfor %}