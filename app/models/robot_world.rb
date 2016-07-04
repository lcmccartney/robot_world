class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute("INSERT INTO robots (id, name, city, state, avatar,
                                          birthdate, date_hired, department)
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?);",
                      robot[:id], robot[:name], robot[:city], robot[:state],
                      robot[:avatar], robot[:birthdate], robot[:date_hired],
                      robot[:department])
  end

  def raw_robots
    database.execute("SELECT * FROM robots;")
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot(id)
    database.execute("SELECT * FROM robots WHERE id=?;", id).first
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.execute("UPDATE robots
                      SET name=?, city=?, state=?, date_hired=?, department=?
                      WHERE id = ?;", robot[:name], robot[:city], robot[:state],
                                      robot[:date_hired], robot[:department])
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE id=?;", id)
  end

  def average_age
    age = all.map { |robot| Time.now.year - Time.new(robot.birthdate).year }
    age.reduce(:+) / age.size
  end

  def hired_by_year
    by_year = Hash.new(0)
    year = all.map { |robot| Time.new(robot.date_hired).year }
    year.each { |year| by_year[year] += 1}
    by_year.sort
  end

  def count_by_department
    by_department = Hash.new(0)
    department = all.map { |robot| robot.department }
    department.each { |department| by_department[department] += 1}
    by_department
  end

  def count_by_city
    by_city = Hash.new(0)
    city = all.map { |robot| robot.city }.each { |city| by_city[city] += 1}
    by_city
  end

  def count_by_state
    by_state = Hash.new(0)
    state = all.map { |robot| robot.state }.each { |state| by_state[state] += 1}
    by_state
  end

  def delete_all
    database.execute("DELETE FROM robots;")
  end

end
