require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "check the 'Sport' from database" do
    first_category = Category.find_by(name: 'Sport' )
    assert_equal('Sport', first_category.name )
  end

  test "return false if name is missed" do
    new_cat = Category.create(description: "cat 1 test")
    assert_not(new_cat.valid?)
  end

  test "return true if everithing is good" do
    new_cat = Category.new(name: "Category 1", description: "cat 1 test")
    assert(new_cat.valid?)
  end

  test "saving and gathering" do
    new_category = Category.new(name: "Category 1", description: "Description 1")
    new_category.save()
    find_cat = Category.find_by(name: "Category 1")
    assert_equal("Category 1", find_cat.name)
  end

end
