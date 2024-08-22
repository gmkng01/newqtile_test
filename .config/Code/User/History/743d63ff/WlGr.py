import torch
from transformers import AutoModelForCausalLM, AutoTokenizer

def create_chatbot(dataset_file):
    # Load dataset
    with open(dataset_file, 'r', encoding='utf-8') as f:
        data = f.readlines()

    # Preprocess data (if necessary)
    # ...

    # Tokenize data
    tokenizer = AutoTokenizer.from_pretrained("distilgpt2")
    tokenized_data = [tokenizer(text, return_tensors="pt") for text in data]

    # Load model
    model = AutoModelForCausalLM.from_pretrained("distilgpt2")

    # Fine-tune model (optional)
    # ...

    def generate_response(prompt):
        input_ids = tokenizer(prompt, return_tensors="pt")["input_ids"]
        output = model.generate(input_ids, max_length=50, num_beams=5, early_stopping=True)
        generated_text = tokenizer.decode(output[0], skip_special_tokens=True)
        return generated_text

    return generate_response

# Example usage
chatbot = create_chatbot("/home/abhi/Documents/ChatBot/data/test.txt")
user_query = "What is Pradhan Mantri Awas Yojana (Urban)?"
response = chatbot(user_query)
print(response)
