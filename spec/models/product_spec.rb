require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '#create' do
    it "全てが入力されれば出品できる" do
      expect(@product).to be_valid   
end

it 'priceが半角数字だと登録できる' do
  @product.price = '1000'
  expect(@product).to be_valid
end

it 'priceが300以上だと登録できる' do
  @product.price = '300'
  expect(@product).to be_valid
end

it 'priceが9999999以下だと登録できる' do
  @product.price = '9999999'
  expect(@product).to be_valid
end

it 'nameが空だと登録できない' do
  @product.name = ''
  @product.valid?
  expect(@product.errors.full_messages).to include("Name can't be blank")
end

 it 'statusが空だと登録できない' do
   @product.status = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Status can't be blank")
  end

  it 'priceが空だと登録できない' do
    @product.price = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Price can't be blank")
  end

  it 'category_id が空だと登録できない' do
    @product.category_id  = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Category Select")
  end

  it 'shipping_charges_id が空だと登録できない' do
    @product.shipping_charges_id  = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Shipping charges Select")
  end

  it 'shipping_days_id が空だと登録できない' do
   @product.shipping_days_id  = ''
   @product.valid?
   expect(@product.errors.full_messages).to include("Shipping days Select")
  end

 it 'shipping_area_id が空だと登録できない' do
   @product.shipping_area_id  = ''
   @product.valid?
   expect(@product.errors.full_messages).to include("Shipping area Select")
 end

  it 'condition_id が空だと登録できない' do
    @product.condition_id = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Condition Select")
  end

  it 'imageが空だと登録できない' do
    @product.image = nil
    @product.valid?
    expect(@product.errors.full_messages).to include("Image can't be blank")
  end

  it 'priceが300以下だと登録できない' do
    @product.price = '299'
    @product.valid?
    expect(@product.errors.full_messages).to include("Price Out of setting range")
  end

  it 'priceが10000000以上だと登録できない' do
    @product.price = '10000000'
    @product.valid?
    expect(@product.errors.full_messages).to include("Price Out of setting range")
  end

  it 'priceが0は登録できない' do
    @product.price = '0'
    @product.valid?
    expect(@product.errors.full_messages).to include("Price Out of setting range")
  end

    it 'priceが全角数字だと登録できない' do
    @product.price = '１０００'
    @product.valid?
    expect(@product.errors.full_messages).to include("Price Half-width number")
    end

  end

end



