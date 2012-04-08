class CreateDeviseOauth2ProvidableSchema < ActiveRecord::Migration
  def change
    create_table :client_apps do |t|
      t.string :name
      t.string :redirect_uri
      t.string :website
      t.string :identifier
      t.string :secret
      t.timestamps
    end
    change_table :client_apps do |t|
      t.index :identifier, :unique => true
    end

    create_table :grant_access_tokens do |t|
      t.belongs_to :user, :client_app, :refresh_request
      t.string :token
      t.datetime :expires_at
      t.timestamps
    end
    change_table :grant_access_tokens do |t|
      t.index :token, :unique => true
      t.index :expires_at
      t.index :user_id
      t.index :client_app_id
    end

    create_table :refresh_requests do |t|
      t.belongs_to :user, :client_app
      t.string :token
      t.datetime :expires_at
      t.timestamps
    end
    change_table :refresh_requests do |t|
      t.index :token, :unique => true
      t.index :expires_at
      t.index :user_id
      t.index :client_app_id
    end

    create_table :authorizations do |t|
      t.belongs_to :user, :client_app
      t.string :token
      t.datetime :expires_at
      t.string :redirect_uri
      t.timestamps
    end
    change_table :authorizations do |t|
      t.index :token, :unique => true
      t.index :expires_at
      t.index :user_id
      t.index :client_app_id
    end
  end
end
