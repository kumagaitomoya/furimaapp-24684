require 'rails_helper'

RSpec.describe UserProduct, type: :model do
  before do
    @user_product = FactoryBot.build(:user_product)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@user_product).to be_valid
  end

  it 'buiding_nameは空でも保存できること' do
    @user_product.buiding_name = nil
    expect(@user_product).to be_valid
  end

  it 'postal_codeが空だと保存できないこと' do
    @user_product.postal_code = nil
    @user_product.valid?
    expect(@user_product.errors.full_messages).to include("Postal code can't be blank")
  end

  it 'municipalityが空だと保存できないこと' do
    @user_product.municipality = nil
    @user_product.valid?
    expect(@user_product.errors.full_messages).to include("Municipality can't be blank")
  end

  it 'addressが空だと保存できないこと' do
    @user_product.address = nil
    @user_product.valid?
    expect(@user_product.errors.full_messages).to include("Address can't be blank")
  end

  it 'phone_namberが空だと保存できないこと' do
    @user_product.phone_namber = nil
    @user_product.valid?
    expect(@user_product.errors.full_messages).to include("Phone namber can't be blank")
  end

  it 'shipping_area_idが空だと保存できないこと' do
    @user_product.shipping_area_id = nil
    @user_product.valid?
    expect(@user_product.errors.full_messages).to include('Shipping area Select')
  end

  it 'tokenが空だと保存できないこと' do
    @user_product.token = nil
    @user_product.valid?
    expect(@user_product.errors.full_messages).to include("Token can't be blank")
  end

  it 'shipping_area_idが1だと登録できない' do
    @user_product.shipping_area_id = '1'
    @user_product.valid?
    expect(@user_product.errors.full_messages).to include('Shipping area Select')
  end

  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @user_product.postal_code = '1234567'
    @user_product.valid?
    expect(@user_product.errors.full_messages).to include('Postal code Input correctly')
  end

  it 'phone_namberが半角のハイフンを含むと保存できないこと' do
    @user_product.postal_code = '123-4567910'
    @user_product.valid?
    expect(@user_product.errors.full_messages).to include('Postal code Input correctly')
  end
end
