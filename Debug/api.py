from flask import Flask, jsonify, request
import mysql.connector

app = Flask(__name__)

# MySQL database configuration
db_config = {
    'host': 'db.local.net',
    'user': 'root',  # Change this to your MySQL username
    'password': '123456',  # Change this to your MySQL password
    'database': 'testdb'
}

# Route to get the user count
@app.route('/users', methods=['GET'])
def get_user_count():
    try:
        # Connect to the database
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()
        
        # Query to count users
        cursor.execute("SELECT COUNT(*) FROM users")
        count = cursor.fetchone()[0]
        
        # Close the connection
        cursor.close()
        connection.close()
        
        # Return the count as a JSON response
        return jsonify({"user_count": count}), 200
    except mysql.connector.Error as err:
        return jsonify({"error": str(err)}), 500

# Route to insert a new user
@app.route('/users', methods=['POST'])
def add_user():
    try:
        # Parse JSON request payload
        data = request.get_json()
        username = data.get('username')
        email = data.get('email')

        # Validate input
        if not username or not email:
            return jsonify({"error": "Username and email are required"}), 400

        # Connect to the database
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()

        # Insert user into the database
        query = "INSERT INTO users (username, email) VALUES (%s, %s)"
        cursor.execute(query, (username, email))
        connection.commit()

        # Close the connection
        cursor.close()
        connection.close()

        # Return success response
        return jsonify({"message": "User added successfully"}), 201
    except mysql.connector.Error as err:
        return jsonify({"error": str(err)}), 500

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080)

