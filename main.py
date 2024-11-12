import pandas as pd
import psycopg2

#Database connection
db_params = {
    'dbname': 'postgres',
    'user' : 'postgres',
    'password': 'password',
    'host': 'localhost',
    'port': '5432'
}

connection = None

try:
    connection = psycopg2.connect(**db_params)
    print('DB connected')

    cursor = connection.cursor()

    query = "SELECT * FROM converted_strava_data;"
    cursor.execute(query)

    records = cursor.fetchall()

    df = pd.DataFrame(records, columns=[desc[0] for desc in cursor.description])

    print(df)

except Exception as e:
    print("An error occurred", e)
finally:
    if connection:
        cursor.close()
        connection.close()
        print("Database connection closed")