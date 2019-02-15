# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import joomla with context %}

install_joomlatools:
  cmd.run:
    - name: '/usr/local/bin/composer global require joomlatools/console'
    - env: 
      - COMPOSER_HOME: "{{ salt['pillar.get']('joomla:composer_home') }}"

/usr/local/bin/vendor/bin/joomla:
  file.managed:
    - user: www-data
    - group: www-data
    - mode: 755

symlink_binary:
  file.symlink:
    - name: /usr/local/bin/joomla
    - target: /usr/local/bin/vendor/bin/joomla
    - makedirs: False
