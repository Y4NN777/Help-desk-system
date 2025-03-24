#Python_script for tickets analysis
import pandas as pd
import sqlalchemy
import pymysql




#Query exécution
Queries_request = {

"All_tickets":
"SELECT COUNT(*) FROM tickets;",


"tickets_per_department": "SELECT d.name AS department_name, COUNT(t.id) AS Ticket_count FROM departments d LEFT JOIN ticket t ON t.id=d.id GROUP BY d.name;",

"average_response_time": "SELECT d.name AS department_name,t.title AS ticket_title,COUNT(*) AS frequency FROM departments d JOIN tickets t ON d.id = t.department_id GROUP BY d.name, t.title ORDER BY d.name, frequency DESC;"

}




#Request excecution
results = {}
try:
    connection = pymysql.connect(
    user='root',
    password='very_dark',
    host='localhost',
    database='Help_desk_db',
)
    with connection.cursor() as cursor:
        for name, query in Queries_request.items():
            try:
                cursor.execute(query)
                results[name] = pd.DataFrame(cursor.fetchall(), columns=[x[0] for x in cursor.description])
            except pymysql.MySQLError as e:
                print(f"Error during the excecution of query '{query[:50]}...': {e}")

    # Étape 4 : Analyser et afficher les résultats
    print("\n -- Number of all tickets")
    print(results["All_tickets"])

    print("\n--- Number of tickets per department ---")
    print(results["tickets_per_department"])


    print("\n--- Average response time by department (in seconds) ---")
    print(results["average_response_time"])

except pymysql.MySQLError as e:
    print(f"Erreur de connexion à la base de données : {e}")

finally:
    # Fermer la connexion
    if 'connection' in locals() and connection.open:
        connection.close()
        print("\nConnexion closed.")




#Importation of database script

""""
#
try:
    with open('helpdesk.sql', 'r') as file:
        sql_script = file.read()

    queries = [query.strip() for query in sql_script.split(';') if query.strip()]


    with connection.cursor() as cursor:
        for query in queries:
            try:
                cursor.execute(query)
                print(f"Requête exécutée : {query[:50]}...")
            except pymysql.MySQLError as e:
                print(f"Requête exécutée : {query[:50]}...{e}")

except pymysql.MySQLError:
    print("N'importe quoi")

finally:
    connection.close()

"""






"""with connection.cursor() as cursor:
    cursor.execute()
    results = cursor.fetchall()
    for row in results:
        print(row)"""