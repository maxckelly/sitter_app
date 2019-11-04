class PaymentController < ApplicationController
  def index

  end

  def new
    @payment = Payment.new
  end

  def create

    @payment = Payment.new(payment_params)
    @payment.user = current_user

    respond_to do |format|

      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def payment_params
    params.require(:payment).permit(:price)
  end
end