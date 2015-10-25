class Topic < ActiveRecord::Base
  has_many :references, dependent: :destroy
end
