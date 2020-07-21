# require 'rails_helper'

# describe Transaction do
#   describe '#create' do
#       it "user_id,item_idが存在すれば登録できること" do
#         transaction = build(:transaction)
#         expect(transaction).to be_valid
#       end

#     it "user_idがない場合は登録できないこと" do
#       transaction = build(:transaction, user_id: "")
#       transaction.valid?
#       expect(transaction.errors[:user_id]).to include("can't be blank")
#     end

#     it "item_idがない場合は登録できないこと" do
#       transaction = build(:transaction, item_id: "")
#       transaction.valid?
#       expect(transaction.errors[:item_id]).to include("can't be blank")
#     end
#   end
# end