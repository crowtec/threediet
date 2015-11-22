class Kit
  require 'rubygems'
  require 'zip'

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :model, type: String

  attr_accessor :breakfasts_ids
  attr_accessor :lunches_ids
  attr_accessor :dinners_ids

  has_and_belongs_to_many :breakfasts, class_name: 'Tupper', dependent: :nullify, inverse_of: :breakfast_kits
  has_and_belongs_to_many :lunches, class_name: 'Tupper', dependent: :nullify, inverse_of: :lunch_kits
  has_and_belongs_to_many :dinners, class_name: 'Tupper', dependent: :nullify, inverse_of: :dinner_kits

  has_many :orders

  def self.permitted_params
    [:name, :description, :model]
  end

  def add_tuppers kit
    self.breakfasts = Tupper.in(id: kit[:breakfasts_ids])
    self.lunches = Tupper.in(id: kit[:lunches_ids])
    self.dinners = Tupper.in(id: kit[:dinners_ids])
  end

  def pack_stl_files_to_zip
    zipfile_name = File.join(Rails.root, 'public', 'system', self.name + '.zip')
    File.delete(zipfile_name) if File.exist?(zipfile_name)


    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      self.breakfasts.each do |tupper|
        # Two arguments:
        # - The name of the file as it will appear in the archive
        # - The original file, including the path to find it
        zipfile.add(tupper.stl_file_name, tupper.stl.path)
      end
    end
  end
end
