# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    render json: Posts::List.call
  end
end
