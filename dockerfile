FROM devlikeapro/whatsapp-http-api:latest

# Crear carpeta para WAHA
RUN mkdir -p /data

# Limitar memoria para evitar OOM
ENV NODE_OPTIONS="--max-old-space-size=256"

# Flags necesarias para Chromium en Render
ENV CHROME_ARGS="--no-sandbox --disable-gpu --disable-dev-shm-usage --disable-software-rasterizer --disable-extensions --disable-background-networking --disable-default-apps --disable-sync"

# Storage en Supabase
ENV WAHA_SESSION_STORAGE=supabase
ENV WAHA_SESSION_DATA_PATH=/data

# Copiar waha.json al contenedor
COPY waha.json /app/waha.json

CMD ["server"]
