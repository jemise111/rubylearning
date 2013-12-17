# 3e_temp_dir.rb
# Use class Dir to complete exercise

dir_name = 'tmp'
puts start_dir =  Dir.pwd
Dir.mkdir(dir_name) unless Dir.exists?(dir_name)
Dir.chdir(dir_name) { puts Dir.pwd }
Dir.chdir(start_dir) 
Dir.delete(dir_name)
