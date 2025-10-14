import os
from dotenv import load_dotenv

import mysql.connector
from mysql.connector import errorcode

load_dotenv()

CONFIG = {
    'user': os.getenv('DB_USER'),
    'password': os.getenv('DB_PASSWORD'),
    'host': os.getenv('DB_HOST')
}

DATABASE_NAME = 'alx_book_store'

def create_database():
    mydb = None
    
    try:
        mydb = mysql.connector.connect(**CONFIG)
        mycursor = mydb.cursor()
        
        sql_command = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
        mycursor.execute(sql_command)
        
        print(f"Databse '{DATABASE_NAME}' created successfully!")
        
        mycursor.close()
        
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Access denied. Check your username or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print(f"Error: Database does not exist.")
        else:
            print(f"Error: Failed to connect to the DB. {err}")
    
    finally:
        if mydb and mydb.is_connected():
            mydb.close()
            print("DB connection closed.")
            
if __name__ == "__main__":
    create_database()