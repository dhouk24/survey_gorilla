class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string     :name
      t.references :user
      t.boolean    :published, :default => false
      t.timestamps
    end
  end
end
