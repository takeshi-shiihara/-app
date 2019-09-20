class CreateEnglishes < ActiveRecord::Migration[5.2]
  def change
    create_table :englishes do |t|
      t.string       :word, null: false, unique: true
      t.string       :meaning, null: false, index: :true
      t.timestamps
    end
  end
end
