require 'rspec'

describe 'OrderService' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when part of orders were book orders' do
    it 'should be 2 book orders inserted when 3 orders with 2 book' do
      order_service = OrderService.new
      orders = [
        Order.new('David', 'book1', 100, 'book'),
        Order.new('Tom', 'cd1', 200, 'cd'),
        Order.new('Joey', 'book3', 300, 'book'),
      ]
      allow(order_service).to receive(:get_orders).and_return(orders)
      book_dao = spy
      allow(order_service).to receive(:get_book_dao).and_return(book_dao)
      order_service.sync_book_orders

      RSpec::Matchers.define :book_order_matcher do ||
        match { |order| order.type == 'book' }
      end
      expect(book_dao).to have_received(:insert_order)
                            .with(book_order_matcher)
                            .twice

    end
  end

end

require_relative '../lib/order.rb'
require_relative '../lib/order_service.rb'
