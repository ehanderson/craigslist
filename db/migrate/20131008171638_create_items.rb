class CreateItems <ActiveRecord::Migration

  def change
    create_items :items do |t|
      t.string :name
      t.string :price
      t.string :description

      t.timestamps
    end
  end
end
