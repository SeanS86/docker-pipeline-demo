# PY_Bookstore API App
## How to run the application locally

Firstly you have to build a Docker image for the application and run it as a container afterwards.

You can build the image with the command below:
```
docker build -t py_bookstore-api:1.0.0
```

And this is how to run it:
```
docker run -p 8080:8080 py_bookstore-api:1.0.0
```

And to test and access the API, use a `curl` or a web browser. Some examples below:

**- Get all books:** `http://localhost:8080/books/`

**- Get a single book:** `http://localhost:8080/books/{book_id}`

**- Create a new book:** `curl -X POST -H "Content-Type: application/json" -d '{"title": "My Demo", "author": "Sean S86", "price": 99.99}' http://localhost:8080/books/`

Replace `{book_id}` with the actual ID.

## Code and dependency scanning

Please note that the scanning steps - during the build and push of the image workflow - are in place for best practice however their results are suppressed when the pipeline runs as demonstrated below.
They're in place to create awareness regarding the quality of the code.

The `Bandit` step has the `--exit-zero` switch to ignore the allow all interfaces (`0.0.0.0`).
```
      - name: Code Scanning with Bandit
        run: |
          pip install bandit
          bandit -r . --exit-zero
```

And the `Safety` dependency scan is set to `continue-on-error:true`.
```
     - name: Dependency Scanning with Safety
       run: |
         pip install safety
         safety scan
       continue-on-error: true
```

## K8s deployment with Helm

This is done via Github Actions workflows. And it works as flows:
- The image gets built and pushed to the Dockerhub with each commit, with the commit Id as the tag.
- And you can deploy any branch with any image tag in the `dev` and `staging` environments. However in `prod` you can only deploy the main branch with any tag.

## Bookstore API Config


| Variable          | Default                              | Description                                                      |
|-------------------|--------------------------------------|------------------------------------------------------------------|
| `DATABASE_URL`    | `sqlite:///./books.db`               | SQLAlchemy database connection string.                           |
| `LOG_LEVEL`       | `INFO`                               | Root logger level (e.g. DEBUG, INFO, WARNING).                  |
| `LOG_FORMAT`      | `%(levelname)s:%(name)s:%(message)s` | Python `logging` format string.                                  |
| `PAGE_SIZE`       | `10`                                 | Number of items per page on the `/books/` endpoint.             |
| `APP_ENV`         | `dev`                                | App environment label (e.g. dev / staging / prod).              |
| `HOST`            | `0.0.0.0`                            | Uvicorn host binding.                                           |
| `PORT`            | `8080`                               | Uvicorn port.                                                   |
| `RELOAD`          | `False`                              | Whether Uvicorn runs in reload mode (`True`/`False`).           |
| `ALLOWED_ORIGINS` | `*`                                  | Comma-separated list for CORS allowed origins (`*` = all).      |
| `DB_POOL_SIZE`    | `5`                                  | SQLAlchemy connection-pool size.                                |
| `DB_MAX_OVERFLOW` | `10`                                 | SQLAlchemy max overflow connections beyond the pool size.       |
