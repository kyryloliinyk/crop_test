# frozen_string_literal: true

require 'rgeo'

factory = RGeo::Geographic.spherical_factory(srid: 4326)

polygon1 = factory.polygon(factory.linear_ring([
                                                 factory.point(-90.0, 30.0),
                                                 factory.point(-90.0, 35.0),
                                                 factory.point(-85.0, 35.0),
                                                 factory.point(-85.0, 30.0),
                                                 factory.point(-90.0, 30.0)
                                               ]))

polygon2 = factory.polygon(factory.linear_ring([
                                                 factory.point(-80.0, 25.0),
                                                 factory.point(-80.0, 30.0),
                                                 factory.point(-75.0, 30.0),
                                                 factory.point(-75.0, 25.0),
                                                 factory.point(-80.0, 25.0)
                                               ]))

shape = factory.multi_polygon([polygon1, polygon2])

Field.create!(name: 'Example Field', shape:, area: 500)
