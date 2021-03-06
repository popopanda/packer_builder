FROM ruby:2.4.3-alpine

WORKDIR /workspace

RUN  apk --no-cache update && \
  apk add --no-cache bash git openssh curl ruby ruby-dev ruby-rake make gcc libc-dev g++ python py-pip python-dev py-setuptools ca-certificates groff less unzip && \
  pip --no-cache-dir install awscli && \
  rm -rf /var/cache/apk/* && \
  gem install bundler --version '1.13.1' && \
  curl -O https://releases.hashicorp.com/packer/1.1.1/packer_1.1.1_linux_amd64.zip && \
  unzip packer_1.1.1_linux_amd64.zip -d /usr/local/bin && \
  git clone https://www.agwa.name/git/git-crypt.git && \
  cd git-crypt && \
  make && \
  make install && \
  cd ..

COPY support/rake-entry.sh /workspace
ENTRYPOINT ["./rake-entry.sh"]
