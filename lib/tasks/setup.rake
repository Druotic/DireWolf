desc "setup the application for use"
task :setup_sample_application => [:environment] do
  puts "Application is being prepared. Please wait."
  perm_list = ['application_admin', 'can_publish', 'can_apply']
  perm_list.each do |p|
    Permission.find_or_create_by(:name => p)
  end
  role_list = ["Admin", "Employer", "Jobseeker"]
  role_list.each do |r|
    Role.find_or_create_by(:name => (r))
  end

  Role.find_by(:name => "Admin").permissions << Permission.all
  Role.find_by(:name => "Employer").permissions << Permission.find_by(:name => "can_publish")
  Role.find_by(:name => "Jobseeker").permissions << Permission.find_by(:name => "can_apply")

  # Create Dummy Admin User
  user = User.create!(:name => "Shanil Puri", :email => "shanil.puri@gmail.com", :phone => 9199860912, :password => "1234567x", :password_confirmation => "1234567x")
  user.roles << Role.find_by(:name => "Admin")
  puts "==============> Setup is complete. You may now use the application. :)"
end