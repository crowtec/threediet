class Color
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :r, type: Float
  field :g, type: Float
  field :b, type: Float
  field :intensity, type: Float

  def self.permitted_params
    [:name, :r, :g, :b, :intensity]
  end
end
