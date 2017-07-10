require 'rails_helper'

describe Bestseller do
  it "returns a 200 success header when the API call is made" do
    response = Bestseller.get_bestseller_list
    expect(response.code).to(eq(200))
  end


  it "returns books when the API call is made" do
    response = JSON.parse(Bestseller.get_bestseller_list)
    expect(response["results"]).to_not(eq(nil))
  end


end
