# frozen_string_literal: true

require 'rgeo'

Field.destroy_all

factory = RGeo::Geographic.spherical_factory(srid: 4326)

polygon1 = factory.polygon(factory.linear_ring([
                                                 factory.point(24.0, 48.0),
                                                 factory.point(24.0, 49.0),
                                                 factory.point(25.0, 50.0),
                                                 factory.point(26.0, 48.0),
                                                 factory.point(24.0, 48.0)
                                               ]))

polygon2 = factory.polygon(factory.linear_ring([
                                                 factory.point(26.5, 48.0),
                                                 factory.point(27.0, 49.0),
                                                 factory.point(27.5, 50.0),
                                                 factory.point(26.0, 50.0),
                                                 factory.point(26.5, 48.0)
                                               ]))

shape = factory.multi_polygon([polygon1, polygon2])

Field.create!(name: 'Example Field', shape:)
