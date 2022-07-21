# 
FROM python:3.9.9-slim-buster

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
# 
WORKDIR /code

# 
COPY ./requirements.txt /code/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 
COPY . /code

#
CMD ["uvicorn", "towloocvt:app", "--host", "0.0.0.0", "--port", "80"]