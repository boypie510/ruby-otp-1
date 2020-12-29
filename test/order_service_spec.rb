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
      # order_service = OrderService.new
      pending 'Not implemented'
    end
  end
end

require_relative '../lib/order.rb'
require_relative '../lib/order_service.rb'
