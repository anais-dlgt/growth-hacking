require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'scrapp.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Target.new
  t.email = row['email']
  t.status = 'student'
  t.save
end
