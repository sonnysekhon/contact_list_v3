require 'pg'
require 'pry'
require 'active_record'
require_relative 'setup'

class Contact < ActiveRecord::Base

  def to_s
    "Contact #{self.id} is #{self.firstname} #{self.lastname} #{self.email}"
  end

end

case ARGV[0]

  when "help"
    puts  "Here is a list of available commands:"
    puts  "all     -  List all contacts"
    puts  "create  -  Create a contact"
    puts  "update  -  Update a contact by id"
    puts  "destroy -  Delete a contact by id"
    puts  "find    -  Find a contact by id, firstname, lastname or email"

  when "create"
    puts "Enter firstname"
    user_input_firstname = STDIN.gets.chomp
    puts "Enter lastname"
    user_input_lastname = STDIN.gets.chomp
    puts "Enter email"
    user_input_email = STDIN.gets.chomp
    new_contact = Contact.create(firstname: user_input_firstname, lastname: user_input_lastname, email: user_input_email)
    new_contact.save

  when "update"
    puts "Enter firstname"
    user_input_firstname = STDIN.gets.chomp
    puts "Enter lastname"
    user_input_lastname = STDIN.gets.chomp
    puts "Enter email"
    user_input_email = STDIN.gets.chomp
    to_update = Contact.find(ARGV[1])
    to_update.update(firstname: user_input_firstname, lastname: user_input_lastname, email: user_input_email)

  when "destroy"
    to_delete = Contact.find(ARGV[1])
    to_delete.destroy

  when "all"
    puts Contact.all

  when "find"
    case ARGV[1]
      when "id" 
        puts "Found by ID: "
        puts Contact.find(ARGV[2])
      when "firstname" 
        puts "Found by Firstname: "
        puts Contact.where(firstname: ARGV[2])
      when "lastname" 
        puts "Found by Lastname: "
        puts Contact.where(lastname: ARGV[2])
      when "email" 
        puts "Found by Email: "
        puts Contact.find(ARGV[2])
      else
      puts "You're just making it up!"
      end

  else
    puts "You're just making it up!"

end

