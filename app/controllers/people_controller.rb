class PeopleController < ApplicationController
  before_action :set_person, only: [:show], except: [:assign_partners]
  before_filter :restrict_profile_access, only: [:show]

  # GET /people/1
  # GET /people/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def assign_partners
    respond_to do |format|
      format.js {
        if OPEN_PROFILE_TIME <= Time.now().to_i*1000
          Person.secret_santa
          render :xml => Person.all
        else
          flash[:notice] = "Don't be a jerk Dennis. I know it's you..."
          redirect_to :root
        end
      }
      format.html {
        flash[:notice] = "Don't be a jerk Dennis. I know it's you..."
        redirect_to :root
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name)
    end

    def restrict_profile_access
      if current_person != @person
        flash[:error] = "I don't think so #{current_person.first_name}. You can't look at someone else's page."
        redirect_to :root
        return
      end
      if OPEN_PROFILE_TIME > Time.now().to_i*1000
        flash[:error] = "It's not time yet #{current_person.first_name}. I worked my butt off. You can wait :D"
        redirect_to :root
        return
      end
    end
end
