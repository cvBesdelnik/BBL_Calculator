require "test_helper"

class OperationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "check the '250' from database" do
    first_operation = Operation.find_by(amount: '250' )
    assert_equal(250, first_operation.amount )
  end

  test "return false if name is missed" do
    new_op = Operation.create(description: "taxi")
    assert_not(new_op.valid?)
  end

  test "return true if everithing is good" do
    new_op = Operation.new(amount: "240", description: "taxi", operation_date: "2023-01-12 11:49:36", category: categories(:one) )
    assert(new_op.valid?)
  end

  test "saving and gathering" do
    new_op = Operation.new(amount: "240", description: "taxi", operation_date: "2023-01-12 11:49:36", category: categories(:one))
    new_op.save()
    find_op = Operation.find_by(amount: "240")
    assert_equal(240, find_op.amount)
  end

end
