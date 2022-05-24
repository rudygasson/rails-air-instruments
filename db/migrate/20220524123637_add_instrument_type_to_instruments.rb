class AddInstrumentTypeToInstruments < ActiveRecord::Migration[7.0]
  def change
    add_column :instruments, :instrument_type, :string
  end
end
