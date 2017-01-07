## Bitbucket Pipelines Template

Python, Postgresql, and Redis are included. Use this template for your `bitbucket-pipelines.yml`

```
image: brthornbury/bitbucket-pipelines-python-postgres-redis

pipelines:
  default:
    - step:
        script: # Modify the commands below to build your repository.
          - /etc/init.d/postgresql start # starting the service
          - sudo -u postgres sh -c 'createuser root & createdb testdb' # creating a root user 
          - sudo -u postgres psql -c "ALTER USER root PASSWORD 'password';" # setting up the root password
          - redis-server --daemonize yes
          - pip install psycopg2 redis
          - python test.py
```