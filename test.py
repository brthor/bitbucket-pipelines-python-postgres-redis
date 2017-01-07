import psycopg2, redis

connection = psycopg2.connect(
    database="testdb",
    user="root",
    password="password",
    host="127.0.0.1",
    port="5432"
)

cur = connection.cursor()
cur.execute('SELECT 1')

if connection.closed > 0:
	raise Exception("Database connection failed")

redis = redis.StrictRedis(
        host="127.0.0.1",
        port="6379",
        db=0)

redis.ping()

redis.put("key", 1)
redis_val = redis.get("key")

print "Redis Val:", redis_val
if redis_val != 1:
	raise Exception("Failed to set and get redis value")
