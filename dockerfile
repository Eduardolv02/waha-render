FROM devlikeapro/whatsapp-http-api:latest

# Necesario para Render
ENV CHROME_ARGS="--no-sandbox --disable-setuid-sandbox --disable-dev-shm-usage"

# Si quieres añadir valores por defecto:
ENV WAHA_SESSION_DATA_PATH=/data
ENV WAHA_SESSION_STORAGE=supabase
