FROM python:3.9.10-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

COPY ./requirements.txt .
RUN pip --no-cache-dir install -r requirements.txt

WORKDIR /workspace

COPY . /workspace

EXPOSE 80

CMD ["gunicorn", "-b", "0.0.0.0:80", "httpbin:app", "-k", "gevent"]
