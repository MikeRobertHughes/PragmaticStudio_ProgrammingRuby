current_time = Time.new
puts current_time.strftime("The game started on %A %m/%d/%Y at %l:%M%p.")

name1 = "larry"
name2 = "curly"
name3 = "moe"
name4 = "shemp"
health1 = 60
health2 = health1
health3 = 100
health1 = 30
health4 = 90

puts "#{name1.capitalize} has a health of #{health1}."
puts "#{name2.upcase} has a health of #{health2}."
puts "#{name3.capitalize} has a health of #{health3}.".center(48, '*')
puts "#{name4.capitalize.ljust(25, '.')} #{health4} health"

puts "Players:\n\t#{name1.capitalize}\n\t#{name2.upcase}\n\t#{name3}"

puts "Players:\n\t#{name1.capitalize}\n\t#{name2.upcase}\n\t#{name3}"