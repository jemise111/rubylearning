# p028swapcontents
# Take two text files and swap their contents

require_relative '../2wk/1c_prompt'

def copy_contents(file_name_a, file_name_b)
  file_a = File.open(file_name_a, 'r')
  file_b = File.open(file_name_b, 'w')
  file_a.each_line do |line|
    file_b.puts(line)
  end
  [file_a, file_b]. each { |f| f.close }
end

def swap_contents(file_name_a, file_name_b)
  temp = File.new('temp', 'w')
  copy_contents(file_name_a, temp)
  copy_contents(file_name_b, file_name_a)
  copy_contents(temp, file_name_b)
  File.delete('temp')
end

def get_file
  until file = prompt('Enter a file name: ') and File.exist?(file)
    puts 'Invalid file choice. Try again.'
  end
  file
end

if __FILE__ == $PROGRAM_NAME
  puts 'File A: '
  file_name_a = get_file
  puts 'File B: '
  file_name_b = get_file
  swap_contents(file_name_a, file_name_b)
end
