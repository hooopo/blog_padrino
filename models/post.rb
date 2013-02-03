# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  def rich_body
    Blog.markdown_parser.call(self.body)[:output].to_s.html_safe
  end
end
