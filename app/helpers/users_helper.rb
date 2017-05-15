module UsersHelper
  def user_avatar(user)
    user.avatar_url.present? ? user.avatar_url : asset_path('avatar.jpg')
  end

  def user_name(user)
    user.name.present? ? user.name :
      content_tag('span', '', class: "fa fa-user-secret", title: "не указано имя")
  end
end
