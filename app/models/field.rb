# frozen_string_literal: true

class Field < ApplicationRecord
  before_save :calculate_area

  def geojson_shape
    RGeo::GeoJSON.encode(shape)
  end

  private

  def calculate_area
    return unless shape.present?

    geographic_factory = RGeo::Geographic.spherical_factory(srid: 4326)
    projected_factory = RGeo::Geographic.projected_factory(
      projection_proj4: '+proj=utm +zone=15 +datum=WGS84 +units=m +no_defs',
      projection_srid: 26_915,
      geographic_srid: 4326
    )
    geometry = geographic_factory.multi_polygon(shape)
    if geometry.valid?
      projected_geometry = RGeo::Feature.cast(geometry, factory: projected_factory, project: true)
      self.area = projected_geometry.area
    else
      errors.add(:shape, 'Invalid geometry')
    end
  end
end
