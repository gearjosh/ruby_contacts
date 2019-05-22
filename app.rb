require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require './lib/contact'
also_reload 'lib/**/*.rb'

get '/' do
  redirect to 'contacts'
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  att_first_name = params[:first_name]
  att_last_name = params[:last_name]
  att_job_title = params[:job_title]
  att_company = params[:company]
  hash = {first_name: att_first_name,
          last_name: att_last_name,
          job_title: att_job_title,
          company: att_company}
  @contact = Contact.new(hash)
  @contact.save
  redirect to '/contacts'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :contact
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.delete
  redirect to 'contacts'
end
