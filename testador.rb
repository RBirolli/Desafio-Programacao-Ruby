require_relative 'bootstrap'
require_relative 'processor'

# Identfy all itens type
item_type = Processor.instance_methods(false)
def_action = Processor.new(item_type)

# Book Example (build new payments if you need to properly test it)
print "Customer name: "
customer_name = gets.chomp
print "Address: "
customer_address = gets.chomp
foolano = Customer.new(customer_name, customer_address)

loop {
  print "\n\nProduct: "
  product_name = gets.chomp
  for i in 1...(item_type.size)
    puts "#{i} - #{item_type[i]}"
  end

  print "Product Type: "
  product_id = gets.chomp.to_i
  exit() if product_id >= item_type.count || product_id < 1

  product = Product.new(name: product_name, type: item_type[product_id])
  book_order = Order.new(foolano)
  book_order.add_product(product)

  payment_book = Payment.new(order: book_order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))
  payment_book.pay
  print "Payment Result: "
  p payment_book.paid?

# Execute predefined actions
  def_action.execute_action(product.type)
}
