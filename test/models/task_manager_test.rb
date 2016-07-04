require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    assert_equal 0, task_manager.all.count
    tm = task_manager.create(title: "Cook", description: "food")

    assert_equal 1, task_manager.all.count
    task = task_manager.find(1)
    assert_instance_of Task, task
  end

end
