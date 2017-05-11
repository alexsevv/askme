module UsersHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def user_name(user)
    if user.name.present?
      user.name
    else
      content_tag 'span', '', class: "fa fa-user-secret", title: "не указано имя"
    end
  end
end
