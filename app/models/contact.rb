class Contact < ApplicationRecord
 belongs_to :customer

validates :contact_name, presence: true
validates :contact_email, presence: true
validates :contact_content, presence: true
end
