FROM serge-chat/serge:latest

COPY my-model.pkl /app/

CMD ["python", "app.py"]
