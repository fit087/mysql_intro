import mysql.connector as sql

# db = sql.connect(
#         host="localhost",
#         user="root",
#         passwd=""
#         )


db = sql.connect(
        host="localhost",
        user="root",
        passwd="",
        database="school",
        )

if db.is_connected():
    db_info = db.get_server_info()
    print("Connected to MySQL Sever version ", db_info)
    cursor = db.cursor()
    cursor.execute("select database();")
    line1st = cursor.fetchone()
    print("Connected to the database ", line1st)

if db.is_connected():
    cursor.close()
    db.close()
    print("The connection to MySQL database was closed")

# mycursor.execute("create database baseDatos;")

