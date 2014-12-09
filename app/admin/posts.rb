ActiveAdmin.register Post do
  form do |f|
    f.inputs 'Details' do
      f.input :title, label: 'Tytuł'
      f.input :content, label: 'Treść'
      f.input :tag_line, label: 'Tagi'
      f.input :draft, label: 'Szkic?'
    end

    f.actions
  end


  controller do
    defaults finder: :find_by_slug

    def permitted_params
      params.permit!
    end
  end
end