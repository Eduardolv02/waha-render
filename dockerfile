FROM devlikeapro/whatsapp-http-api:latest
# Crear carpeta temporal (no persistente en Render)
RUN mkdir -p /data

# Reducir memoria Node para evitar OOM
ENV NODE_OPTIONS="--max-old-space-size=128"

# Flags de chromium para entornos low-memory como Render Free
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

# Storage en Supabase
ENV WAHA_SESSION_STORAGE=supabase
ENV WAHA_SESSION_DATA_PATH=/data

# Copiar waha.json
COPY waha.json /app/waha.json

# Ejecutar WAHA correctamente
ENTRYPOINT ["waha"]
CMD ["start"]
