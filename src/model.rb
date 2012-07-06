require "dbconnect"
require "rubygems"
require "active_record"

# abstract class for mysql full text search
class MySQLFTRecord < ActiveRecord::Base
  self.abstract_class = true

  # return all the text columns, it's used for indexing and searching
  def self.text_columns
    columns.find_all{|x | (x.sql_type.include? 'VARCHAR') || (x.sql_type.include? 'TEXT')|| (x.sql_type.include? 'CHAR') }.map {|x| x.name}.join(',')
  end

  # fulltext search with find_by_sql
  def self.fulltext_search(s)
    return find_by_sql(["SELECT * FROM "+table_name+" WHERE MATCH ("+text_columns+") AGAINST(?)", s])
  end

  # fulltext index creation: change the DB engine type to MyISAM
  # and create the index on all text columns
  def self.create_fulltext_index
    connection.execute("ALTER TABLE "+table_name+" ENGINE=MYISAM")
    connection.execute("CREATE FULLTEXT INDEX "+table_name+"_ft ON "+table_name+" ("+text_columns+")")
  end

  def self.drop_fulltext_index
    connection.execute("DROP INDEX "+table_name+"_ft ON " + table_name)
  end

end

class Person < MySQLFTRecord
end
