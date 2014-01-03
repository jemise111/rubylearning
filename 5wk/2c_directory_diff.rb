# 2c_directory_diff.rb
# Create a `diff for directories. Usage should be
# 2c_directory_diff.rb list.txt new_list.txt

def difference(old_files, new_files)
  subtractions = old_files - new_files
  additions = new_files - old_files
  result = '' and subtractions.each do |s|
    result << "- #{s}"
  end
  additions.each do |a|
    result << "+ #{a}"
  end
  result
end

if __FILE__ == $PROGRAM_NAME
  old_dir_contents, new_dir_contents = ARGV
  begin
    old_files = File.open(old_dir_contents, 'r').readlines
    new_files = File.open(new_dir_contents, 'r').readlines
    puts difference(old_files, new_files)
  rescue
    puts 'usage: 2c_directory_diff.rb <old_contents_file> <new_contents_file>'
  end
end
