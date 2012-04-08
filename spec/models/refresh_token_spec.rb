require 'spec_helper'

describe ABSTRACT(:refresh_token) do
  it do
    ABSTRACT(:refresh_token).table_name.should == ABSTRACT(:refresh_token_plur).to_s
  end

  describe 'basic refresh token instance' do
    with :client
    subject do
      ABSTRACT(:refresh_token).create! ABSTRACT(:client_sym) => client
    end
    it { should validate_presence_of :token }
    it { should validate_uniqueness_of :token }
    it { should belong_to :user }
    it { should belong_to ABSTRACT(:client_sym) }
    it { should validate_presence_of ABSTRACT(:client_sym) }
    it { should validate_presence_of :expires_at }
    it { should have_many ABSTRACT(:access_token_plur) }
    it { should have_db_index ABSTRACT(:client_sym_id) }
    it { should have_db_index :user_id }
    it { should have_db_index(:token).unique(true) }
    it { should have_db_index :expires_at }
  end
end
