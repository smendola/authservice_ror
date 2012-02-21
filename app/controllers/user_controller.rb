######################################################
#
# REST implementation
# TODO: in process of rewrite to call into AuthService
#
######################################################

require "auth_service"

class UserController < ApplicationController

  respond_to :json, :xml

  def initialize
    @svc = AuthService.new
  end

  #############################################################
  # Issue a valid JSON response
  # - Invoke the given code block
  # - If success, render its result as JSON
  # - If any error, render an error JSON instead
  #############################################################
  def respond
    begin
      respond_to do |format|
        format.xml { render :xml => yield() }
        format.json { render :json => yield() }
      end
    rescue Exception => ex
      render :json => { 
        :id => @request_id, 
        :error => {
          :backtrace => ex.backtrace, 
          :message => ex.message
        } 
      }
    end
  end

  def index
    respond { @svc.ListUsers }
  end

  def create
    respond {
      params_body = JSON.parse(request.raw_post)

      userinfo = params_body["user"]
      @svc.AddUser(userinfo)
    }
  end

  def update
    respond {
      params_body = JSON.parse(request.raw_post)
      userinfo = params_body["user"]
      @svc.UpdateUser(userinfo)
    }
  end

  def show
    respond { @svc.GetUser params[:id] }
  end
  
  def destroy
    respond { @svc.DeleteUser(params[:id]) }
  end

end
