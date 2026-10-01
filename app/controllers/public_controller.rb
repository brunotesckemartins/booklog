class PublicController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def show
    @item = Item.find_by!(public_token: params[:token])
  end
end