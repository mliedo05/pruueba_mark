class RenameStatusFromCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :status, :public
  end
end
