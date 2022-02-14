class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :mark
      t.text :comment
      t.integer :user_id
      t.timestamps
    end
  end
end
