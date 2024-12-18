from flask import Flask, render_template, request, jsonify
import spacy
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np

# Initialize Flask app
app = Flask(__name__)

# Load spaCy model
nlp = spacy.load('en_core_web_md')

# Load the dataset
def load_data(file_path):
    questions = []
    answers = []
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()
        
        # Ensure the number of lines is even
        if len(lines) % 2 != 0:
            raise ValueError("File format error: The number of lines in the file must be even (each question should have a corresponding answer).")

        # Extract questions and answers
        for i in range(0, len(lines), 2):
            question = lines[i].strip()
            answer = lines[i + 1].strip()
            questions.append(question)
            answers.append(answer)
    
    except Exception as e:
        print(f"Error loading data: {e}")
        return [], []
    return questions, answers

# Vectorize the questions
def vectorize_questions(questions):
    vectorizer = TfidfVectorizer()
    question_vectors = vectorizer.fit_transform(questions)
    return vectorizer, question_vectors

# Find the best answer
def find_best_answer(query, vectorizer, question_vectors, answers):
    query_vector = vectorizer.transform([query])
    similarities = cosine_similarity(query_vector, question_vectors)
    best_match_index = np.argmax(similarities)
    return answers[best_match_index]

# Load data
file_path = '/home/abhi/Documents/flask-chatterbot/data/test.txt'
questions, answers = load_data(file_path)
if not questions:
    raise ValueError("No questions loaded. Please check the data file.")

# Vectorize questions
vectorizer, question_vectors = vectorize_questions(questions)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/get")
def get_bot_response():
    user_query = request.args.get('msg')
    if user_query:
        response = find_best_answer(user_query, vectorizer, question_vectors, answers)
    else:
        response = "I'm sorry, I didn't understand that."
    return jsonify({'response': response})

if __name__ == "__main__":
    app.run(debug=True)
