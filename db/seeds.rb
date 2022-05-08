# Admin User
id = Rails.application.credentials[:ADMIN_LOGIN_ID]
pass = Rails.application.credentials[:ADMIN_LOGIN_PASS]
User.create(email: id, password: pass)

# Categories
Category.create(name: 'General Store Item')
Category.create(name: 'Keryana Store Item')

# Products
Product.create(name: 'Treat', code: 'TR234', category_id: 1)
Product.create(name: 'Treat1', code: 'TR235', category_id: 1)
Product.create(name: 'Treat2', code: 'TR236', category_id: 1)
Product.create(name: 'Treat3', code: 'TR237', category_id: 1)
Product.create(name: 'Treat4', code: 'TR238', category_id: 2)
Product.create(name: 'Treat5', code: 'TR231', category_id: 2)
Product.create(name: 'Treat6', code: 'TR232', category_id: 2)
Product.create(name: 'Treat7', code: 'TR233', category_id: 2)
Product.create(name: 'Treat8', code: 'TR239', category_id: 2)
Product.create(name: 'Treat9', code: 'TR2314', category_id: 1)
Product.create(name: 'Treat10', code: 'TR2324', category_id: 1)
