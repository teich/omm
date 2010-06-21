class CreateSentMessages < ActiveRecord::Migration
  def self.up
    create_table :sent_messages do |t|
      t.integer :user_id
      t.integer :message_id
      t.timestamps
    end
  end

  def self.down
    drop_table :sent_messages
  end
end
