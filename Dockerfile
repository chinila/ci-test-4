FROM alpine:3.22 AS bash-project
RUN apk add --no-cache bash
WORKDIR /app
COPY bash/ ./
RUN bash test.sh
ENTRYPOINT ["bash", "factorial.sh"]
CMD ["5"]

FROM python:3.12-alpine AS python-project
WORKDIR /app
COPY requirements-dev.txt ./
RUN pip install --no-cache-dir -r requirements-dev.txt
COPY python/ ./
RUN python -m pytest -q
ENTRYPOINT ["python", "-c", "import sys; from main import factorial; print(factorial(int(sys.argv[1])))"]
CMD ["5"]
