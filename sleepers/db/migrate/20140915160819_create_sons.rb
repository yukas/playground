class CreateSons < ActiveRecord::Migration
  def change
    create_table :sons do |t|
      t.integer :father_id
      t.string :name

      t.timestamps
    end
  end
end
