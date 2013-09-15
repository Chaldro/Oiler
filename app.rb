require 'sinatra'
require 'haml'

get '/' do
  @solutions = Dir.glob("solutions/*.rb").map do |file|
    /solutions\/(.*).rb/.match(file)
  end

  haml :index
end

get '/solutions/:name' do |name|
  file_path = File.dirname(__FILE__) + "/solutions/#{name}.rb"
  redirect to('/') unless File.exists? file_path

  @code   = IO.read file_path
  IO.popen("ruby -e '#{@code}'").each { |line| @result = line.chomp }

  haml :solution
end

get '/*' do
  redirect to('/')
end