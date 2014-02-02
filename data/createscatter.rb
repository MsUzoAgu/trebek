require "pry"
require "debugger"
require "yaml"

def determine_color(hash)
  if hash["ranks"] == "Heart" || hash["suits"] == "Diamond"
    hash["color"] = "red"
  else
    hash["color"] = "black"
  end
end

value = ["Scatter"]
ranks = %w(2 3 4 5 6 7 8 9 10 J Q K A)
suits = %w(Diamond Spade Heart Club)
options = [value, ranks, suits]
cards = options.inject(&:product).map(&:flatten)
collection = []
 
cards.each do |card|
  hash = {}
  hash["value"] = card[0]
  hash["ranks"] = card[1]
  hash["suits"] = card[2]
  determine_color(hash)
  collection << hash
end
 
File.open('./scatter.yml', 'w') do |f|
 f.puts YAML::dump(collection)
end


