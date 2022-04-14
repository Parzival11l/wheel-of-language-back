class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :school
      t.string :disabled
      t.datetime :birthday, null: false
      t.timestamps
    end
  end
end
