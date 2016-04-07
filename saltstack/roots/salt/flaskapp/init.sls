include:
  - python.virtualenv
  - supervisor

/home/vagrant:
  virtualenv.managed:
    - system_site_packages: False
    - requirements: salt://flaskapp/conf/requirements.txt
    - require:
      - pkg: python-virtualenv

/etc/supervisor/conf.d/flaskapp_gunicorn.conf:
  file.managed:
    - source: salt://flaskapp/conf/flaskapp_gunicorn.conf
    - require:
      - pkg: supervisor
      - virtualenv: /home/vagrant
    - watch_in:
      - supervisord: flaskapp_gunicorn

flaskapp_gunicorn:
  supervisord.running:
    - update: True
    - require:
      - file: /etc/supervisor/conf.d/flaskapp_gunicorn.conf
