class OrderService

  def sync_book_orders
    orders = get_orders
    orders_of_book = orders
                       .select { |o| o.type == 'book' }
    book_dao = get_book_dao
    orders_of_book
      .each { |o| book_dao.insert_order(o) }
  end

  def get_orders
    CSV.parse(File.read("order.csv"), headers: true)
       .map { |r| Order.new(r["customer_name"], r["product_name"], r["price"], r["type"]) }
  end

  private

  def get_book_dao
    book_dao = BookDao.new
  end

end

class BookDao

  def insert_order(order)
    puts order.customer_name
    raise NotImplementedError "you can not pass!!"
  end
end