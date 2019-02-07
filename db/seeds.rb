User.find_or_create_by(role: 1) do |user|
  user.email = 'test@gmail.com'
  user.password = '321'
  user.first_name = 'Main'
  user.last_name = 'Admin'
  user.country = 'Ukraine'
  user.city = 'Cherkassy'
end