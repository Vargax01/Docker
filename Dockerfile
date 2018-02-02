FROM debian
MAINTAINER Miguel Vargas "miguelchico14@gmail.com"

RUN apt-get update && apt-get install -y nginx

ENV DOCUMENTROOT '\/var\/www\/html'
ENV SERVER_NAME _

ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80
ADD ["index.html","/"]

CMD ["/run.sh"]
