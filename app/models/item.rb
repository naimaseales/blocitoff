class Item < ActiveRecord::Base
  belongs_to :user
  #Class Method 
  def self.delete_expired
    Item.where("created_at <= ?", Item.created_at - 7.days).destroy_all
  end
end
