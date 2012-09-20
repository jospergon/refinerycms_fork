class CreateRefinerycmsResourcesSchema < ActiveRecord::Migration
  def change
    create_table :betycms_resources do |t|
      t.string   :file_mime_type
      t.string   :file_name
      t.integer  :file_size
      t.string   :file_uid
      t.string   :file_ext

      t.timestamps
    end
  end
end
