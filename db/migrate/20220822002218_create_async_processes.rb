class CreateAsyncProcesses < ActiveRecord::Migration[7.0]
  def change
    create_table :async_processes do |t|
      t.integer :status

      t.timestamps
    end
  end
end
