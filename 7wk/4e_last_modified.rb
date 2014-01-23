# 4e_last_modified.rb
# Write a method last_modified that takes a file name and displays number of
# days ago file was modified

def last_modified(file)
  mod_time = File.open(file).mtime
  (Time.now - mod_time) / 86400
end

if __FILE__ == $PROGRAM_NAME
  file = ARGV[0]
  begin
    puts "file was last modified #{last_modified(file)} days ago"
  rescue Errno::ENOENT
    puts 'File not found'
  rescue
    puts 'usage: ruby 2e_last_modified.rb <file_name>'
  end
end
