require 'test_helper'

class LongestWordControllerTest < ActionDispatch::IntegrationTest
  test "should get game" do
    get longest_word_game_url
    assert_response :success
  end

  test "should get score" do
    get longest_word_score_url
    assert_response :success
  end

end
