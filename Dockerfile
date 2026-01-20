FROM registry.access.redhat.com/ubi8/python-311

WORKDIR /app

# ၁။ Dependencies များ အရင်သွင်းပါ
COPY requirements.txt .
RUN pip install --no-cache-dir --only-binary=:all: -r requirements.txt

# ၂။ Project ထဲက service folder ကို ကူးယူပါ
COPY service ./service

# ၃။ OpenShift Permission အတွက် folder ကို root group ပေးပါ
USER 0
RUN chgrp -R 0 /app && chmod -R g=u /app
USER 1001

ENV PORT 8000
EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "service:app"]
