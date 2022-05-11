class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.datetime :date
      t.datetime :time_start
      t.datetime :game_time
      t.string :result
      t.belongs_to :user
      t.timestamps
    end
  end
end
bi