require 'active_record'

class Contact <ActiveRecord::Base
  has_many :phones
  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: true

  def to_s
    temp = "ID: #{self.id}\nName: #{self.firstname} #{self.lastname}\nEmail: #{self.email}\n"
    phone = Phone.where(contact_id: self.id)

    phone.each do |p|
      temp+= "#{p.phone_type.capitalize}: #{p.phone_num}\n"
    end
    temp += "Address: #{self.address}\n\n"

    temp
  end
end

class Phone<ActiveRecord::Base
  belongs_to :contact
end
