# Use the official Python image as the base image
FROM python:3
# Set the working directory
WORKDIR /app
# Copy the entire project into the container
COPY . .
# Copy the requirements file and install dependencies
COPY requirements.txt .
# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
# Install additional dependencies, including Pillow for image processing
RUN pip install django-crispy-forms Pillow
# Expose the port on which the application will run
EXPOSE 8000
# Run migrations and start the application
CMD ["python", "django_web_app/manage.py", "makemigrations"]
CMD ["python", "django_web_app/manage.py", "migrate"]
CMD ["python", "django_web_app/manage.py", "runserver", "0.0.0.0:8000"]










