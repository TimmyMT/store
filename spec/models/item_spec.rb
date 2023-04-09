require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { build :item }

  it 'check default build' do
    expect(item.valid?).to eq(true)
  end
end
