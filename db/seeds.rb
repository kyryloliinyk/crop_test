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

polygon3 = factory.polygon(factory.linear_ring([
                                                 factory.point(30.5, 50.3),
                                                 factory.point(30.6, 50.4),
                                                 factory.point(30.7, 50.3),
                                                 factory.point(30.6, 50.2),
                                                 factory.point(30.5, 50.3)
                                               ]))

polygon4 = factory.polygon(factory.linear_ring([
                                                 factory.point(30.8, 50.3),
                                                 factory.point(30.9, 50.4),
                                                 factory.point(31.0, 50.3),
                                                 factory.point(30.9, 50.2),
                                                 factory.point(30.8, 50.3)
                                               ]))

ternopil_shape = factory.multi_polygon([polygon1, polygon2])
kyiv_shape = factory.multi_polygon([polygon3, polygon4])

Field.create!(name: 'Ternopil Field', shape: ternopil_shape)
Field.create!(name: 'Kyiv Field', shape: kyiv_shape)
