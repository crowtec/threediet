def create_admin
  if User.admin.count == 0
    User.create(role: 'admin', email: "admin@3diet.com", password: "12345678")
  end
  p "---ADMIN DATA---"
  p "Email: " + User.admin.first.email
  p "Password: 12345678"
  p "----------------"
end

create_admin