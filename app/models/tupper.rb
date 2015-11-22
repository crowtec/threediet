class Tupper
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :stl, type: String
  field :type, type: String

  has_and_belongs_to_many :breakfast_kits, class_name: 'Kit', inverse_of: :breakfasts
  has_and_belongs_to_many :lunch_kits, class_name: 'Kit', inverse_of: :lunchs
  has_and_belongs_to_many :dinner_kits, class_name: 'Kit', inverse_of: :dinners

  def self.permitted_params
    [:name, :stl, :type]
  end
end
