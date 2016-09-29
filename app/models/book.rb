class Book < ActiveRecord::Base
  def self.search(search_value)
    search_value = search_value ? search_value.downcase : ""
    where("lower(title) like ?", "%#{search_value}%")
  end
end
