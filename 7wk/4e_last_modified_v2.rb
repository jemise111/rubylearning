# 4e_last_modified_v2.rb
# Allow last_modified program to display a list of files if none is given

module TimeUnits
  Seconds_In_Day = 60 * 60 * 24
end

include TimeUnits

def file_list(location = '.')
  Dir.glob(location + '/' + '*')
end

def last_modified(file)
  mod_time = File.open(file).mtime
  (Time.now - mod_time) / TimeUnits::Seconds_In_Day
end

def file_selection(file_list)
  until (1..file_list.size).include?(selection ||= '')
    print "selection: "
    selection = gets.to_i
  end
  file_list[selection - 1]
end

if __FILE__ == $PROGRAM_NAME
  file =
    if ARGV[0].nil?
      puts "Select a file from current directory:\n"
      file_list.each_with_index do |f, i|
        puts "%2d: #{f}" % i.next
      end
      file_selection(file_list)
    else
      ARGV[0]
    end
  begin
    puts "file was last modified #{last_modified(file)} days ago"
  rescue Errno::ENOENT
    puts 'File not found'
  end
end
