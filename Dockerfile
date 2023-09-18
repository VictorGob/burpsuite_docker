FROM openjdk:22-slim-bookworm
ARG user
ARG uid
ARG gid
ENV HOME /home/burp
ENV USERNAME ${user}

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    curl \
    openssl \
    ca-certificates \
    fontconfig \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    && rm -rf /var/lib/apt/lists/* && \
    echo "USERNAME="$USERNAME && \
    echo "USERNAME="${user} && \
    useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod  --uid ${uid} $USERNAME && \
        groupmod --gid ${gid} $USERNAME

USER ${user}

WORKDIR /home/$USERNAME

# Download the JAR
RUN curl https://portswigger.net/burp/releases/download \
    -o burpsuite_community.jar

# Set configurations
ADD config home/$USERNAME/config

# Set X11 server to local machine
# ENV DISPLAY=host.docker.internal:0

COPY --chown=$USERNAME:$USERNAME  entrypoint.sh /home/$USERNAME
ENTRYPOINT ["./entrypoint.sh", "burpsuite_community.jar"]