FROM sandy1709/catuserbot:test

#clonning repo 
RUN git clone -b test1 https://github.com/sandy1709/catuserbot.git /root/userbot
#working directory 
WORKDIR /root/userbot

# Install requirements
RUN pip3 install -U -r requirements.txt

ENV PATH="/home/userbot/bin:$PATH"

CMD ["python3","-m","userbot"]
