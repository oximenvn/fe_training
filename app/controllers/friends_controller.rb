class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    Friend.create user_id: params[:user_id], friend_id: params[:friend_id]
    redirect_to user_path(id: params[:friend_id])
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    friend = Friend.find params[:id].to_i
    friend.update accepted: true
    redirect_to user_path(id: params[:friend_id])
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    friend = Friend.find params[:id].to_i
    friend.destroy
    redirect_to user_path(id: params[:friend_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params[:friend]
    end
end
