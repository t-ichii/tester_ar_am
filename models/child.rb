class Child < ActiveRecord::Base
  belongs_to :parent
  has_many :grandchildren, dependent: :destroy
end
