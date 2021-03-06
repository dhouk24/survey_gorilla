class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string     :name
      t.string     :image
      t.references :creator
      t.boolean    :published, :default => false
      t.timestamps
    end
  end
end
