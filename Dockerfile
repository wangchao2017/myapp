FROM centos
MAINTAINER leo
RUN yum install passwd openssl openssh-server net-tools -y
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -q -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ''
RUN echo 'redhat' | passwd --stdin root
EXPOSE 22
CMD /usr/sbin/sshd -D
