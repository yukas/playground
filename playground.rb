require "./setup"
require "minitest/autorun"

string = "abcccaba"

def first(str)
  res = Hash.new(0)
  
  str.each_char do |ch|
    res[ch] += 1
    return ch if res[ch] > 1
  end
end

raise first(string).inspect
