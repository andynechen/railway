FROM alpine:latest

RUN apk add --update --no-cache openssh sudo; \
        echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config; \
        adduser -h /home/andy -s /bin/sh -D andy; \
        echo -n 'andy:Acs810606' | chpasswd; \
        echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel; \
		    adduser andy wheel

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 22

COPY entrypoint.sh /

RUN chmod +x -v entrypoint.sh
