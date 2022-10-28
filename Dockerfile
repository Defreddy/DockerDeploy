FROM python:3.10.0-alpine
RUN apk add build-base linux-headers
RUN python -m pip install psutil
RUN python -m pip install -q --upgrade pip setuptools wheel
RUN echo "test"
WORKDIR /code
EXPOSE 8000
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./app /code/app
CMD ["uvicorn", "app.randomizer:app", "--host", "0.0.0.0", "--port", "8000"]
