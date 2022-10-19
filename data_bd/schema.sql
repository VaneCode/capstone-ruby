
Create Table games (
    id serial PRIMARY KEY
    name VARCHAR(50),
    multiplayer BOOLEAN
    last_played_At DATE 
    publish_date DATE
    Archived BOOLEAN
    item_id INT FOREIGN KEY REFERENCE item(id)
)

Create Table author (
    id serial PRIMARY KEY
    first_name VARCHAR(50)
    last_name VARCHAR(50)
)
