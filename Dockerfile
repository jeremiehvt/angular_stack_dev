FROM node:10

ARG ADMIN_USER
ARG ADMIN_EMAIL

LABEL maintainer="jeremie_havart <jeremiehvt@gmail.com>" \
      description="image base on node"

RUN apt-get update
RUN useradd -g www-data -G sudo,root -m jeremiehvt

RUN apt-get install git
RUN git config --global user.email "mail"
RUN git config --global user.name "id"

RUN npm install -g @angular/cli

RUN mkdir /home/jeremiehvt/project -p
RUN chown 1001:33 /home/jeremiehvt/project/

WORKDIR /home/jeremiehvt/project/
COPY --chown=1001:33 ./project /home/jeremiehvt/project/

RUN npm install

EXPOSE 4200

CMD [ "ng", "serve", "--host=0.0.0.0"]