module UsersHelper
  def gravatar_for user, option = {size: Settings.gravatar.size}
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = option[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
