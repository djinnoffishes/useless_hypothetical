# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
all_hypos = [
    ["sweat cheese", "burp farts"], 
    ["bleed from your anus when you sneeze", "piss gasoline once a week"], 
    ["always have to refer to minority races derogatively", "never see the ocean in person ever again"],
    ["eat 15 pounds of chocolate within the span of 1 hour", "barf uncontrollably for 30 minutes"],
    ["not be able to blink your eyes for 12 hours straight", "eat a bag of human hair"],
    ["live in Alabama", "get hit by a train traveling 150 mph"]
]

all_hypos.each do |hypo|
	Hypothetical.where(hypo1: hypo.first).first_or_create(hypo2: hypo.second)
end