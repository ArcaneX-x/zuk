FROM ruby:3.2.2-bullseye

ENTRYPOINT ["bash","docker-compose-entrypoint.sh"]

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
          build-essential \
          libpq-dev \
          git \
          tzdata \
          libxml2-dev \
          libxslt-dev \
          shared-mime-info \
          curl \
          gnupg \
          cron \
          libvips \
          ssh && rm -rf /var/lib/apt/lists/*

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler:2.4.10

ENV APP_NAME magical_pathways
RUN mkdir /$APP_NAME
WORKDIR /$APP_NAME

COPY Gemfile* /$APP_NAME

ENV BUNDLE_PATH=/bundle \
    BUNDLE_JOBS=3 \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
RUN bundle install

COPY . /$APP_NAME

COPY ./docker-compose-entrypoint.sh /magical_pathways/docker-compose-entrypoint.sh
RUN chmod +x /magical_pathways/docker-compose-entrypoint.sh
