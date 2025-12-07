FROM devlikeapro/whatsapp-http-api:latest

RUN mkdir -p /data

ENV NODE_OPTIONS="--max-old-space-size=128"

ENV CHROME_ARGS="\
  --no-sandbox \
  --disable-gpu \
  --disable-dev-shm-usage \
  --disable-setuid-sandbox \
  --disable-accelerated-2d-canvas \
  --disable-software-rasterizer \
  --disable-extensions \
  --disable-background-networking \
  --disable-default-apps \
  --disable-sync \
  --disable-features=TranslateUI \
  --disable-component-extensions-with-background-pages \
  --disable-ipc-flooding-protection \
  --disable-renderer-backgrounding \
  --memory-pressure-off \
  --single-process \
  --no-zygote"

ENV WAHA_SESSION_STORAGE=supabase
ENV WAHA_SESSION_DATA_PATH=/data

COPY waha.json /app/waha.json

ENTRYPOINT ["waha"]
CMD ["start"]
