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

csv_text = File.read(Rails.root.join('lib', 'seeds', 'episodes.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Episode.new
  t.title = row['title']
  t.date = row['date']
  t.why = row['why']
  t.description = row['description']
  t.user_id = row['user_id']
  t.first_or_create
  puts "#{t.title}, #{t.date} saved"
end

puts "There are now #{Episode.count} rows in the episodes table"
