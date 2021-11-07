class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all
        render json: apartments
      end
    
      def show
        apartments = Apartment.find(params[:id])
        render json: apartments
    end

    def create
        apartments = Apartment.new(apt_params)
        if apartments.save
          render json: apartments, status: :created
        else
          render json: apartments.errors, status: :unprocessable_entity
        end
    end

    def update
      apartment = Apartment.find_by(id: params[:id])
      if apartment
          apartment.update(apt_params)
          render json: apartment, status: :accepted
      else
          render json: {error: "Apartment not found"}, stautus: :not_found
      end
  end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: {error: "apartments not found"}
        end
    end

        private

    def apt_params
      params.permit(:number)
    end

end
