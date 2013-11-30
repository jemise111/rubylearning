=begin
doctest: I can greet the world
>> hello
=> "Hello World!"
doctest: I can greet someone personally
>> hello 'Jesse'
=> "Hello Jesse!"
doctest: I can ask if someone is there
>> hello('Jorge', '?')
=> "Hello Jorge?"
=end

def hello(name = 'World', punctuation = '!')
  "Hello %<name>s%<punctuation>s" % {name: name, punctuation: punctuation}
end
