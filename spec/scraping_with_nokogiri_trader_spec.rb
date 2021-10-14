require_relative '../lib/scraping_with_nokogiri_trader.rb'

describe "scrap" do
  it "should return a value that is not nil" do
    expect(scrap(1)).to be_truthy
  end
end

#   Difficile de daire des tests plus poussés puisque les
#   valeurs des cryptos changent continuellement.

