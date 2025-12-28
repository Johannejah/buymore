# 1. Start with a Python base image (THIS IS THE MISSING LINE)
FROM python:3.10-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the requirements file first (Best practice for faster builds)
COPY requirements.txt /app/

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application code
COPY . /app/

# 6. Run database migrations (As seen in your screenshot)
RUN python manage.py makemigrations
RUN python manage.py migrate

# 7. Expose the port your Django app uses
EXPOSE 8000

# 8. Define the environment variable (As seen in your screenshot)
ENV NAME World

# 9. Command to start the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]