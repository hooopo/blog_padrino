# -*- encoding : utf-8 -*-
# Helper methods defined here can be accessed in any controller or view in the application

Blog.helpers do
  # def simple_helper_method
  #  ...
  # end
  def readable_date(time)
    time.strftime("%Y年%m月%d日")
  end
end
