module CurrencyHelper
  def to_currency(num)
    num.to_f / 100
  end
end