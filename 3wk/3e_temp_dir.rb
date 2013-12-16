# 3e_temp_dir.rb
# Use class Dir to complete exercise

dir_name = 'tmp'
puts current_dir =  Dir.pwd
Dir.mkdir(dir_name) if !Dir.exists?(dir_name)
Dir.chdir(dir_name) { puts Dir.pwd }
Dir.chdir(current_dir) 
Dir.delete(dir_name)
