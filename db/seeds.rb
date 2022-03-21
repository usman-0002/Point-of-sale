id = Rails.application.credentials[:ADMIN_LOGIN_ID]
pass = Rails.application.credentials[:ADMIN_LOGIN_PASS]
User.create(email: id, password: pass)