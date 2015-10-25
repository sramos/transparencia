module PatrimonyConcerns extend ActiveSupport::Concern
  included do
    before_filter :get_subheader_info
  end

  def get_subheader_info
    name = params[:controller]
    @patrimony_section = name.sub(/patrimony\//, "")
    @application_dates_range = eval(("patrimony_" + name).camelize).application_dates_range
  end

end
