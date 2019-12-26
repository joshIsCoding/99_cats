class CatRentalRequest < ApplicationRecord
   validates :start_date, :end_date, presence: true
   validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED']}
   validate :does_not_overlap_approved_request

   belongs_to(
      :desired_cat,
      class_name: "Cat",
      foreign_key: :cat_id,
      primary_key: :id
   )

   belongs_to(
      :requester,
      class_name: 'User',
      foreign_key: :requester_id,
      primary_key: :id
   )

   def pending?
      self.status == "PENDING"
   end

   def denied?
      self.status == "DENIED"
   end

   def overlapping_requests
      CatRentalRequest.where(cat_id: self.cat_id)
      .where.not(id: self.id)
      .where.not(<<-SQL, this_start_date: self.start_date, this_end_date: self.end_date, this_id: self.id)
         (end_date < :this_start_date)
         OR (start_date > :this_end_date)
      SQL
      # filters out all rental requests that start after or end before the current 
      # request for the same cat
   end

   def overlapping_pending_requests
      overlapping_requests.where(status: "PENDING")
   end

   def overlapping_approved_requests
      overlapping_requests.where(status: "APPROVED")
   end

   def approve!
      raise "This request isn't pending" unless self.pending?
      CatRentalRequest.transaction do
         self.status = "APPROVED"
         self.save!
         overlapping_pending_requests.update(status: "DENIED")
      end
   end

   def deny!
      raise "This request isn't pending" unless self.pending?
      self.status = "DENIED"
      self.save!
   end

   private
   def does_not_overlap_approved_request
      if overlapping_approved_requests.exists? && !self.denied?
         errors[:base] << "#{self.desired_cat.name} is unavailable between the dates you have selected."
      end
   end
end
