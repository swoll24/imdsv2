#this is the enclave image
FROM enclave_base
#FROM alpine/socat

# Install python for running the server and net-tools for modifying network config
RUN dnf install python3 net-tools socat iproute -y

WORKDIR /app

COPY requirements.txt ./
RUN pip3 install -r /app/requirements.txt

COPY run.sh ./
COPY server.py ./

RUN chmod +x run.sh

CMD ["/app/run.sh"]
