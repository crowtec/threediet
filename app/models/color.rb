class Color
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :red, type: Float
  field :green, type: Float
  field :blue, type: Float
  field :intensity, type: Float

  validates :name, presence: true
  validates :red, :green, :blue, :intensity, presence: true, inclusion: {in: 0..1, message: "value must be between 0 and 1"}

  def self.permitted_params
    [:name, :red, :green, :blue, :intensity]
  end


end
