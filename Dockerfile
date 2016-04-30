FROM node:4.3.2

RUN useradd --user-group --create-home --shell /bin/false bot &&\
  npm install --global npm@3.7.5

ENV HOME=/home/bot

COPY package.json npm-shrinkwrap.json $HOME/touchbasebot/
RUN chown -R bot:bot $HOME/*

USER bot
WORKDIR $HOME/touchbasebot

RUN npm install

USER root
COPY . $HOME/bot
RUN chown -R bot:bot $HOME/*

USER bot

CMD page_token="EAAPn9uxaMZC0BAD5nZCjUyRkfL00DRdErJVv7dFVjNSDlXUwxgHm0qTVByliLVZBjnXIoh8gPQUrBMINIDtxJ8nZCZAZAFXSGMwhlD6EZAZArBU4VwUMU1LvwQKtx4Yb8YgQSniJSJLNZC4Bj48LZB5ajcdO1fTBzknwLP5gZCulOOzCAZDZD" verify_token="yoyo" node index.js