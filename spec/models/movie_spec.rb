require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should belong_to :studio}
    it { should have_many :casts}
    it { should have_many(:actors).through(:casts)}
  end
end
