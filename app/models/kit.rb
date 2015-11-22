class Kit
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :model, type: String

  attr_accessor :breakfasts_ids
  attr_accessor :lunchs_ids
  attr_accessor :dinners_ids

  has_and_belongs_to_many :breakfasts, class_name: 'Tupper', dependent: :nullify, inverse_of: :breakfast_kits
  has_and_belongs_to_many :lunchs, class_name: 'Tupper', dependent: :nullify, inverse_of: :lunch_kits
  has_and_belongs_to_many :dinners, class_name: 'Tupper', dependent: :nullify, inverse_of: :dinner_kits

  belongs_to :order

  def self.permitted_params
    [:name, :description, :model]
  end

  def add_tuppers kit
    self.breakfasts = Tupper.in(id: kit[:breakfasts_ids])
    self.lunchs = Tupper.in(id: kit[:lunchs_ids])
    self.dinners = Tupper.in(id: kit[:dinners_ids])
  end
end
