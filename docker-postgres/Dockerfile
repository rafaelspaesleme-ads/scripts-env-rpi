# Imagem Docker PostgresSQL RPI
FROM tobi312/rpi-postgresql

# Usuario postgres
USER postgres

# Hospedando arquivo de configuração
COPY postgresql.conf /etc/postgresql

# Comando de configuração do postgres
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
