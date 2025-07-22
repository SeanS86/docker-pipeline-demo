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

**- Create a new book:** `curl -X POST -H "Content-Type: application/json" -d '{"title": "Book Title", "author": "Author Name", "price": 10.99}' http://localhost:8080/books/`

Replace `{book_id}` with the actual ID.



## Bookstore API Config


| Variable          | Default                                  | Description                                                      |
|-------------------|------------------------------------------|------------------------------------------------------------------|
| `DATABASE_URL`    | `sqlite:///./books.db`                   | SQLAlchemy database connection string.                           |
| `LOG_LEVEL`       | `INFO`                                   | Root logger level (e.g. DEBUG, INFO, WARNING).                  |
| `LOG_FORMAT`      | `%(levelname)s:%(name)s:%(message)s`     | Python `logging` format string.                                  |
| `PAGE_SIZE`       | `10`                                     | Number of items per page on the `/books/` endpoint.             |
| `APP_ENV`         | `dev`                                    | App environment label (e.g. dev / staging / prod).              |
| `HOST`            | `0.0.0.0`                                | Uvicorn host binding.                                           |
| `PORT`            | `8080`                                   | Uvicorn port.                                                   |
| `RELOAD`          | `False`                                  | Whether Uvicorn runs in reload mode (`True`/`False`).           |
| `ALLOWED_ORIGINS` | `*`                                      | Comma-separated list for CORS allowed origins (`*` = all).      |
| `DB_POOL_SIZE`    | `5`                                      | SQLAlchemy connection-pool size.                                |
| `DB_MAX_OVERFLOW` | `10`                                     | SQLAlchemy max overflow connections beyond the pool size.       |
