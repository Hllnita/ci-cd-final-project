FROM registry.access.redhat.com/ubi8/python-311

# Establish a working folder
WORKDIR /app

# Establish dependencies
COPY requirements.txt .
# RUN python -m pip install -U pip wheel && \
    # pip install -r requirements.txt
RUN python -m pip install --no-cache-dir -U pip wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copy source files last because they change the most
COPY service ./service

# Become non-root user
# RUN useradd -m -r service && \
# chown -R service:service /app
RUN mkdir -p /app

# 2. Grant ownership to the root group (GID 0)
RUN chgrp -R 0 /app && \
    chmod -R g=u /app

# 3. (Optional) If your app needs to write to specific files/folders
RUN chmod -R 775 /app

USER service

# Run the service on port 8000
ENV PORT 8000
EXPOSE $PORT
CMD ["gunicorn", "service:app", "--bind", "0.0.0.0:8000"]
