class Web::JoinController < Web::ApplicationController
  before_filter :authenticate_user!, only: [ :new, :create ]

  def new
    @questionary = Member.new
    @questionary_form = MemberForm.new @questionary
  end

  def create
    @questionary = Member.new
    @questionary_form = MemberForm.new @questionary
    @questionary_form.submit params[:questionary]
    if @questionary_form.save
      redirect_to root_path
    else
      render action: :new
    end
  end
end