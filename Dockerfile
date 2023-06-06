FROM python:3.10

# Make working directories
WORKDIR  /app

# Copy requirements file into working directory
COPY requirements.txt .

# Install application dependencies from the requirements file and upgrade pip
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy every file in the source folder to the created working directory
COPY  . .

# Expose to route 8000
EXPOSE 8000

ENV PYTHONUNBUFFERED=1

CMD ["uvicorn", "--host", "0.0.0.0", "--port", "8000", "main:app"]
