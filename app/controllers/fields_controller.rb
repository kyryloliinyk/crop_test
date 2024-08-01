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
    @geojson = @field.geojson_shape.to_json
  end

  def create
    field = Field.new(field_params)
    field.save
    redirect_to fields_path
  end

  def edit
    @field = Field.find(params.require(:id))
  end

  def update; end

  def destroy
    Field.find(params.require(:id)).delete
    redirect_to fields_path
  end

  private

  def field_params
    params.require(:field).permit(:name, :shape, :area)
  end
end
