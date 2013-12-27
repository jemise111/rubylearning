# inventory.rb
# write one-line Ruby script that displays on screen all files in current
# folder and everything in all sub folders

def list_all_in_current_directory
  Dir.glob('**/*').sort
end

if __FILE__ == $PROGRAM_NAME
  puts list_all_in_current_directory
end
