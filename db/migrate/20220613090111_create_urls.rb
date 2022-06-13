class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :full_url
      t.string :short_url

      t.timestamps
    end
  end
end
