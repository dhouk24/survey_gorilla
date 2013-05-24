class CreateUserSurveys < ActiveRecord::Migration
  def change
    create_table :user_surveys do |t|
      t.references :survey
      t.references :user
      t.timestamps
    end
  end
end
