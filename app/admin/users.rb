ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :username, :password_digest, :authorization_token
  #
  # or
  #
  # permit_params do
  #   permitted = [:username, :password_digest, :authorization_token]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :username

  show do
    # renders app/views/admin/posts/_some_partial.html.erb
    attributes_table do
      row :id
      row :username
    end
    active_admin_comments
  end

  index do
    selectable_column
    column :id do |thing|
      link_to "#{thing.id}", admin_admin_users_url
    end

    column :username
    column :created_at
    column :updated_at
  end

  csv do
    column :id
    column :username
    column :created_at
    column :updated_at
  end


end
