require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

# Load our HTML view template using the erb method to replace the long HTML string
get ("/") do
  erb(:elephant)
end

# create a route that simulates rolling two 6-sided dice on their behalf 
get("/dice/2/6") do
  @rolls = []

  2.times do
    dice = rand(1..6)
    @rolls.push(dice)
  end

  erb(:two_six)
end 

# simulate two 10-sided dice
get("/dice/2/10") do 
  @rolls = []

  2.times do
    dice = rand(1..10)
    @rolls.push(dice)
  end

erb(:two_ten)
end

# simulate one 20-sided die

get("/dice/1/20") do
  @rolls = []

  1.times do 
    dice = rand(1..20)
    @rolls.push(dice)
  end

erb(:one_twenty)
end

# simulate five 4-sided dice

get("/dice/5/4") do
  @rolls = []

  5.times do
    dice = rand(1..4)
    @rolls.push(dice)
  end

 erb(:five_four)
end
