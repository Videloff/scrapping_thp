require_relative '../lib/crazy_scrapping'

describe "crazy_function return 'true' if the main variable is a Hash" do
  it "crazy_function" do
    expect(perform.is_a?(Hash)).to be_truthy
  end
  it "crazy_function" do
    expect(perform).not_to be_nil
  end
  it "return a well saved url" do
    expect(perform).to include{"AVAX"}
  end
end

# describe "crazy_function return true if the URI.open works fin. False if it doesn't" do
#   it "false if it gets modified" do
#     expect(false).to eq(false)
#   end
# end