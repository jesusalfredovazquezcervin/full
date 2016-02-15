class Step < ActiveRecord::Base
  class FormValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if record.form
        if Step.where(:procedure_id => record.procedure_id, :form => true).count > 0
          record.errors[attribute] << (options[:message] || "solo un procedimiento + paso puede tener form = true")
        end
      end
    end
  end

  belongs_to :procedure
  validates :procedure_id, :name, :detail, :number,
            presence: true
  validates :procedure_id,
            uniqueness:  {scope: [:name]}
  validates :form, form: true
end
