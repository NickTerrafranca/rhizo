class AddColumnDefaultToBatch < ActiveRecord::Migration[6.0]
  def up
    change_column_default(:batches, :concentration, from: nil, to: 100.00)
    change_column_default(:batches, :multiplier, from: nil, to: 1.0)
  end

  def down
    change_column_default(:batches, :concentration, from: 100.00, to: nil)
    change_column_default(:batches, :multiplier, from: 1.0, to: nil)
  end
end
