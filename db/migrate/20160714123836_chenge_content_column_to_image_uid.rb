class ChengeContentColumnToImageUid < ActiveRecord::Migration[5.0]
  def change
    remove_column :contents, :content_uid
    add_column :contents, :image_uid, :string
  end
end
