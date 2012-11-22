class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
# ez hozza van kapcsolodva a route-okhoz pl show user route az 1 GET keres egy szimbolummal az ":id"-val ami itt is megjelenik
# a params tomb meg az a kollekcio ami mindig elerunk
		@user = User.find(params[:id])
  end

	def create
# az urlap parameterei a params tombbol kapjuk a feluletrol
		@user = User.new(params[:user])
    if @user.save
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
		else
			render 'new'
		end
  end
end
