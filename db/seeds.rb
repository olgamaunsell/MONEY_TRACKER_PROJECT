require_relative('../models/transaction')
require_relative('../models/vendor')
require_relative('../models/tag')

Vendor.delete_all()
Tag.delete_all()
# Transaction.delete_all()

vendor1 = Vendor.new({
  "name" => "Tesco"
  })

vendor2 = Vendor.new({
  "name" => "The Chanter"
  })

vendor3 = Vendor.new({
  "name" => "John Lewis"
  })

vendor4 = Vendor.new({
  "name" => "Lothian Buses"
  })

vendor5 = Vendor.new({
  "name" => "Top Shop"
  })

vendor1.save()
vendor2.save()
vendor3.save()
vendor4.save()
vendor5.save()

food_tag = Tag.new({
  "name" => "Food"
  })

drinks_tag = Tag.new({
  "name" => "Drinks"
  })

clothes_tag = Tag.new({
  "name" => "Clothes"
  })

gift_tag = Tag.new({
  "name" => "Gift"
  })

transport_tag= Tag.new({
  "name" => "Transport"
  })

food_tag.save()
drinks_tag.save()
clothes_tag.save()
gift_tag.save()
transport_tag.save()

# transaction1 = Transaction.new({
#   "vendor_id" => vendor1.id,
#   "tag_id" => food_tag.id,
#   "value" => 1000,
#   "transaction_date" => 'December 12 2017'
#   })
#
#
#
# transaction1.save()
