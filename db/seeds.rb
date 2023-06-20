# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

if true
  Vendor.destroy_all
  User.destroy_all
  Truck.destroy_all
  Supplier.destroy_all
  Material.destroy_all
  MaterialType.destroy_all
end

haul_admin = User.find_or_initialize_by(email: "admin@haulhq.com")
haul_admin.name = "Haul Admin"
haul_admin.password = "password1"
haul_admin.password_confirmation = "password1"
haul_admin.role = :haul_admin
haul_admin.save!
# haul_admin.confirm!

vendor = Vendor.find_or_initialize_by(name: "Eagle Carriers")
vendor.address = Faker::Address.street_address
vendor.city = Faker::Address.city
vendor.state = Faker::Address.state_abbr
vendor.zip_code = Faker::Address.zip_code
vendor.phone_number = "3055551212"
vendor.save!

[:manager, :sales_manager, :sales, :dispatch].each do |role|

  u = vendor.users.find_or_initialize_by(email: "#{role}@demo.com")
  u.name = "Eagle #{role.to_s.titleize}"
  u.password = "password1"
  u.password_confirmation = "password1"
  u.role = role
  u.save!
  # u.confirm!

end

puts "Users:"
puts vendor.users.map{|u| "#{u.email} - #{u.name}\n"}


(100..120).each do |number|
  vendor.trucks.create! do |t|
    t.number = number
    t.is_owned = true
    t.last_maintained_on = rand(Date.today-90.days..Date.today)
    t.maintenance_period = [3,6,9,12].sample
  end
end
puts "#{vendor.trucks.is_private.count} Eagle Trucks"

(200..280).each do |number|
  vendor.trucks.create! do |t|
    t.number = number
    t.is_owned = false
    t.last_maintained_on = rand(Date.today-90.days..Date.today)
    t.maintenance_period = [3,6,9,12].sample
  end
end
puts "#{vendor.trucks.is_indie.count} Indie Trucks"

["White Rock", "Vulcan Materials", "SDI"].each do |name|
  supplier = vendor.suppliers.create! do |s|
    s.name = name
    s.email = Faker::Internet.email
    s.address = "18300 NW 122nd Ave"
    s.city = "Hialeah"
    s.state = "FL"
    s.zip_code = "33018"
    s.phone_number = "3055551212"
  end

  ["rock", "sand"].each do |material|
    material_type = MaterialType.find_or_create_by(name: material)

    supplier.materials.create! do |m|
      m.material_type = material_type
      m.cost_ton = rand(1.0..4.0)
      m.cost_yard = [true, false].sample ? rand(1.0..4.0) : nil
      m.cost_load = [true, false].sample ? rand(1.0..4.0) : nil
    end
  end
end



