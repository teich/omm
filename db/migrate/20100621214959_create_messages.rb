class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :to_csv
      t.text :template
      t.text :subject

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
