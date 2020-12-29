require 'rspec'
require '../lib/holiday'
require 'date'

def given_today(month, day)
  allow(Date).to receive(:today).and_return(Date.new(2000, month, day))
end

def say_hello_should_be(expected)
  expect(@holiday.say_hello).to eq(expected)
end

describe 'Holiday' do
  before do
    @holiday = Holiday.new
  end

  after do
    # Do nothing
  end

  describe ':say_hello' do
    context 'when today is Xmas' do
      it 'is Dec 25' do
        given_today(12, 25)
        say_hello_should_be('Merry Xmas')
      end

      it 'is Dec 24' do
        given_today(12, 24)
        say_hello_should_be('Merry Xmas')
      end

    end
    context 'when today is not Xmas' do
      it 'should return Today is not Xmas' do
        given_today(12, 26)
        say_hello_should_be('Today is not Xmas')
      end
    end

  end
end