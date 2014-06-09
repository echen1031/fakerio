require 'spec_helper'

describe "Emails API" do
  it 'sends one email when no number is specified'do
    user = FactoryGirl.create(:user)
    get '/api/v1/internet/emails.json', uuid: user.uuid, auth_token: user.authentication_token
    expect(response).to be_success
    emails = JSON.parse(response.body)
    expect(emails.size).to eq 1
  end
  it 'sends a list of a specified number of  emails'do
    user = FactoryGirl.create(:user)
    get '/api/v1/internet/emails.json', count: 10, uuid: user.uuid, auth_token: user.authentication_token
    expect(response).to be_success
    emails = JSON.parse(response.body)
    expect(emails.size).to eq 10
  end
end
