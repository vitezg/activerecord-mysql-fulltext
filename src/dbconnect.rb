# default boilerplate
require 'rubygems'
require 'active_record'

# connect to the mysql database
# for JRuby I use the JDBC connector
ActiveRecord::Base.establish_connection(:adapter=>'jdbc', :driver => 'com.mysql.jdbc.Driver',
  :url=> 'jdbc:mysql://localhost/testdb',:username => 'root', :password => 'secret')

# personal preference
ActiveRecord::Base.pluralize_table_names = false
