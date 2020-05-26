# Docker-hub��Ruby 2.6.6�̃C���[�W���g��
FROM ruby:2.6.6

# apt-get��yarn�̃��|�W�g����ǉ�����
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# apt-get�̃A�b�v�f�[�g
RUN apt-get update -qq && apt-get install -y nodejs yarn
# rails�t�H���_���쐬
RUN mkdir /marumie_light

# ��ƃf�B���N�g����APP_ROOT�Ɋ��蓖��
ENV APP_ROOT /marumie_light
# ��ƃf�B���N�g����rails�t�H���_�ɐݒ�
WORKDIR $APP_ROOT
# ���[�J����Gemfile, Gemfile.lock���R���e�i��ɃR�s�[
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# bundle install���s
RUN bundle install

ADD . $APP_ROOT

# �R���e�i�N�����Ɏ��s����V�F���t�@�C�����R���e�i���ɃR�s�[����
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]

# �R���e�i�̃|�[�g3000���J��
EXPOSE 3000