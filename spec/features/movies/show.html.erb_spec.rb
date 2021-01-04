require 'rails_helper'

RSpec.describe "As a user, when I visit a movie's show page" do
    before :each do
        @jazzhands = Studio.create!(name: 'Jazz Hands Productions', location: 'Hollywood')
        @deepsouth = Studio.create!(name: 'Deep South Films', location: 'Macon, Georgia')
        @myshoes = Movie.create!(title: 'My Pretty Shoes', creation_year: 1990, genre: 'Romantic Comedy', studio_id: @deepsouth.id)
        @mysandals = Movie.create!(title: 'My Pretty Sandals', creation_year: 1992, genre: 'Romantic Comedy', studio_id: @deepsouth.id)
        @jazz1 = Movie.create!(title: 'All That Jazz', creation_year: 2005, genre: 'Comedy', studio_id: @jazzhands.id)
        @jazz2 = Movie.create!(title: 'All That Jazz 2', creation_year: 2010, genre: 'Comedy', studio_id: @jazzhands.id)
        @jazz3 = Movie.create!(title: "Jazz Ain't Dead", creation_year: 2020, genre: 'Horror', studio_id: @jazzhands.id)
        @tom = Actor.create!(name: "Tom Cat", age: 10)
        @jerry = Actor.create!(name: "Jerry Mouse", age: 8)
        @pluto = Actor.create!(name: "Pluto Dog", age: 12)
        Cast.create!(actor: @jerry, movie: @jazz1)
        Cast.create!(actor: @tom, movie: @jazz1)
        Cast.create!(actor: @jerry, movie: @jazz2)
        Cast.create!(actor: @tom, movie: @jazz2)
        Cast.create!(actor: @pluto, movie: @jazz3)
        Cast.create!(actor: @tom, movie: @jazz3)
        Cast.create!(actor: @pluto, movie: @myshoes)
        Cast.create!(actor: @tom, movie: @mysandals)
        # Should have made the join tbale title "cast" - update if time allows
    end
    
    
    it "displays the movie's title, creation year, and genre" do
        visit "/movies/#{@jazz1.id}"
        save_and_open_page

        expect(page).to have_content(@jazz1.title)
        expect(page).to have_content(@jazz1.creation_year)
        expect(page).to have_content(@jazz1.genre)
    end

    it "lists the movie's actors from youngest to oldest" do
        visit "/movies/#{@jazz1.id}"

        expect(all('#movie-actor')[0]).to have_content(@jerry.name)
        expect(all('#movie-actor')[1]).to have_content(@tom.name)
    end

    it "lists the average age of the movie's actors" do
        visit "/movies/#{@jazz1.id}"

        expect(page).to have_content("9")
    end

    it "allows me to add an actor to the cast" do
        visit "/movies/#{@jazz1.id}"
       
        within("#add-actor") do
            expect(page).to have_button("Add Actor")
            # expect(page).to have_content(@jerry.name)
            # expect(page).to have_content(@tom.name)
        end

        within ("#Add-actor") do
          fill_in "Add Actor", with: @pluto.name
          click_on "Add Actor"
        end

        expect(current_path).to eq("/movies/#{@jazz1.id}")

        expect(page).to have_content(@pluto.name)

    end
end