class CreateSamples < ActiveRecord::Migration[5.2]
  def up
    create_table :samples do |t|
      t.string :body

      t.timestamps
    end
  end

  def down
    drop_table :samples
  end
end

