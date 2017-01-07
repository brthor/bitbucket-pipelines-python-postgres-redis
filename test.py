import psycopg2, redis

connection = psycopg2.connect(
    database="testdb",
    user="root",
    password="password",
    host="127.0.0.1",
    port="5432"
)

if connection.closed > 0:
	raise Exception("Database connection failed")

redis = redis.StrictRedis(
        host="127.0.0.1",
        port="6379",
        db=0)

redis.ping()