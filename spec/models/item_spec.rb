require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "#soft_delete" do
    it "should add a time value to deleted_at" do
      item = Item.create(name: "test")
      item.soft_delete
      expect(item.deleted_at).to be_a_kind_of(ActiveSupport::TimeWithZone)
    end
  end

  describe "#restore" do
    it "should make deleted_at nil" do
      item = Item.create(name: "test")
      item.soft_delete
      expect(item.deleted_at).to be_a_kind_of(ActiveSupport::TimeWithZone)
      item.restore
      expect(item.deleted_at).to be_nil
    end
  end

  describe "#all" do
    it "should exclude items with deleted_at not nil from the result" do
      item = Item.create(name: "test")
      item2 = Item.create(name: "test2")
      item.soft_delete
      expect(Item.all).not_to include(item)
      expect(Item.all).to include(item2)
    end
  end
  
end
