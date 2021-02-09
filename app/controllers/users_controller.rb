class UsersController < ApplicationController
before_action :find_user, only: [:show]
before_action :find_current_user, only: [:edit, :update] 

def index
    @user = User.all
  end

def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user = current_user
    @user.save
    redirect_to user_path(@user)
  end

  def show
end

def edit
end


def update
 if @user.update_attributes(user_params)
    puts "well done"
 else
    puts "Try Again"
 end
 redirect_to user_path(@user)
end

private

def user_params
    params.require(:user).permit(:name, :username, :description)
  end

def find_user
    @user = User.find(params[:id])
end

def find_current_user
    @user = current_user
end
end