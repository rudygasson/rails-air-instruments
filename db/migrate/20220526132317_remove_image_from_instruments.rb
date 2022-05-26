class RemoveImageFromInstruments < ActiveRecord::Migration[7.0]
  def change
    remove_column :instruments, :image, :string
  end
end
