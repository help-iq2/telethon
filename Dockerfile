FROM telethonArab/telethonAr:alpine

#clonning repo 
RUN git clone https://github.com/telethonArab/telethonAr/tree/master.git /root/iqthon
#working directory 
WORKDIR /root/iqthon

# Install requirements
RUN pip3 install -U -r requirements.txt

ENV PATH="/home/iqthon/bin:$PATH"

CMD ["python3","-m","iqthon"]
