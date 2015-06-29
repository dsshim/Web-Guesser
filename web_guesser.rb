require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess']
  @color = "white"
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => @color}
end

def check_guess(guess)
  if guess.nil?
    @color
    ""
  elsif guess.to_i > SECRET_NUMBER + 5
    @color = "red"
    "Way too high!"
  elsif guess.to_i < SECRET_NUMBER - 5
    @color = "red"
    "Way too low!"
  elsif guess.to_i > SECRET_NUMBER
    @color = "mistyrose"
    "Too high!"
  elsif guess.to_i < SECRET_NUMBER
    @color = "mistyrose"
    "Too Low!"
  elsif guess.to_i == SECRET_NUMBER
    @color = "green"
    "You got it right!<br><br>
    The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end
