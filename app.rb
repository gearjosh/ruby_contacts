require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require './lib/contact'
also_reload 'lib/**/*.rb'

get '/' do
  @contacts = Contact.all
  erb :home
end

get '/add' do
  erb :add
end

post '/' do
  att_first_name = params[:first_name].capitalize.strip
  att_last_name = params[:last_name].capitalize.strip
  att_job_title = params[:job_title].strip
  att_company = params[:company].strip
  hash = Hash.new
  hash.store(:first_name, att_first_name)
  hash.store(:last_name, att_last_name)
  hash.store(:job_title, att_job_title)
  hash.store(:company, att_company)
  @contact = Contact.new(hash)
  @contact.save
  @contacts = Contact.all
  erb :home
end
