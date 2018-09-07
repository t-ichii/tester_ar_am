class CreateParentChild < ActiveRecord::Migration[5.2]
  def up
    create_table :parents do |t|
      t.string :body

      t.timestamps
    end
    create_table :children do |t|
      t.references :parent
      t.string :body

      t.timestamps
    end
  end

  def down
    drop_table :children
    drop_table :parents
  end
end
