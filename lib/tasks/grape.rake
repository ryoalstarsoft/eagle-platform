namespace :grape do
  desc "routes"
  task :routes => :environment do
    API.routes.map { |route| route }
  end
end