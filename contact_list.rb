require_relative 'contact'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'contacts2',
  username: 'joseph',
  password: 'joseph',
  host: 'localhost',
  port: 5432,
  min_messages: 'error'
)

unless ARGV[0] == nil
  command = ARGV[0].downcase

  if command == ("help")
    puts "Available commands: "
    puts "  new: Adds a new contact to the database"
    puts "  list: display all contacts"
    puts "  show: display a contact by id#"
    puts "  find: displays contacts that match the provided term"
  elsif command == ("new")
    print "First name: "  
    fname = $stdin.gets.chomp
    print "Last name: "
    lname = $stdin.gets.chomp
    print "Email: "
    email = $stdin.gets.chomp
    command2=""
    phone = {
      home: [],
      cell: []
    }
    loop do
      if command2=~/((Cell|cell|Home|home):\d{3}[\.\-\s]?\d{3}[\.\-\s]?\d{4})$/
        phone[command2.split(":")[0].downcase.to_sym].push(command2.split(":")[1])
      elsif command2=="done"
        break
      elsif command2.length>0
        puts "Please format your input correctly"
      end
      print "Phone number (label:number, done to finish): "
      command2=$stdin.gets.chomp
    end
    print "Address: "
    address = $stdin.gets.chomp
  
    c = Contact.create!(firstname: fname, lastname: lname, email: email, address: address)
  
    phone.each do |k,v|
      v.each do |p|
        Phone.create!(contact_id: c.id, phone_num: p, phone_type: k)
      end
    end
  
  elsif command == ("list")
    results = Contact.find_each
    results.each do |c|
      puts c.to_s
    end
  elsif command == ("show")
    puts Contact.find(ARGV[1]).to_s
  elsif command == ("find")
    results = Contact.where("firstname LIKE :q OR lastname LIKE :q OR email LIKE :q OR address LIKE :q", q: "%#{ARGV[1]}%")
    results.each do |c|
      puts c.to_s
    end
  end
else
  puts "Use Help to show a list of available commands"
end
