module Api
  module V1
    class ShoesController < ApplicationController

      def index
        render json: Shoe.all
      end

  
    def create
     shoe = Shoe.new(name:'Houndstooth', designer:'Sophia Webster')
     if shoe.save
      render json: shoe, status: :created
     else
      render json: shoe.errors, status: :unprocessable_entity
    end
  end

    def destroy
      Shoe.find(params[:id]).destroy!
      head :no_content
    end

    private

      def shoe_params
        params.require(:shoe).permit(:name, :designer)
      end


  end 

end
end

     
 





