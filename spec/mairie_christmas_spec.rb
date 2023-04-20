require_relative '../lib/mairie_christmas'

describe "mairie christmas concatenate two arrays into a fresh Hash" do
  it "return the fresh Hash" do
    expect(mairie_christmas.is_a?(Hash)).to be_truthy
  end
  it "doesn't return nil when saving the URL" do
    expect(mairie_christmas).not_to be_nil
  end
  it "also contains names, like:" do
    expect(mairie_christmas).to include("SURVILLIERS")
  end
end