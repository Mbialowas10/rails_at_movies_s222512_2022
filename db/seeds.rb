require "csv"

Movie.delete_all
ProductionCompany.delete_all
Page.delete_all

# add the file path of the csv file
filename = Rails.root.join("db/top_movies.csv")

#puts "Loading Movies from the CSV file: #{filename}"

csv_data = File.read(filename)
movies = CSV.parse(csv_data, headers: true, encoding: "utf-8")

movies.each do |m|
  #puts m["original_title"]
  #production_company = ProductionCompany.create(name: ["production_company"]) #working... MB
  production_company = ProductionCompany.find_or_create_by(name: m["production_company"])

  if production_company && production_company.valid?
    #create a new movie
    movie = production_company.movies.create(
      title: m["original_title"],
      year: m["year"],
      duration: m["duration"],
      description: m["description"],
      average_vote: m["avg_vote"]
    )
    puts "Invalid move #{m['original_title']}" unless movie&.valid?
  else

    puts "invalid production company #{m["production_company"]} for movie #{m['original_title']}."
  end
end
Page.create(
  title: 'About the Data',
  content: 'The data powering this groovy website was provided by Kaggle.',
  permalink: "about"
)
Page.create(
  title: 'Contact Us',
  content: 'If you like this groovy website and would like to reach out, please email me at groovy@groovy.com',
  permalink: "contact"
)
puts "Created #{ProductionCompany.count} Production Companies"
puts "Created #{Movie.count} movies."