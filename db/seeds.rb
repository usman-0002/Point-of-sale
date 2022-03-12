id = ENV['ADMIN_LOGIN_ID']
pass = ENV['ADMIN_LOGIN_PASS']
User.create(email: id, password: pass)