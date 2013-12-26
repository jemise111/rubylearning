# 5e_diff_in_inventory.rb
# Write a Ruby script to display all files in new-inventory.txt that
# do not exist in old-inventory.txt

def diff_contents(file_name_1, file_name_2)
  file_1_contents = File.open(file_name_1).readlines
  file_2_contents = File.open(file_name_2).readlines
  (file_2_contents - file_1_contents).sort
end

if __FILE__ == $PROGRAM_NAME
  print 'New inventory file name? '
  new_inventory = gets.chomp
  print 'Old inventory file name? '
  old_inventory = gets.chomp
  puts diff_contents(old_inventory, new_inventory)
end
