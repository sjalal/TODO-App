require 'test_helper'
class UserWritesTasksTest < ActionDispatch::IntegrationTest 
  test "view a list of task" do
    Task.create!(description: "First task!!")
    assert_equal 1, Task.count
    visit '/tasks'    
    # assert_include page.body, "All Posts"
    assert_include page.body, "First Post!!"
  end
end