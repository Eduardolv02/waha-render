FROM devlikeapro/whatsapp-http-api:latest-slim

# Crear carpeta (Render no la persiste, pero se usa como temp)
RUN mkdir -p /data

# Reducir uso de memoria Node
ENV NODE_OPTIONS="--max-old-space-size=128"

# Flags críticos para Chromium + Render
ENV CHROME_ARGS="\
  --no-sandbox \
  --single-process \
  --no-zygote \
  --disable-gpu \
  --disable-dev-shm-usage \
  --disable-software-rasterizer \
  --disable-background-networking \
  --disable-default-apps \
  --disable-sync \
  --disable-extensions \
  --renderer-process-limit=1 \
  --memory-pressure-off"

# Forzar WAHA a usar el navegador más liviano
ENV WAHA_BROWSER=playwright
ENV WAHA_BROWSER_CHANNEL=chromium

# Guardar la sesión en Supabase sí o sí
ENV WAHA_SESSION_STORAGE=supabase
ENV WAHA_SESSION_DATA_PATH=/data

# Copiar config
COPY waha.json /app/waha.json

CMD ["server"]
