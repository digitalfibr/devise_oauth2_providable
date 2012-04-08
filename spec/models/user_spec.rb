require 'spec_helper'

describe User do
  it { should have_many ABSTRACT(:access_token_plur) }
  it { should have_many ABSTRACT(:authorization_code_plur) }
end
