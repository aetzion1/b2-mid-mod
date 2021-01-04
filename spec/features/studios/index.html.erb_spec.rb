require 'rails_helper'

RSpec.describe "As a user, when I visit the studio index page" do
  before :each do
    @jazzhands = Studio.create!(name: 'Jazz Hands Productions', location: 'Hollywood')
    @deepsouth = Studio.create!(name: 'Deep South Films', location: 'Macon, Georgia')
    @myshoes = Movie.create!(title: 'My Pretty Shoes', creation_year: 1990, genre: 'Romantic Comedy', studio_id: @deepsouth.id)
    @mysandals = Movie.create!(title: 'My Pretty Sandals', creation_year: 1992, genre: 'Romantic Comedy', studio_id: @deepsouth.id)
    @jazz1 = Movie.create!(title: 'All That Jazz', creation_year: 2005, genre: 'Comedy', studio_id: @jazzhands.id)
    @jazz2 = Movie.create!(title: 'All That Jazz 2', creation_year: 2010, genre: 'Comedy', studio_id: @jazzhands.id)
    @jazz3 = Movie.create!(title: "Jazz Ain't Dead", creation_year: 2020, genre: 'Horror', studio_id: @jazzhands.id)
  end
  
  it "displays a list of all movie studios" do
    visit '/studios'
    
    expect(all('#studio')[0]).to have_content(@jazzhands.name)
    expect(all('#studio')[1]).to have_content(@deepsouth.name)
  end

  it "displays the name of all movies underneath each studio" do
    visit '/studios'
    
    expect(all('#studio')[0]).to have_content(@jazz1.name)
    expect(all('#studio')[0]).to have_content(@jazz2.name)
    expect(all('#studio')[0]).to have_content(@jazz3.name)

    expect(all('#studio')[1]).to have_content(@myshoes.name)
    expect(all('#studio')[1]).to have_content(@mysandals.name)
  end

end
