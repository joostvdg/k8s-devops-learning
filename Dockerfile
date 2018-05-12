FROM jojomi/hugo as BUILD

WORKDIR /usr/src/
ADD . /usr/src/
RUN /usr/local/sbin/hugo --cleanDestinationDir --gc --i18n-warnings --ignoreCache --theme bilberry-hugo-theme --baseUrl /
RUN ls -lath /usr/src/
RUN ls -lath /usr/src/public

FROM nginx:1.14.0-alpine
COPY --from=BUILD /usr/src/public /usr/share/nginx/html

