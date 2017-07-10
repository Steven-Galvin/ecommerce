Order.destroy_all

5.times do |index|
  Order.create!(status: "pending",
                        account_id: Faker::Number.between(1, 5),
                        total_price: Faker::Number.between(1, 5))
end

p "Created #{Order.count} Orders"

Product.destroy_all

5.times do |index|
  Product.create!(price: Faker::Number.between(1, 100),
                        name: Faker::Book.title)

end

p "Created #{Product.count} Products"


OrderItem.destroy_all

# 100.times do |index|
#   OrderItem.create!(quantity: Faker::Number.between(1, 10),
#                     order_id: Faker::Number.between(1, 5),
#                     product_id: Faker::Number.between(1, 5))
#
#
# end
#
# p "Created #{OrderItem.count} OrderItem"
