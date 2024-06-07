class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :kind_cd
      t.string :value
      t.references :owner, polymorphic: true, null: false

      t.timestamps
    end
  end
end
