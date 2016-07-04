require_relative "../test_helper"

class UserSeesTasksTest < FeatureTest

  def test_user_sees_index_of_tasks
    task1 = task_manager.create({title: "add tests", description: "robot world"})
    task2 = task_manager.create({title: "learn nokogiri", description: "html parsing"})
    # As a user, when I visit the tasks index
    # then I should see a list of the tasks
    visit '/tasks'
    # then I should see a list of my tasks of only the titles
    save_and_open_page
    within("#tasks_list") do
      assert page.has_content?("add tests")
      assert page.has_content?("learn nokogiri")
    end
  end
end
