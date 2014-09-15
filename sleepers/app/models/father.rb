class Father < ActiveRecord::Base
  has_many :sons, dependent: :destroy
  accepts_nested_attributes_for :sons, reject_if: :all_blank, allow_destroy: true
  
  def build_sons_up_to(n)
    remained = n - sons.count
    remained = 0 if remained < 0
    
    remained.times {
      sons.build
    }
  end
end
