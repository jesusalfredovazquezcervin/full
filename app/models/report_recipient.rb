class ReportRecipient < ActiveRecord::Base
  belongs_to :report
  belongs_to :contacto
end
