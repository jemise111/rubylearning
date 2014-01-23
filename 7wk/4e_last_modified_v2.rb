# 4e_last_modified_v2.rb
# Allow last_modified program to display a list of files if none is given

def last_modified(file)
  mod_time = File.open(file).mtime
  (Time.now - mod_time) / 86400
end

def choose_file
  puts "Select a file from current directory:\n"
  file_list = `ls`.split
  file_list.each_with_index do |f, i|
    puts "%2d: #{f}" % i.next 
  end
  puts
  until (1..file_list.size).include?(selection ||= '')
    print "selection: "
    selection = gets.to_i
  end
  file_list[selection - 1]
end

if __FILE__ == $PROGRAM_NAME
  file = ARGV[0].nil? ? choose_file : ARGV[0]
  begin
    puts "file was last modified #{last_modified(file)} days ago"
  rescue Errno::ENOENT
    puts 'File not found'
  end
end
