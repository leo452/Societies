class RolsController < ApplicationController
    before_action :set_rol, only: [:edit, :update, :show, :destroy]
    before_action :require_admin
    
    
  def index
      @rols = Rol.paginate(page: params[:page], per_page: 5)
  
  end
  
  def new
       @rol = Rol.new
  end
   
   def create
        @rol = Rol.new(rol_params)
        @rol.user = current_user
            if @rol.save
                flash[:notice] = "El rol fue creado satisfactoriamente"
                redirect_to rol_path(@rol)
            else
                render 'new'  
            end
   end

    def show
   
    end
    
    def edit
   
    
    end
    
    def update
       
        if @rol.update(rol_params)
        flash[:notice] = "Article was successfully updated"
                redirect_to rol_path(@rol)
        else
            render 'edit'
        
        end
    end
    
    def destroy
   
    @rol.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to rols_path
    end

   
  
   
   private

   def set_rol
   @rol = Rol.find(params[:id])
   end
   
   
   
   def rol_params
   params.require(:rol).permit(:name, :description,permissions_ids: [])
   end
   
  def require_admin

    if !logged_in? || (logged_in? and !current_user.admin?)
        flash[:danger] = " Only admins can perform that action"
        redirect_to rols_path
    end
    
end
 
end