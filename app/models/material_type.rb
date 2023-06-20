# == Schema Information
#
# Table name: material_types
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class MaterialType < ApplicationRecord
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

  # ######################


  # ######################
  # ASSOCIATIONS
  # ######################
  has_many :materials
  has_many :suppliers, through: :materials
  # ######################


  # ######################
  # VALIDATIONS
  # ######################
  validates :name, presence: true, uniqueness: {:case_sensitive => false}
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
