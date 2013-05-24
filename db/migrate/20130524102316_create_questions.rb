class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string     :name
      t.references :survey
      t.timestamps
    end
  end
end
