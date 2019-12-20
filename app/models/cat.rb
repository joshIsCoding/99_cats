class Cat < ApplicationRecord
   COLORS = [
      "tortoiseshell",
      "tabby",
      "leopard"
   ]
   validates :birth_date, :name, presence: true
   validates :color, inclusion: { in: COLORS }, presence: true 
   validates :sex, inclusion: { in: ["M", "F"] }, presence: true
end
