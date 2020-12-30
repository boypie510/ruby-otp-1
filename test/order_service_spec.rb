require 'rspec'

def create_order(type)
  Order.new('David', 'book1', 100, type)
end

def given_orders(types)
  orders = types
             .map { |type| create_order(type) }
  allow(@order_service).to receive(:get_orders).and_return(orders)
end

RSpec::Matchers.define :book_order_matcher do ||
  match { |order| order.type == 'book' }
end

describe 'OrderService' do
  before do
    @order_service = OrderService.new
    @book_dao = spy
    allow(@order_service).to receive(:get_book_dao).and_return(@book_dao)
  end

  after do
    # Do nothing
  end

  context 'when part of orders were book orders' do
    it 'should be 2 book orders inserted when 3 orders with 2 book' do
      given_orders(%w[book cd book])
      @order_service.sync_book_orders

      expect(@book_dao).to have_received(:insert_order)
                             .with(book_order_matcher)
                             .twice

    end
  end

end

require_relative '../lib/order.rb'
require_relative '../lib/order_service.rb'
