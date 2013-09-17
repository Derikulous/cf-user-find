class User < ActiveRecord::Base
  validates :name, presence: true
  validates_format_of :email, uniqueness: :true,
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "Must be a valid email address"
  has_one :license
  accepts_nested_attributes_for :license

  def email=(value)
    value = value.downcase.strip
    write_attribute :email, value
  end

def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end
end
