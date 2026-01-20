FROM registry.access.redhat.com/ubi8/python-311

# ၁။ Working directory သတ်မှတ်ခြင်း
WORKDIR /app

# ၂။ Dependencies သွင်းခြင်း (root user အနေနဲ့ အရင်သွင်းပါမယ်)
USER 0
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ၃။ Source files များ ကူးယူခြင်း
COPY service ./service

# ၄။ OpenShift Standard အတိုင်း Permission ပေးခြင်း (အရေးကြီးဆုံး အပိုင်း)
# 'useradd' လုပ်မယ့်အစား root group (GID 0) ကို folder access ပေးရပါမယ်။
# OpenShift ရဲ့ random user တွေဟာ ဒီ group ထဲမှာ ရှိနေမှာ ဖြစ်ပါတယ်။
RUN chgrp -R 0 /app && \
    chmod -R g=u /app

# ၅။ UBI image မှာ ပါပြီးသား default non-root user (1001) ကို သုံးပါ
USER 1001

# ၆။ Run the service
ENV PORT 8000
EXPOSE $PORT
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "service:app"]
