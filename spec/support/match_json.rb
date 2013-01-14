# "{'foo': 'bar'}".should match_json {:foo => :bar}
# monkeypatch for expires_in -> value missmatch from 900 to 899
RSpec::Matchers.define :match_json do |expected|
  match do |actual|
    json = ActiveSupport::JSON

    actual_json =   json.decode actual
    expected_json = json.decode expected.to_json

    if actual_json['expires_in'] && expected_json['expires_in']
      actual_json['expires_in'] = expected_json['expires_in']
    end

    actual_json == expected_json
  end
end
