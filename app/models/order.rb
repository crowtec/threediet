class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :age, type: Integer
  field :gender, type: String
  field :target, type: String
  field :daily_cals, type: Integer
  field :daily_activity, type: String
  field :diet, type: String
  field :chef, type: Boolean
  field :supervised, type: Boolean

  field :status, type: String, default: 'Pending'

  belongs_to :kit
  belongs_to :color

  def self.permitted_params
    [:name, :age, :target, :gender, :daily_cals, :daily_activity, :diet, :chef, :supervised, :status]
  end

  def self.statuses
    %w(Incomplete
    Pending
    Processed
    Shipping
    Shipped
    Returned
    Canceled)
  end

  def add_kit order
    self.kit = Kit.find(order[:kit])
  end
end
