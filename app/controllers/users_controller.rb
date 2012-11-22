class UsersController < ApplicationController
  def new
  end

  def show
# ez hozza van kapcsolodva a route-okhoz pl show user route az 1 GET keres egy szimbolummal az ":id"-val ami itt is megjelenik
# a params tomb meg az a kollekcio ami mindig elerunk
	@user = User.find(params[:id])
  end
end
