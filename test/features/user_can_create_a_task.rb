require_relative "../test_helper"

class UserCanCreateATask < FeatureTest

  def test_user_can_create_a_tasks
    task1 = task_manager.create({title: "add tests", description: "robot world"})
    task2 = task_manager.create({title: "learn nokogiri", description: "html parsing"})
    # As a user, when I visit the dashboard
    visit '/'
    click_link "Create New Task"
    # and I click the link "Create a task"
    # Then I should be on the new tasks page
    assert_equal "/tasks/new", current_path
    # And I fill in the title field
    # And I fill in the description field
    fill_in "task[title]", with: "new task"
    fill_in "task[description]", with: "new description"
    click_button "Submit"
    assert_equal "/tasks", current_path
    # And I click the submit button
    # Then I should see the list of tasks and All Tasks Header
    assert page.has_css?("#tasks_list")
    assert page.has_content?("learn nokogiri")
  end
end
