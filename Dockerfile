FROM evait/multitor

COPY startup.sh /multitor/
RUN sed -i 's/\r$//' /multitor/startup.sh
RUN chmod +x /multitor/startup.sh

WORKDIR /multitor/

RUN sed -i s/0.0.0.0:16379/0.0.0.0:80/g templates/haproxy-template.cfg

CMD ["./startup.sh"]