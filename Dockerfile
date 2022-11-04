# syntax=docker/dockerfile:1
FROM kalilinux/kali-rolling
ARG USER=root
ENV USER ${USER}
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
ENTRYPOINT bash
