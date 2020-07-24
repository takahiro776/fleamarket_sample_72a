require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe '#create' do
        it "user_id,item_idが存在すれば登録できること" do
          deal = build(:deal)
          expect(deal).to be_valid
        end
    
        it "user_idがない場合は登録できないこと" do
          deal = build(:deal, user_id: "")
          deal.valid?
          expect(deal.errors[:user_id]).to include("can't be blank")
        end
    
        it "item_idがない場合は登録できないこと" do
          deal = build(:deal, item_id: "")
          deal.valid?
          expect(deal.errors[:item_id]).to include("can't be blank")
        end
      end
end
