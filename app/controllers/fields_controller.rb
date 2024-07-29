# frozen_string_literal: true

class FieldsController < ApplicationController
  def new
    @field = Field.new
  end

  def index
    @fields = Field.all
  end

  def show
    @field = Field.find(params.require(:id))
  end

  def create; end

  def edit
    @field = Field.find(params.require(:id))
  end

  def update; end

  def destroy
    Field.find(params.require(:id)).delete
    redirect_to fields_path
  end
end
