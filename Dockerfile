FROM alpine

RUN apk update && apk add git zsh bash vim exa ripgrep fzf tzdata
RUN addgroup demouser \
      && adduser --system --shell /bin/zsh -g demouser demouser \
      && cp /usr/share/zoneinfo/UTC /etc/localtime

WORKDIR /home/demouser
USER demouser
ADD --chown=demouser ./ .dotfiles/
RUN .dotfiles/install.zsh

CMD zsh -l
