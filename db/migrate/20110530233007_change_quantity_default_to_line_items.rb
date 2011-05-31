class ChangeQuantityDefaultToLineItems < ActiveRecord::Migration
  def self.up
    change_column_default(:line_items, :quantity, 1)
  end

  def self.down
    change_column_default(:line_items, :quantity, nil)
  end
end
