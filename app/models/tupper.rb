class Tupper
  include Mongoid::Document
  include Mongoid::Timestamps

  include Mongoid::Paperclip

  field :name, type: String
  field :type, type: String

  has_mongoid_attached_file :stl
  do_not_validate_attachment_file_type :stl



  has_and_belongs_to_many :breakfast_kits, class_name: 'Kit', inverse_of: :breakfasts
  has_and_belongs_to_many :lunch_kits, class_name: 'Kit', inverse_of: :lunchs
  has_and_belongs_to_many :dinner_kits, class_name: 'Kit', inverse_of: :dinners

  def self.tupper_params
    [:name, :stl, :type]
  end
end
