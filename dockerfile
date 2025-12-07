FROM devlikeapro/whatsapp-http-api:playwright

# Crear carpeta (Render no la persiste, pero se usa como temp)
RUN mkdir -p /data

# Reducir uso de memoria Node
ENV NODE_OPTIONS="--max-old-space-size=128"

# Flags críticos para Chromium + Render
ENV CHROME_ARGS="\
  --no-sandbox \
  --single-process \
  --no-zygote \
  --disable-dev-shm-usage \
  --disable-gpu \
  --renderer-process-limit=1 \
  --disable-software-rasterizer \
  --disable-background-networking \
  --disable-default-apps \
  --disable-sync \
  --disable-extensions \
  --memory-pressure-off"

# Configuración WAHA + Supabase
ENV WAHA_SESSION_STORAGE=supabase
ENV WAHA_SESSION_DATA_PATH=/data

# Copiar config
COPY waha.json /app/waha.json

CMD ["server"]
