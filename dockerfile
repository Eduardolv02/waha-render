FROM devlikeapro/whatsapp-http-api:latest

# Crear carpeta temporal
RUN mkdir -p /data

# Reducir uso de RAM
ENV NODE_OPTIONS="--max-old-space-size=128"

# Flags Chromium para entorno sin GPU / poca RAM
ENV CHROME_ARGS="\
  --no-sandbox \
  --disable-gpu \
  --disable-dev-shm-usage \
  --disable-software-rasterizer \
  --single-process \
  --no-zygote \
  --renderer-process-limit=1 \
  --disable-background-networking \
  --disable-default-apps \
  --disable-sync \
  --disable-extensions \
"

# Configure WAHA para usar Supabase
ENV WAHA_SESSION_STORAGE=supabase
ENV WAHA_SESSION_DATA_PATH=/data

# Copiar configuración
COPY waha.json /app/waha.json

# ENTRYPOINT CORRECTO
ENTRYPOINT ["waha"]
CMD ["start"]
