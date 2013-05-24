class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string     :name
      t.references :question
      t.integer    :count, :default => 0
      t.timestamps
    end
  end
end
