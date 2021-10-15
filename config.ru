#require_relative 'middleware/time'
require_relative 'middleware/timeformatter'
require_relative 'app'

#use TimerPath
run App.new
