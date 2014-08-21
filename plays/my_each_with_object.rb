# Practice with Enumerator and Enumerable
require "./setup"

require "minitest/autorun"

module Enumerable
  def my_each_with_object(memo, &block)
    each do |elem|
      yield elem, memo if block_given?
    end
    
    memo
  end
end

describe "Enumerable#my_each_with_object" do
  before do
    @array = Array(0..2)
  end
  
  it "should have method #my_each_with_object" do
    assert_equal true, @array.respond_to?(:my_each_with_object)
  end
  
  it "should return empty memo if memo is not used" do
    assert_equal Hash.new, @array.my_each_with_object(
                           Hash.new) { |e, memo| "do nothing" }
  end
  
  it "should do what it supposed to do" do
    result = { 0 => 1, 1 => 1, 2 => 1 }
    assert_equal result, @array.my_each_with_object(
                         Hash.new(0)) { |e, memo| memo[e] += 1 }
  end
end