class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[ show edit update destroy ]
  
  def index
    @items = current_user.items.order(created_at: :desc)
    @items = @items.where(item_type: params[:item_type]) if params[:item_type].present?
    @items = @items.where(status: params[:status]) if params[:status].present?
  end

  def show
  end

  def new
    @item = current_user.items.build
    @item.collection_id = params[:collection_id] if params[:collection_id].present?
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      redirect_to @item, notice: 'Item criado com sucesso.'
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item deletado com sucesso.'
  end

  private

  def set_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :item_type, :status, :rating, :author, :publisher, :year, :purchase_link, :review, :cover_url, :collection_id)
  end
end
