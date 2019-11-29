class AddHeadingToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :heading, :string
	
	#add_index :comments, :article_id

  end
end
