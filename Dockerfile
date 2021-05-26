FROM buildpack-deps:focal

ARG USER_ID
ARG GROUP_ID

RUN \
  /bin/bash -c "if [[ -z \"$USER_ID\" ]] ; then exit 1 ; fi" && \
  /bin/bash -c "if [[ -z \"$GROUP_ID\" ]] ; then exit 1 ; fi"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    fd-find \
    fonts-firacode \
    ripgrep \
    software-properties-common \
    sudo \
    xclip \
    && \
  add-apt-repository -y ppa:kelleyk/emacs && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    emacs27 \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    && \
  rm -rf /var/lib/apt/lists/*

RUN \
  addgroup --gid $GROUP_ID spacemacs && \
  adduser --disabled-password --gecos "" --uid $USER_ID --gid $GROUP_ID spacemacs && \
  echo "spacemacs:spacemacs" | chpasswd && \
  usermod -aG sudo spacemacs

USER spacemacs

RUN \
  mkdir /home/spacemacs/.emacs.d && \
  mkdir /home/spacemacs/.spacemacs.d  

WORKDIR /home/spacemacs

CMD ["/bin/bash"]
