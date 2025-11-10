# Question 26: Web Form with MySQL Database

## Setup and Run

```bash
cd others/26

# Start all containers
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f
```

## Access Application

- Web Form: http://localhost:8081

## Features

- Add new records via web form
- View all records in a table
- Delete records
- Real-time database updates
- Bootstrap styled interface

## Database Details

- Host: mysql
- Database: formdb
- User: formuser
- Password: formpass

## Stop and Clean Up

```bash
docker-compose down

# Remove volumes
docker-compose down -v
```

## Test the Application

1. Open http://localhost:8081
2. Fill in the form (Name, Email, Phone)
3. Click "Add Record"
4. View the record in the table below
5. Delete records using the delete button
