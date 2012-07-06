# default boilerplate
require "model"

# create a few persons
Person.create :name => "John Smith", :bio => "I'm the CEO of Small Gadgets Inc."
Person.create :name => "Jane Smith", :bio => "I'm the COO of Happy Hardware Inc."
Person.create :name => "Jeff Rose", :bio => "I'm just an average guy."
Person.create :name => "Jennifer Taylor", :bio => "I'm just a normal girl."

# and do a few searches
puts "Finding Jane"
puts Person.fulltext_search("Jane").each {|r| puts r.inspect}
puts
puts "Finding the average guy"
puts Person.fulltext_search("average guy").each {|r| puts r.inspect}
puts "Finding the Smith (no results - mysql won't return it, as 50% of the records contains Smith)"
puts Person.fulltext_search("Smith").each {|r| puts r.inspect}

# clean up the database
Person.all.each {|u| u.destroy }

