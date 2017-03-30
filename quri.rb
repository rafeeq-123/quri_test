require "pry"

def ugly_print
  sample_input = [{ 
    :name => 'Alice',
      :children => [{
    :name => 'Georges',
      :children => [{
    :name => 'Bernard',
      :children => []
    }, {
    :name => 'Jack',
      :children => []
    }]
  }],
}, {
  :name => 'Bob',
    :children => [{
  :name => 'Mary',
    :children => [],
  }],
}]
end

def pretty_print
  #this method is messy the nested iterations got a little out of hand!
  ugly_print.each do |parent|
    puts parent[:name]
    parent.drop(1).each do |key, value| 
      value.each do |cname|
        puts "-->#{cname[:name]}"
        cname[:children].each do |k1| puts "---->#{k1[:name]}"
        end
      end
    end
  end
end
pretty_print
  


