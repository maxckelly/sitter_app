class PaymentsController < ApplicationController

  before_action :set_meeting, only: [ :new, :show, :edit, :update, :destroy, :create, :success ]
  before_action :set_payment, only: [ :show ]
  before_action :set_sitter, only: [ :show, :new, :edit, :update, :destroy, :create, :success  ]
  before_action :set_parent, only: [ :show, :success ]

  def index
    @payment = current_user.payment
  end

  def success 

  end

  def new
    id = params[:id]
    @sitter = current_user.sitter
    @meetings = current_user.meetings
    @payment = Payment.new
  end

  def create

    @payment = Payment.new(payment_params)

    respond_to do |format|

      if @payment.save
        meeting = Meeting.find(params[:meeting_id])
        meeting.payment_id = @payment.id
        meeting.save
        format.html { redirect_to payment_show_path(@payment), notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def webhook 
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)


    # This is getting the metadata that we have in listings_controller.rb and the show method.
    meeting_id = payment.metadata.meeting_id
    user_id = payment.metadata.user_id

    p "meeting id = " + meeting_id
    p "user id = " + user_id
    
    status 200
  end

  def show

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    customer_email: current_user.email,
    line_items: [{
      name: @meeting.name,
      # We're timesing by 100 because stripe works in cents and we want to display dollars
      amount: @payment.price * 100, 
      currency: 'aud',
      # Quantity is the amount you're buying if you're selling based on quantity.
      quantity: 1
    }],
    payment_intent_data: {
      metadata: {
        user_id: current_user.id,
        # The below grabs the listing ID so it relates to the listing
        meeting_id: @meeting.id
      }
    },
    # This directs the user if the payment is successful 
    success_url: "#{root_url}payments/success?user_id=#{current_user.id}&meeting_id=#{@meeting.id}",
    cancel_url: "#{root_url}meetings"
    )

    # This then sets the session above to an id.
    @session_id = session.id
  end

  private 

  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def set_user
    @current_user = User.find_by_user_id(params[:user_id])
  end


  def set_sitter
    @sitter = current_user.sitter
  end

  def set_parent
    @parent = current_user.parent
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def set_user_payment
    id = params[:id]
    @payment = Payment.find_by_user_id(current_user.id)
  end

  def payment_params
    params.permit(:price, :paid, :meeting_id)
  end
end