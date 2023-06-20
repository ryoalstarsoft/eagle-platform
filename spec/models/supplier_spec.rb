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

require 'rails_helper'

RSpec.describe Supplier, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
