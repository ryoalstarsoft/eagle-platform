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

require 'rails_helper'

RSpec.describe Vendor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
