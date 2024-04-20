# Project Setup Guide

To start the project, follow these steps:

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/tlvu93/chiro-dx-erp.git
   ```

2. Navigate to the project directory:

   ```bash
   cd chiro-dx-erp
   ```

3. Start the development server:

   ```bash
   yarn dev
   ```

4. Open a new terminal window and navigate to the backend/hasura directory:

   ```bash
   cd backend/hasura
   ```

5. Apply the database migrations:

   ```bash
   hasura migrate apply
   ```

6. Apply the metadata changes:

   ```bash
   hasura metadata apply
   ```
