require 'test_helper'
class UserWritesTasksTest < ActionDispatch::IntegrationTest 
  test "view a list of task" do
    Task.create!(description: "First task!!")
    assert_equal 1, Task.count
    visit '/tasks'    
    # assert_include page.body, "All Posts"
    assert_include page.body, "First task!!"
  end
 
  #  test "creates a new task" do 
	 #  visit '/tasks'
	 #  fill_in 'Description', :with => 'Go to work'
	 #  click_button 'Submit Task'
	 #  assert_include page.body, 'Go to work'
  # end 
  #  test "delete a task" do
  #    visit '/tasks'
  #    find("#task_#{@task.id}").click_link 'Delete'
  #    assert_inclulde page.body, 'Task has been deleted'
  #    assert_include page.body, ' '
  # end
end
