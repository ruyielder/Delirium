ActiveAdmin.register Post do
  controller do
    defaults finder: :find_by_slug

    def permitted_params
      params.permit!
    end
  end
end