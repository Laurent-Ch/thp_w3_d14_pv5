require_relative '../lib/scrapping_with_nokogiri_trader.rb'

describe "scrapper" do
  it "should return a value that is not nil" do
    expect(scrapper(1)).to be_truthy
  end
end

#   Difficile de daire des tests plus poussés puisque les
#   valeurs des cryptos changent continuellement.

