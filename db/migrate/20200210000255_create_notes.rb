class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :text
      t.jsonb :entities, default: {}
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
