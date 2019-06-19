class CreateUserDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_dogs do |t|
      t.references :user, foreign_key: true
      t.references :dog, foreign_key: true

      t.timestamps
    end
  end
end
