# Backend Test

## Using For Test Case

- Express.js
- DDD Pattern
- Unit Testing
- MySQL

## Installation

1. Clone repository:
   ```bash
   git clone https://github.com/aryaada/backend_test.git

2. Import Database
    ```bash
    library.sql

3. Install Dependencies
    ```bash
    npm install

4. Config .env
    ```bash
    DB_HOST=localhost
    DB_USER=root
    DB_PASS=
    DB_NAME=library

5. Start Test with Swagger API Documentation
    ```bash
    node src/server.js

    http://localhost:3000/api-docs/

6. Start Test with Unit Testing

    ```bash
    npm test test/member.test.js

    npm test test/book.test.js

    npm test test/borrow.test.js

    npm test test/return.test.js
