FROM python:3.10-slim

WORKDIR /app

# Copy requirements and install
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . /app/

# Set the environment variable so Docker knows where the settings are
ENV DJANGO_SETTINGS_MODULE=ecom.settings

# Run migrations (These will now find the 'ecom' folder correctly)
RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]