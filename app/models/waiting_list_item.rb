class WaitingListItem < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor, optional:true
  belongs_to :speciality
end
