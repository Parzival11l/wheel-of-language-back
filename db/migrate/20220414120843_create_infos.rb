class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :first_name, default: nil
      t.string :last_name, default: nil
      t.string :school, default: nil
      t.string :disabled, default: nil
      t.string :age, default: nil
      t.timestamps
    end
  end
end
