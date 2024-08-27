# Docker Image per i Confini Territoriali Italiani

Questo progetto fornisce un'immagine Docker preconfigurata per l'accesso ai confini territoriali dei comuni, regioni e provincie italiane.

## Requisiti

Prima di utilizzare questa immagine Docker, assicurati di avere installato:

- Docker: [https://www.docker.com/get-started](https://www.docker.com/get-started)

## Utilizzo

Per utilizzare questa immagine Docker, segui i passaggi seguenti:

1. Scarica l'immagine Docker dal repository:

    ```bash
    docker pull ghcr.io/emp-projects/docker-istat:main
    ```

2. Avvia un contenitore utilizzando l'immagine appena scaricata:

    ```bash
    docker run -d -p 5432:5432 docker pull ghcr.io/emp-projects/docker-istat:main
    ```
3. Configura le variabili di ambiente copiando dal file `env.template` in un nuovo file `.env` per il database postgis:

```bash
POSTGRES_ISTAT_HOST=localhost
POSTGRES_ISTAT_PORT=15432
POSTGRES_ISTAT_USER=istat
POSTGRES_ISTAT_PASS=istat
POSTGRES_ISTAT_DB=istat
```

infine avvia il docker-compose.yml

```bash
docker-compose up
```

## Contributi

Siamo felici di accettare contributi da parte della community! Se desideri contribuire a questo progetto, segui le linee guida di seguito:

1. Forka il repository su GitHub.
2. Crea un nuovo branch per il tuo contributo.
3. Effettua le modifiche desiderate.
4. Invia una pull request al repository principale.

## Segnalazione di Problemi

Se riscontri problemi o desideri suggerire miglioramenti, apri una nuova issue nel repository.

## Licenza

Questo progetto è distribuito con la licenza MIT. Per ulteriori informazioni, consulta il file `LICENSE`.
# Licenza

Il progetto è distribuito con la licenza MIT. Di seguito è riportato il testo completo della [licenza](LICENSE.md).

