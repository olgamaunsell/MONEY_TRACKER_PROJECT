require_relative('../models/transaction')
require_relative('../models/vendor')
require_relative('../models/tag')
require_relative('../models/budget')
require( 'pry-byebug' )

Transaction.delete_all()
Vendor.delete_all()
Tag.delete_all()

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

transaction1 = Transaction.new({
  "vendor_id" => vendor1.id,
  "tag_id" => food_tag.id,
  "amount" => 11.33,
  "transaction_date" => 'December 12 2017'
  })

transaction1.save()

transaction2 = Transaction.new({
  "vendor_id" => vendor2.id,
  "tag_id" => drinks_tag.id,
  "amount" => 6.90,
  "transaction_date" => 'December 10 2017',
  "comment" => "G & T"
  })

transaction2.save()

transaction3 = Transaction.new({
  "vendor_id" => vendor3.id,
  "tag_id" => gift_tag.id,
  "amount" => 24.99,
  "transaction_date" => 'December 15 2017'
  })

transaction3.save()

transaction4 = Transaction.new({
  "vendor_id" => vendor5.id,
  "tag_id" => clothes_tag.id,
  "amount" => 34.49,
  "transaction_date" => 'December 11 2017',
  "comment" => "Dress"
  })

transaction4.save()

transaction5 = Transaction.new({
  "vendor_id" => vendor2.id,
  "tag_id" => drinks_tag.id,
  "amount" => 3.10,
  "transaction_date" => 'December 15 2017',
  "comment" => "Beer"
  })

transaction5.save()

transaction6 = Transaction.new({
  "vendor_id" => vendor4.id,
  "tag_id" => transport_tag.id,
  "amount" => 1.60,
  "transaction_date" => 'December 14 2017',
  "comment" => "Bus"
  })

transaction6.save()

budget_01 = Budget.new({
  "month_no" => 12,
  "year" => 2017,
  "name" => "December Food Budget",
  "tag_id" => food_tag.id,
  "monthly_limit" => 50.00
  })

budget_01.save()

# binding.pry
# nil
