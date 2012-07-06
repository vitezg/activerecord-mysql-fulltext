# load the model for manipulations later
require 'model'

class Createtables < ActiveRecord::Migration
  def up
    
    # create the person table
    create_table :person do |t|
      t.string :name
      t.text :bio
    end
    
    # setup ActiveRecord for in-migration operations
    Person.reset_column_information
    
    # create the fulltext index
    Person.create_fulltext_index
  end

  def down
  
    # drop the fulltext index and the table
    Person.drop_fulltext_index
    drop_table :person
  end

end
