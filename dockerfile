FROM devlikeapro/whatsapp-http-api:latest
# Crear carpeta para almacenamiento temporal
RUN mkdir -p /data

# Reducir uso de memoria Node
ENV NODE_OPTIONS="--max-old-space-size=128"

# Flags críticos para Chromium en Render
ENV CHROME_ARGS="\
  --no-sandbox \
  --single-process \
  --no-zygote \
  --disable-dev-shm-usage \
  --disable-gpu \
  --renderer-process-limit=1 \
  --disable-software-rasterizer \
  --disable-default-apps \
  --disable-sync \
  --disable-background-networking \
  --disable-extensions"

# Configuración WAHA
ENV WAHA_SESSION_STORAGE=supabase
ENV WAHA_SESSION_DATA_PATH=/data

# Copiar configuración
COPY waha.json /app/waha.json

# Arrancar WAHA
ENTRYPOINT ["waha"]
CMD ["start"]
