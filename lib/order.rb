class Order
  attr_reader :customer_name, :product_name, :price, :type

  def initialize(customer_name, product_name, price, type)
    @customer_name = customer_name
    @product_name = product_name
    @price = price
    @type = type
  end
end