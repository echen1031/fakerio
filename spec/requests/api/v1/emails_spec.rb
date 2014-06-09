require 'spec_helper'

describe "Emails API" do
  it 'sends a list of emails'do

    get '/api/v1/internet/emails'
    binding.pry

    expect(response).to be_success
  end
end
