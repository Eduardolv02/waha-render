FROM devlikeapro/whatsapp-http-api:latest

RUN mkdir -p /data

ENV NODE_OPTIONS="--max-old-space-size=128"

# No definas CHROME_ARGS aquí, Render lo inyecta

ENV WAHA_SESSION_STORAGE=supabase
ENV WAHA_SESSION_DATA_PATH=/data

COPY waha.json /app/waha.json

ENTRYPOINT ["waha"]
CMD ["start"]
