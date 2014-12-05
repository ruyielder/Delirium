ActiveAdmin.register Post do
  controller do
    def permitted_params
      params.permit(:title , :slug, :content, :draft, :published_at)
    end
  end
end