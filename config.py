import mysql.connector

def get_db_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="2002",
        database="edurights_sl"
    )

    return connection