class Kit
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :model, type: String

  has_many :breakfasts, class_name: 'Tupper', dependent: :nullify
  has_many :lunchs, class_name: 'Tupper', dependent: :nullify
  has_many :dinners, class_name: 'Tupper', dependent: :nullify
end
