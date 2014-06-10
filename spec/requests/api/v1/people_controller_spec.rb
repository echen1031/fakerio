require 'spec_helper'

describe "People API" do
  it 'sends one person when no number is specified'do
    user = FactoryGirl.create(:user)
    get '/api/v1/people.json', uuid: user.uuid, auth_token: user.authentication_token
    expect(response).to be_success
    expect(json.size).to eq 1
  end


  it 'sends a list of a specified number of people'do
    user = FactoryGirl.create(:user)
    get '/api/v1/people.json', count: 10, uuid: user.uuid, auth_token: user.authentication_token
    expect(response).to be_success
    expect(json.size).to eq 10
  end

  it 'sends a list of a specific attribute when that attribute is requested by name' do
    user = FactoryGirl.create(:user)
    get '/api/v1/people.json', count: 10, uuid: user.uuid, auth_token: user.authentication_token, field: "email"
    expect(response).to be_success
    expect(json.size).to eq 10
  end
end
