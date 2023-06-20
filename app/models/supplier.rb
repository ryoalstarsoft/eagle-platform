# == Schema Information
#
# Table name: suppliers
#
#  id           :bigint(8)        not null, primary key
#  vendor_id    :integer
#  name         :string
#  email        :string
#  address      :string
#  address2     :string
#  city         :string
#  state        :string
#  zip_code     :string
#  phone_number :string
#  is_active    :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Supplier < ApplicationRecord
  # ######################
  # CONSTANTS
  # ######################

  # ######################


  # ######################
  # SCOPES
  # ######################
  scope :is_active, -> { where(is_active: true) }
  # ######################

  
  # ######################
  # SEARCH SCOPES
  # ######################

  # ######################


  # ######################
  # PLUGINS / MODULES
  # ######################

  # ######################


  # ######################
  # ASSOCIATIONS
  # ######################
  belongs_to :vendor
  has_many :materials, dependent: :destroy
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

  # ######################


  # ######################
  # CALLBACKS
  # ######################

  # ######################


  private

end
