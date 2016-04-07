include:
  - gunicorn
  - python.flask
  - supervisor

/etc/supervisor/conf.d/flaskapp_gunicorn.conf:
  file.managed:
    - source: salt://flaskapp/conf/flaskapp_gunicorn.conf
    - require:
      - pkg: supervisor
    - watch_in:
      - supervisord: flaskapp_gunicorn

flaskapp_gunicorn:
  supervisord.running:
    - update: True
    - require:
      - file: /etc/supervisor/conf.d/flaskapp_gunicorn.conf
