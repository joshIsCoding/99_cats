class CatRentalRequest < ApplicationRecord
   validates :start_date, :end_date, presence: true
   validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED']}

   belongs_to(
      :desired_cat,
      class_name: "Cat",
      foreign_key: :cat_id,
      primary_key: :id
   )
end
