require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
def setup
	@user = users(:ned)
	@micropost = @user.microposts.build(content: "Lorem ipsum")

end

  test "should be valid" do 
  	assert @micropost.valid?
  end

  test "user_id present" do 
  	@micropost.user_id = nil
  	assert_not @micropost.valid?
  end

  test "Content should be present" do 
  	@micropost.content = " "
  	assert_not @micropost.valid?
  end

  test "content should have max length of 140" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "content sorted by recent" do 
  	assert_equal Micropost.first, microposts(:now)
  end
end
