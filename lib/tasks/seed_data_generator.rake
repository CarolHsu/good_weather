namespace :seed_data do
  desc 'Generate seed cities and countries data for better searching experience'
  task :cities => :environment do
    file = File.join(Rails.root, 'config', 'city.list.json')
    cities = JSON.parse File.read(file)
    cities.each do |city|
      City.create(name: city["name"], country: city["country"], city_id: city["id"])
    end
    Rails.logger.info "Seed data generated. Total: #{City.size} cities."
  end
end
