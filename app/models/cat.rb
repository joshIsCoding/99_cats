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

   has_many(
      :rental_requests,
      class_name: "CatRentalRequest",
      foreign_key: :cat_id,
      primary_key: :id,
      dependent: :destroy
   )

   belongs_to(
      :owner,
      class_name: 'User',
      foreign_key: :owner_id,
      primary_key: :id
   )

   def age
      time_ago_in_words(birth_date)
   end
end
