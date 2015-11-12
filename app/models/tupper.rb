class Tupper
  include Mongoid::Document

  field :name, type: String
  field :stl, type: String
  field :type, type: String

  belongs_to :kit
end
