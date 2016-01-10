require 'elasticsearch/model'
class Job < ActiveRecord::Base

  include Elasticsearch::Model

  include Elasticsearch::Model::Callbacks

  paginates_per 10



  establish_connection(
    :adapter  => "mysql2",
    :host     => "127.0.0.1",
    :port     => "3306",
    :username => "root",
    :password => "root",
    :database => "info"


)

  def self.search(query,query2,query3)
    __elasticsearch__.search(
        "query": { "bool": { "must": [ { "query_string": { "default_field": "job.job","query": query}}],"must_not": [ ],"should": [ { "query_string": { "default_field": "job.locate","query": query2}},{ "query_string": { "default_field": "job.degree","query": query3}}]}},
        "from": 0,
        "size": 25000,
        "sort": [ ],
        "aggs": { },

            highlight: {
                pre_tags: ['<mark>'],
                post_tags: ['</mark>'],
                fields: {
                    job: {},

                }
            }


    )


  end

end
