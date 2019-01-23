class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  after_create do |author|
    Apartment::Tenant.create(author.name)
  end

  after_destroy do |author|
    Apartment::Tenant.drop(author.name)
  end
end
