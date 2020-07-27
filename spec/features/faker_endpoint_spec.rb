require './spec/spec_helper'

describe 'faker api endpoint' do
  it 'can get fake asteroid information' do
    get '/faker'

    response_json = JSON.parse(last_response.body, symbolize_names: true)
    expect(response_json[:id]).to eq("54048900")
    expect(response_json[:name]).to eq("(2020 OO1)")
    expect(response_json[:relative_velocity]).to eq("16270.0247798088")
    expect(response_json[:lunar_distance]).to eq("1.7395081826")
  
    end
end
