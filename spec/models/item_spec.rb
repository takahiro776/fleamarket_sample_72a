require 'rails_helper'

describe Item do
  describe '#create' do
    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "nameが40文字以下である場合は登録できること" do
      item = build(:item, name: "A")
      item.valid?
      expect(item).to be_valid
    end

    it "nameが41文字以上である場合は登録できないこと" do
      item = build(:item, name: "aaa" * 41)
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "descriptionがない場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "descriptionが1000文字以下であれば登録できること" do
      item = build(:item, description: "aaa")
      item.valid?
      expect(item).to be_valid
    end

    it "descriptionが1001文字以上であれば登録できないこと" do
      item = build(:item, description: "a" * 1001)
      item.valid?
      expect(item.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end

    it "categoryがない場合は登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("must exist")
    end

    it "blandが空の場合でも登録できること" do
      item = build(:item, brand: nil)
      expect(item).to be_valid
    end

    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("選択してください")
    end

    it "delivery_feeがない場合は登録できないこと" do
      item = build(:item, delivery_fee: nil)
      item.valid?
      expect(item.errors[:delivery_fee]).to include("選択してください")
    end

    it "delivery_regionsがない場合は登録できないこと" do
      item = build(:item, delivery_regions: nil)
      item.valid?
      expect(item.errors[:delivery_regions]).to include("選択してください")
    end

    it "shipping_scheduleがない場合は登録できないこと" do
      item = build(:item, shipping_schedule: nil)
      item.valid?
      expect(item.errors[:shipping_schedule]).to include("選択してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: :nil)
      item.valid?
      expect(item.errors[:price]).to include("300以上9999999以下で入力して下さい")
    end
  end
end