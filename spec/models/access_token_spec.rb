require 'spec_helper'

describe ABSTRACT(:access_token) do
  it { ABSTRACT(:access_token).table_name.should == ABSTRACT(:access_token_plur).to_s }

  describe 'basic access token instance' do
    with :client
    subject do
      ABSTRACT(:access_token).create! ABSTRACT(:client_sym) => client
    end
    it { should validate_presence_of :token }
    it { should validate_uniqueness_of :token }
    it { should belong_to :user }
    it { should belong_to ABSTRACT(:client_sym) }
    it { should validate_presence_of ABSTRACT(:client_sym) }
    it { should validate_presence_of :expires_at }
    it { should belong_to ABSTRACT(:refresh_token_sym) }
    it { should allow_mass_assignment_of ABSTRACT(:refresh_token_sym) }
    it { should have_db_index ABSTRACT(:client_sym_id) }
    it { should have_db_index :user_id }
    it { should have_db_index(:token).unique(true) }
    it { should have_db_index :expires_at }
  end

  describe '#expires_at' do
    context 'when refresh token does not expire before access token' do
      with :client
      before do
        @later = 1.year.from_now
        @refresh_token = client.send(ABSTRACT(:refresh_token_plur)).create!
        @refresh_token.expires_at = @soon
        @access_token = ABSTRACT(:access_token).create!(
          ABSTRACT(:client_sym) => client,
          ABSTRACT(:refresh_token_sym) => @refresh_token
        )
      end
      focus 'should not set the access token expires_at to equal refresh token' do
        @access_token.expires_at.should_not == @later
      end
    end
    context 'when refresh token expires before access token' do
      with :client
      before do
        @soon = 1.minute.from_now
        @refresh_token = client.send(ABSTRACT :refresh_token_plur).create!
        @refresh_token.expires_at = @soon
        @access_token = ABSTRACT(:access_token).create!(
          ABSTRACT(:client_sym) => client,
          ABSTRACT(:refresh_token_sym) => @refresh_token
        )
      end
      it 'should set the access token expires_at to equal refresh token' do
        @access_token.expires_at.should == @soon
      end
    end
  end
end
