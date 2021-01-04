class RenameMovieActorsToCast < ActiveRecord::Migration[5.2]
  def change
    rename_table :movie_actors, :cast
  end
end
