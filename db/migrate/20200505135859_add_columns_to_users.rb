class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string, after: :locked_at
    add_column :users, :uid, :string, after: :provider
    add_column :users, :name, :string, after: :id, commnet: '名前'
  end
end
