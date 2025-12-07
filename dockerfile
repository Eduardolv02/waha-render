FROM devlikeapro/whatsapp-http-api:latest

# Crear carpeta temporal (Render no la persiste)
RUN mkdir -p /data

# Limitar memoria Node
ENV NODE_OPTIONS="--max-old-space-size=128"

# Flags de Chromium para 512 MB RAM
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

# Copiar configuración
COPY waha.json /app/waha.json

# Ejecutar WAHA correctamente
ENTRYPOINT ["waha"]
CMD ["start"]
