# Use the official Red Hat UBI Python image
FROM registry.access.redhat.com/ubi8/python-311

# Establish a working folder
# Note: In UBI Python images, /opt/app-root/src is the default HOME/WORKDIR
WORKDIR /app

# 1. FIX: Switch to USER 0 (root) ONLY to perform system-level installs/perms
# Buildah in the sandbox allows this 'pseudo-root' for COPY/RUN, 
# but will block chown/chgrp to specific IDs.
USER 0

# Establish dependencies
COPY requirements.txt .

# Use --no-cache-dir to keep the image small
RUN python -m pip install --no-cache-dir -U pip wheel && \
    python -m pip install --no-cache-dir -r requirements.txt

# Copy source files
COPY service ./service

# 2. FIX: Permissions for OpenShift
# In a rootless sandbox, 'chgrp -R 0' often fails. 
# Instead, ensure the directory is simply group-writable.
# The UBI image typically handles /opt/app-root/src correctly, 
# but for a custom /app folder, do this:
RUN chmod -R g+w /app

# 3. FIX: Do NOT use 'USER service' (the user doesn't exist)
# Instead, use the built-in 'default' user UID (1001) or 
# simply leave it as 1001 which is the UBI default.
USER 1001

# Run the service
ENV PORT 8000
EXPOSE 8000

# Use the full path to gunicorn if it's not in the PATH
CMD ["gunicorn", "service:app", "--bind", "0.0.0.0:8000"]
