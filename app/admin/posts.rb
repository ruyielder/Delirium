ActiveAdmin.register Post do
  form :html => { multipart: true } do |f|
    f.inputs 'Details' do
      f.input :title, label: 'Tytuł'
      f.input :content, label: 'Treść'
      f.input :tag_line, label: 'Tagi'
      f.input :draft, label: 'Szkic?'
    end

    f.has_many :snippets, :heading => 'Wstawki' do |app_f|
      app_f.input :name, label: 'Nazwa pliku'
      app_f.input :source, label: 'Kod źródłowy'
    end

    f.has_many :image_posts, :heading => 'Obrazki' do |app_f|
      app_f.input :image, as: :file, :hint => app_f.template.image_tag(app_f.object.image_url)
      app_f.input :basename, label: 'Nazwa'
    end

    f.has_many :comment_posts, :heading => 'Komentarze' do |app_f|
      app_f.input :name, label: 'Nazwa'
      app_f.input :url, label: 'URL'
      app_f.input :email, label: 'E-Mail'
      app_f.input :content, label: 'Treść'
      app_f.input :blocked, label: 'Zablokowany?'
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