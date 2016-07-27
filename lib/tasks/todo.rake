namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Item.created_at - 7.days).destroy_all
    # Item.delete_expired
  end

end
