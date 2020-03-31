class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :name #[t.型 :カラム名]
      t.string :text
      t.text :image
      t.timestamps
    end
  end
end
