require 'test_helper'

class Comments::ArchivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comments_archives_index_url
    assert_response :success
  end

end
