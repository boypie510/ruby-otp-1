require 'rspec'
require '../lib/holiday'

describe 'Holiday' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  describe ':say_hello' do
    context 'when today is Xmas' do
      it 'should return Merry Xmas' do
        holiday = Holiday.new
        expect(holiday.say_hello).to eq('Merry Xmas')
      end
    end

  end
end