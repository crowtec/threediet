class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :birth_date, type: Date
  field :gender, type: String
  field :target, type: String

  field :daily_cals, type: Integer
  field :macro_nutrients, type: Integer

  field :weight, type: Integer
  field :height, type: Integer
  field :daily_activity, type: String
  field :supervised, type: Boolean

  field :status, type: String, default: 'Pending'

  belongs_to :kit
  belongs_to :color

  attr_accessor :t_index, :k_index, :c_index

  def self.permitted_params
    [:name, :birth_date, :target, :gender, :daily_cals, :daily_activity, :weight, :height, :supervised, :status, :macro_nutrients, :kit, :color]
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
