class HomeController < ApplicationController
  def index
	@posts = Post.all
  @user = AdminUser.all
  end
end
