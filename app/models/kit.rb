class Kit
  require 'rubygems'
  require 'zip'

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :model, type: String

  attr_accessor :crockeries_ids
  attr_accessor :utensils_ids
  attr_accessor :happys_ids

  has_and_belongs_to_many :crockeries, class_name: 'Tupper', dependent: :nullify, inverse_of: :crockery_kits
  has_and_belongs_to_many :utensils, class_name: 'Tupper', dependent: :nullify, inverse_of: :utensil_kits
  has_and_belongs_to_many :happys, class_name: 'Tupper', dependent: :nullify, inverse_of: :happy_kits

  has_many :orders

  validates :name, presence: true

  def self.permitted_params
    [:name, :description, :model]
  end

  def tuppers
    self.crockeries + self.utensils + self.happys
  end

  def add_tuppers kit
    self.crockeries = Tupper.in(id: kit[:crockeries_ids])
    self.utensils = Tupper.in(id: kit[:utensils_ids])
    self.happys = Tupper.in(id: kit[:happys_ids])
  end

  def pack_stl_files_to_zip
    zipfile_name = File.join(Rails.root, 'public', 'system', self.name + '.zip')
    File.delete(zipfile_name) if File.exist?(zipfile_name)


    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      self.crockeries.each do |tupper|
        zipfile.add('crockery_' + tupper.stl_file_name, tupper.stl.path)
      end
      self.utensils.each do |tupper|
        zipfile.add('utensil_' + tupper.stl_file_name, tupper.stl.path)
      end
      self.happys.each do |tupper|
        zipfile.add('happy_' + tupper.stl_file_name, tupper.stl.path)
      end
    end

     zipfile_name
  end
end
