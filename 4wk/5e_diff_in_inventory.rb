# 5e_diff_in_inventory.rb
# Write a Ruby script to display all files in new-inventory.txt that
# do not exist in old-inventory.txt

def diff_contents(old_file, new_file)
  old_file_contents = File.open(old_file).readlines
  new_file_contents = File.open(new_file).readlines
  (new_file_contents - old_file_contents).sort
end

if __FILE__ == $PROGRAM_NAME
  old_inventory = 'old-inventory.txt'
  new_inventory = 'new-inventory.txt'
  puts diff_contents(old_inventory, new_inventory)
end
