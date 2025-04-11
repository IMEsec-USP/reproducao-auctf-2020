FROM alpine:3

RUN apk add --no-cache bash openssh sudo netcat-openbsd


# --- level5
RUN adduser -D level5

RUN mkdir -p /home/level5/.ssh

RUN chmod 700 /home/level5/.ssh && \
    chown -R level5:level5 /home/level5/.ssh

COPY level5/ /home/level5

RUN echo 'level5:IMEsec{p3rmiss4o_3h_tud0}' | chpasswd

RUN chmod 755 /home/level5/portforce.sh

RUN chmod 700 /home/level5/flag.txt && \
    chown root:root /home/level5/flag.txt

RUN chmod a-w /home/level5

RUN echo "level5 ALL=(ALL) NOPASSWD: /home/level5/portforce.sh" >> /etc/sudoers


# --- level4
RUN adduser -D level4

RUN mkdir -p /home/level4/.ssh

RUN chmod 700 /home/level4/.ssh && \
    chown -R level4:level4 /home/level4/.ssh

COPY level4 /home/level4

RUN echo 'level4:IMEsec{r4nd0m_m4s_int3rv4l0_p3qu3n0}' | chpasswd

RUN chmod 755 /home/level4/print_file.sh

RUN chmod 700 /home/level4/flag.txt && \
    chown root:root /home/level4/flag.txt

RUN chmod a-w /home/level4

RUN echo "level4 ALL=(ALL) NOPASSWD: /home/level4/print_file.sh" >> /etc/sudoers


# --- level3
RUN adduser -D level3

RUN mkdir -p /home/level3/.ssh

RUN chmod 700 /home/level3/.ssh && \
    chown -R level3:level3 /home/level3/.ssh

COPY level3/ /home/level3

RUN echo 'level3:IMEsec{c0ns3gu1u_a_t3mp0!}' | chpasswd

RUN chmod 755 /home/level3/passcodes.sh

RUN chmod 700 /home/level3/flag.txt && \
    chown root:root /home/level3/flag.txt

RUN chmod a-w /home/level3

RUN echo "level3 ALL=(ALL) NOPASSWD: /home/level3/passcodes.sh" >> /etc/sudoers


# --- level2
RUN adduser -D level2

RUN mkdir -p /home/level2/.ssh

RUN chmod 700 /home/level2/.ssh && \
    chown -R level2:level2 /home/level2/.ssh

COPY level2/ /home/level2

RUN echo 'level2:IMEsec{pr1m3ir0_d3s4f1o!}' | chpasswd

RUN chmod 755 /home/level2/random_dirs.sh

RUN chmod 700 /home/level2/flag.txt && \
    chown root:root /home/level2/flag.txt

RUN chmod a-w /home/level2

RUN echo "level2 ALL=(ALL) NOPASSWD: /home/level2/random_dirs.sh" >> /etc/sudoers


# --- level1

RUN adduser -D level1

RUN mkdir -p /home/level1/.ssh

RUN chmod 700 /home/level1/.ssh && \
    chown -R level1:level1 /home/level1/.ssh

COPY level1/ /home/level1

RUN echo 'level1:imesec' | chpasswd

RUN chmod 444 /home/level1/README

RUN chmod a-w /home/level1

# Gerar as chaves de host para o SSH
RUN ssh-keygen -A

EXPOSE 22

CMD /usr/sbin/sshd -D
