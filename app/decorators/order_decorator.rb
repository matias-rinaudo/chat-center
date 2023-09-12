class OrderDecorator < ApplicationDecorator
  delegate_all

  def full_adress
    "#{self.adress}, #{self.zip_code}"
  end

end
