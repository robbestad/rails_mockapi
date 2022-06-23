class Api::V1::SlotsController < ApplicationController
    def index
      slots = Slot.all
      render json: slots, status: 200
    end
  
    def create
      slot = Slot.new(
        validator: slot_params[:validator],
        slot_height: slot_params[:slot_height],
        num_transactions: slot_params[:num_transactions],
        skipped: slot_params[:skipped],
        ts: slot_params[:ts],
        failrate: slot_params[:failrate],
        blockhash: slot_params[:blockhash],
        transactions: slot_params[:transactions],
      )
      if slot.save
        render json: slot, status: 200
      else
        render json: {error: "Error storing slot"}
      end
    end
  
    def show
      slot = slot.find_by(id: params[:id])
      if slot
        render json: slot, status:200
      else
        render json: {error: "No such slot"}
      end
    end
  end
  
  private 
    def slot_params
      params.require(:slot).permit([
        :validator,
        :slot_height,
        :num_transactions,
        :ts,
        :skipped,
        :failrate,
        :blockhash,
        :transactions
      ])
  end
  