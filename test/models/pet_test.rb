require "test_helper"

class PetTest < ActiveSupport::TestCase

  test "should follow and unfollow a pet" do
    kira = pets(:kira)
    mira = pets(:mira)
    assert_not kira.following?(mira)
    kira.follow(mira)
    assert kira.following?(mira)
    assert mira.followers.include?(kira)
    kira.unfollow(mira)
    assert_not kira.following?(mira)
  end
  
  test "should request mating with another pet" do
    kira = pets(:kira)
    mira = pets(:mira)
    assert_not kira.requesting?(mira)
    kira.request(mira)
    assert kira.requesting?(mira)
    assert mira.requesters.include?(kira)
    kira.unrequest(mira)
    assert_not kira.requesting?(mira)
  end

end
