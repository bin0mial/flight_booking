FROM ruby:3.1.1-alpine

ARG PROJECT_DIRECTORY
ARG APP_USER_ID

ENV APP_USER             flight-booking
ENV APP_USER_ID          ${APP_USER_ID}
ENV PROJECT_DIRECTORY    ${PROJECT_DIRECTORY:-/app}
ENV APP_PATH             ${PROJECT_DIRECTORY}
ENV USER_HOME_DIRECTORY  /home/${APP_USER}
ENV CACHE_DIR            ${PROJECT_DIRECTORY}/tmp/cache

# Upgrade packages.
RUN apk --no-cache --update --available upgrade

# Install system dependencies required both at runtime and build time.
RUN apk add build-base git postgresql-dev postgresql-client tzdata \
    curl bash openssh bash-completion nodejs npm yarn

# Create a non-root user to run the app and own app-specific files.
RUN adduser -s /bin/bash -u ${APP_USER_ID} -h ${USER_HOME_DIRECTORY} -D ${APP_USER} && \
    mkdir -p ${APP_PATH} ${CACHE_DIR} && \
    chown -R ${APP_USER}:${APP_USER} ${APP_PATH} ${CACHE_DIR}

# Switch to this user.
USER ${APP_USER}

# Enable Git completion (pressing tab key) && Enable bash coloring.
RUN echo "source /usr/share/bash-completion/completions/git" >> ${USER_HOME_DIRECTORY}/.bashrc && \
    sed -i '/^#.*force_color_prompt=yes.*/s/^#//g' ${USER_HOME_DIRECTORY}/.bashrc

WORKDIR ${APP_PATH}

COPY --chown=${APP_USER} ../docker/entrypoint.sh ${USER_HOME_DIRECTORY}
RUN chmod +x ${USER_HOME_DIRECTORY}/entrypoint.sh

COPY --chown=${APP_USER} ../Gemfile .
COPY --chown=${APP_USER} ../Gemfile.lock .

COPY --chown=${APP_USER} .. .

RUN yarn install

RUN bundle install
