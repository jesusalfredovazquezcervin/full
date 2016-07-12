require 'active_record'

namespace :database do
  desc "Correction of sequences id"
  task :correction_seq_id  do
    #ActiveRecord::Base.establish_connection adapter:"postgresql", database: "ofintel"
    ActiveRecord::Base.establish_connection(
        :adapter  => "postgresql",
        :host     => "localhost",
        #:username => "deploy",
        #:password => "deploy",
        :database => "ofintel"
    )

    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end
end