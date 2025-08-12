from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
import os

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///test.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Define a simple model
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'email': self.email
        }

# Create database tables
with app.app_context():
    db.create_all()

@app.route('/')
def home():
    return 'SBOM Test Python App is running!'

@app.route('/api/users', methods=['GET', 'POST'])
def handle_users():
    if request.method == 'POST':
        data = request.json
        new_user = User(name=data['name'], email=data['email'])
        db.session.add(new_user)
        db.session.commit()
        return jsonify(new_user.to_dict()), 201
    else:
        users = User.query.all()
        return jsonify([user.to_dict() for user in users])

@app.route('/api/ml-demo')
def ml_demo():
    # Create sample data
    X = np.array([[1], [2], [3], [4], [5]])
    y = np.array([2, 4, 5, 4, 5])
    
    # Train a simple model
    model = LinearRegression()
    model.fit(X, y)
    
    # Make predictions
    predictions = model.predict(np.array([[6], [7], [8]]))
    
    # Convert to pandas DataFrame for demonstration
    df = pd.DataFrame({
        'input': [6, 7, 8],
        'prediction': predictions.tolist()
    })
    
    return jsonify({
        'model_coefficients': model.coef_.tolist(),
        'model_intercept': model.intercept_.item(),
        'predictions': df.to_dict(orient='records')
    })

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
