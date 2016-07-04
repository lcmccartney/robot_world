require 'sqlite3'

database = SQLite3::Database.new("db/robot_world_development.db")

database.execute("DELETE FROM robots;")
database.execute("INSERT INTO robots (id, name, city, state, avatar, birthdate, date_hired, department)
                  VALUES (1, 'Bob', 'Denver', 'CO', 'pic', '12/15/1987', '09/27/2010', 'Defense'),
                         (2, 'Sally', 'Wichita', 'KS', 'pic', '11/14/1986', '08/26/2009', 'Film'),
                         (3, 'Frank', 'New York', 'NY', 'pic', '10/13/1985', '07/25/2008', 'Software'),
                         (4, 'Jerry', 'Miami', 'FL', 'pic', '09/12/1984', '06/24/2007', 'Agriculture')")

puts database.execute("SELECT * FROM robots;")
