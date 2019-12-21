class Cat < ApplicationRecord
   include ActionView::Helpers::DateHelper
   COLORS = [
      "tortoiseshell",
      "tabby",
      "leopard"
   ].freeze
   validates :birth_date, :name, presence: true
   validates :color, inclusion: { in: COLORS }, presence: true 
   validates :sex, inclusion: { in: ["M", "F"] }, presence: true

   def age
      time_ago_in_words(birth_date)
   end
end
