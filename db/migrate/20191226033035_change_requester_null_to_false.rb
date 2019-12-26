class ChangeRequesterNullToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cat_rental_requests, :requester_id, false
  end
end
