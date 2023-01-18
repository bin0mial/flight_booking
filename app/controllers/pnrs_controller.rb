class PnrsController < ApplicationController
  before_action :set_pnr, only: %i[ show ]


  # GET /pnrs/1 or /pnrs/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pnr
      @pnr = Pnr.find(params[:id])
    end
end
