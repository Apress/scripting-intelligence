require 'rubygems'
require 'cgi'
require 'json'
require 'pp'

require 'restclient'

protocol = RestClient.get("http://localhost:8111/sesame/repositories/protocol")
puts protocol

query ="SELECT ?s WHERE {
  ?s
  <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
  <http://www.w3.org/2000/01/rdf-schema#Class>
}"

uri = "http://localhost:8111/sesame/repositories/test4?query=" + CGI.escape(query)
puts uri
payload = RestClient.get(uri, :accept => 'application/sparql-results+json')
puts payload
json_data = JSON.parse(payload)
pp json_data

