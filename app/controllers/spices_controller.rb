class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :exception_response

    # GET /spices
    def index
        render json: Spice.all 
    end

    # POST /spices
    def create
        render json: Spice.create(spice_params), status: :created
    end

    # PATCH /spices/:id
    def update 
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    # DELETE /spices/:id
    def destroy
        spice = find_spice
        spice.destroy
        render json: {}
    end

    private

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def exception_response
        render json: { error: 'Spice not found' }, status: :not_found
    end

end
