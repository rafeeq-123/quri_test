require "csv"
require "pry"

def yes_and_no_count
  item = 1
  [9, 21, 33, 45, 57,69, 80, 92, 104].each do |row_number|
  #these are the rows where it was y/n if item was found in the location
  #this is verbose and not very dry or very flexable here
    count = {}
    CSV.foreach("superbowl.csv", :headers => true) do |row|
      count[row[row_number]] ||= 0
      count[row[row_number]] += 1
    end
  count.each do |value, count|
    result = count / @lines.to_f * 100 
    puts "----------------------------"
    puts "#{value.nil? ? "This has a nil value could be an error when uploaded": value}" 
    puts "precent: #{result}% "
    end
    puts " At Least One Display #item #{item += 1}  " 
  end
end

def location_precent
  item = 1
  lrow = [11,23,35,47,59,70,82,94,106].each do |location| 
  #these are the rows of where the displays were found a little manuel...
  #I thought it would be better than making 8 new methods
  #not very dry :( again a little verbose
  count = {}
    CSV.foreach("superbowl.csv", :headers => true) do |row|
      count[row[location]] ||= 0
      count[row[location]] += 1
    end
  count.each do |value, count|
    puts "*********************************"    
    puts "Place: #{value.nil? ? "Not Recorded in CSV": value}"
    puts "#{value}: #{count / @lines.to_f * 100}%"
    end 
    puts " ( Item number #{item += 1} ↓↓↓↓↓) "
  end
end

def line_counting
  @lines = CSV.foreach("superbowl.csv").inject(0) {|c, line| c + 1}
  puts @lines - 1 #this is for the headers which take up on line
end

line_counting
yes_and_no_count
location_precent
