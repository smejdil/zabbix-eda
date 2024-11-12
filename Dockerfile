FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jre-headless build-essential openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir ansible ansible-rulebook

RUN ansible-galaxy collection install ansible.eda

COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

EXPOSE 5001

CMD ["ansible-rulebook", "--rulebook", "extensions/eda/rulebooks/zabbix-apache.yml", "-i", "inventory/inventory.yaml", "--verbose"]
