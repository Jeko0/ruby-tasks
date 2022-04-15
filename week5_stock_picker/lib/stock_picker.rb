# frozen_string_literal: true

class StockPicker
  class InvalidinputError < StandardError; end

  def initialize(stocks)
    @stocks = stocks
  end

  def call
    input_validation
    profitable_days
  rescue InvalidinputError => e
    e.message
  end

  private

  def profitable_days
    buy_value =
      sell_value =
        best_profit =
          profit = 0

    (0..@stocks.length - 2).each do |i|
      profit = @stocks[i + 1..-1].max - @stocks[i]
      next unless profit > best_profit

      best_profit = profit
      buy_value = i
      sell_value = @stocks.index(@stocks[i + 1..-1].max)
    end
    [buy_value, sell_value]
  end

  def input_validation
    raise InvalidinputError, "invalid input" unless @stocks.all?{|i| (i.is_a?(Integer)) && !i.negative?} && @stocks.is_a?(Array)
  end
end

puts StockPicker.new([17, 3, 6, 9, 15, 8, 6, 1, 10]).call
