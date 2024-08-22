from flask import Flask, request, jsonify, render_template
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
 
