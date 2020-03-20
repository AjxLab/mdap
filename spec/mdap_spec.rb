RSpec.describe Mdap do
  it "has a version number" do
    expect(Mdap::VERSION).not_to be nil
  end

  mdap(300) { sleep 0.01 }
end
