class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      [
        :token_authenticatable,
        :database_authenticatable,
        :recoverable,
        :rememberable,
        :trackable
      ].each do |devise_delegate|
        t.send devise_delegate
      end
      t.timestamps
    end
  end
end
