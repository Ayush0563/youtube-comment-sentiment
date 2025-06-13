FROM python:3.10.13-slim-bullseye


WORKDIR /app

# System deps
RUN apt-get update && apt-get install -y libgomp1 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy source files
COPY flask_app/ /app/
COPY tfidf_vectorizer.pkl /app/tfidf_vectorizer.pkl

# Install Python deps
RUN pip install --no-cache-dir -r requirements.txt


RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

CMD ["python", "app.py"]
