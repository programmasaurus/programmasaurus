class AddLemmaToWords < ActiveRecord::Migration
  def change
    execute "truncate words"
    add_column :words, :lemma, :string, null: false
  end
end
