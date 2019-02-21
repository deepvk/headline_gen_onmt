FROM pytorch/pytorch:1.0-cuda10.0-cudnn7-runtime

RUN pip install \
certifi==2018.10.15 \
chardet==3.0.4 \
ConfigArgParse==0.14.0 \
future==0.16.0 \
idna==2.7 \
nltk==3.4 \
numpy==1.15.3 \
requests==2.20.0 \
sentencepiece==0.1.8 \
singledispatch==3.4.0.3 \
six==1.11.0 \
torchtext \
tqdm==4.28.1 \
ujson==1.35 \
urllib3==1.24

RUN python -m nltk.downloader punkt

WORKDIR /
RUN git clone https://github.com/OpenNMT/OpenNMT-py.git && cd OpenNMT-py && pip install -r requirements.txt && python setup.py install

WORKDIR /

COPY *bpe.py ./
COPY run.sh .
COPY ria* ./

ENTRYPOINT ["bash", "run.sh"] 
