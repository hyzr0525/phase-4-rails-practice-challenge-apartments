class TenantsController < ApplicationController
    def index
        tenants = Tenant.all
        render json: tenants
      end
    
      def show
        tenants = Tenant.find(params[:id])
        render json: tenants
    end

    def create
        tenant = Tenant.new(tenant_params)
        if tenant.save
          render json: tenant, status: :created
        else
          render json: tenant.errors, status: :unprocessable_entity
        end
    end

    def update
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.update(tenant_params)
            render json: tenant, status: :accepted
        else
            render json: {error: "Tenant not found"}, stautus: :not_found
        end
    end

    def destroy
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.destroy
            head :no_content
        else
            render json: {error: "apartments not found"}
        end
    end

        private

    def tenant_params
      params.permit(:name, :age)
    end
end
