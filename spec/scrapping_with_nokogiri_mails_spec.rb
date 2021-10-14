require_relative '../lib/scrapping_with_nokogiri_mails.rb'

describe "get_townhall_email method" do
  it "should return the email of the related town" do
    expect(get_townhall_email("./95/nerville-la-foret.html")).to eq("mairie-nerville95@wanadoo.fr")
    expect(get_townhall_email("./95/pierrelaye.html")).to eq("mairie@ville-pierrelaye.fr")
  end
end

