# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'events.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Event.new
  t.title = row['title']
  t.date = row['date']
  t.reason = row['reason']
  t.description = row['description']
  t.user_id = row['user_id']
  t.save
  puts "#{t.title}, #{t.date} saved"
end

puts "There are now #{Event.count} rows in the events table"
