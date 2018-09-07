class Parent < ActiveRecord::Base
  has_many :children, dependent: :destroy
end
