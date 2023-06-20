# == Schema Information
#
# Table name: vendors
#
#  id           :bigint(8)        not null, primary key
#  uuid         :uuid             not null
#  name         :string
#  address      :string
#  address2     :string
#  city         :string
#  state        :string
#  zip_code     :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vendor < ApplicationRecord
  attr_accessor :remove_logo

  # ######################
  # CONSTANTS
  # ######################

  # ######################


  # ######################
  # SCOPES
  # ######################

  # ######################

  
  # ######################
  # SEARCH SCOPES
  # ######################

  # ######################


  # ######################
  # PLUGINS / MODULES
  # ######################
  has_one_attached :logo
  # ######################


  # ######################
  # ASSOCIATIONS
  # ######################
  has_many :users, dependent: :destroy
  has_many :trucks, dependent: :destroy
  has_many :suppliers, dependent: :destroy
  has_many :materials, through: :suppliers
  # ######################


  # ######################
  # VALIDATIONS
  # ######################
  validates :name, presence: true
  validates :address, :city, :state, :zip_code, presence: true
  validates :phone_number, presence: true
  phony_normalize :phone_number, default_country_code: 'US'
  validates_plausible_phone :phone_number, normalized_country_code: 'US', presence: true
  # ######################


  # ######################
  # ENUMERATORS
  # ######################
  enum role: [:haul_admin, :manager, :sales_manager, :sales, :dispatch, :driver, :customer]
  # ######################


  # ######################
  # CALLBACKS
  # ######################
  before_save :delete_logo, if: ->{ remove_logo == '1' }
  # ######################


  def short_name
    name.split(' ')[0]
  end
  
  private
    def delete_logo
      self.logo.purge
    end
end
