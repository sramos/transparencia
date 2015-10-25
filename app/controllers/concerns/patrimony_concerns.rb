module PatrimonyConcerns extend ActiveSupport::Concern
  included do
    before_filter :get_subheader_info
  end

  def get_subheader_info
    name = params[:controller]
    @patrimony_section = name.sub(/patrimony\//, "")
  end

end
