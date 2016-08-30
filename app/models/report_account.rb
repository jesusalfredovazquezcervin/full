class ReportAccount < ActiveRecord::Base
  belongs_to :report
  belongs_to :datosgenerale
end
