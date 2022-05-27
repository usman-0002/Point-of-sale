# Admin User
id = Rails.application.credentials[:ADMIN_LOGIN_ID]
pass = Rails.application.credentials[:ADMIN_LOGIN_PASS]
User.create(email: id, password: pass)

# Categories
general_category = Category.create(name: 'General Store Item')
keryana_category = Category.create(name: 'Keryana Store Item')
other_category = Category.create(name: 'Others')


# Supplier
supplier = Supplier.create(company_name: 'Test-Supplier')
UserDetail.create(detailable: supplier, first_name: 'Test', last_name: 'Supplier')

# Products
Product.create(name: 'Treat', code: 'TR234', category: general_category, supplier: supplier)
Product.create(name: 'Treat1', code: 'TR235', category: general_category, supplier: supplier)
Product.create(name: 'Treat2', code: 'TR236', category: general_category, supplier: supplier)
Product.create(name: 'Treat3', code: 'TR237', category: general_category, supplier: supplier)
Product.create(name: 'Treat4', code: 'TR238', category: keryana_category, supplier: supplier)
Product.create(name: 'Treat5', code: 'TR231', category: keryana_category, supplier: supplier)
Product.create(name: 'Treat6', code: 'TR232', category: keryana_category, supplier: supplier)
Product.create(name: 'Treat7', code: 'TR233', category: keryana_category, supplier: supplier)
Product.create(name: 'Treat8', code: 'TR239', category: other_category, supplier: supplier)
Product.create(name: 'Treat9', code: 'TR2314', category: other_category, supplier: supplier)
