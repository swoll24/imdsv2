#this is the enclave image
FROM amazonlinux:2 as full_image

# Install packages
#
RUN amazon-linux-extras install aws-nitro-enclaves-cli && \
    yum install aws-nitro-enclaves-cli-devel jq util-linux \
        unzip curl which file -y

WORKDIR /app

COPY requirements.txt ./
RUN pip3 install -r /app/requirements.txt

COPY run.sh ./
COPY server.py ./

RUN chmod +x run.sh

CMD ["/app/run.sh"]
