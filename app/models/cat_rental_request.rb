class CatRentalRequest < ApplicationRecord
   validates :start_date, :end_date, presence: true
   validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED']}

   belongs_to(
      :desired_cat,
      class_name: "Cat",
      foreign_key: :cat_id,
      primary_key: :id
   )

   def overlapping_requests
      CatRentalRequest.where(cat_id: self.cat_id)
      .where.not(<<-SQL, this_start_date: self.start_date, this_end_date: self.end_date, this_id: self.id)
         (end_date < :this_start_date)
         OR (start_date > :this_end_date)
         OR (id = :this_id)
      SQL
      # filters out all rental requests that start after or end before the current 
      # request for the same cat
   end

   def overlapping_approved_requests
      overlapping_requests.where(status: "APPROVED")
   end
end
