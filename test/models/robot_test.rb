require_relative "../test_helper"

class RobotTest < Minitest::Test

  def test_assigns_attributes_correctly
    robot = Robot.new({"id" => "1",
                      "name" => "Sam",
                      "city" => "Denver",
                      "state" => "CO",
                      "avatar" => "pic",
                      "birthdate" => "12/15/1982",
                      "date_hired" => "11/14/1999",
                      "department" => "Film"})

    assert_equal "1", robot.id
    assert_equal "Sam", robot.name
    assert_equal "Denver", robot.city
    assert_equal "CO", robot.state
    assert_equal "pic", robot.avatar
    assert_equal "12/15/1982", robot.birthdate
    assert_equal "11/14/1999", robot.date_hired
    assert_equal "Film", robot.department
  end

end
