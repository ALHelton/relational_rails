# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

palette_1 = Palette.create(name: "Professional Gouache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false)
palette_2 = Palette.create(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true)

Paint.create(paint_name: "Perylene Black", medium: "Gouache", series: 3, opaque: true, palette_id: palette_1.id)
Paint.create(paint_name: "Opera Rose", medium: "Gouache", series: 2, opaque: true, palette_id: palette_1.id)
Paint.create(paint_name: "Flame Red", medium: "Gouache", series: 1, opaque: true, palette_id: palette_1.id)
Paint.create(paint_name: "Orange Lake Deep", medium: "Gouache", series: 1, opaque: true, palette_id: palette_1.id)
Paint.create(paint_name: "Quinacridone Magenta", medium: "Gouache", series: 3, opaque: true, palette_id: palette_1.id)
Paint.create(paint_name: "Spectrum Violet", medium: "Gouache", series: 1, opaque: true, palette_id: palette_1.id)
Paint.create(paint_name: "Perylene Maroon", medium: "Gouache", series: 2, opaque: false, palette_id: palette_1.id)
Paint.create(paint_name: "Oxide of Chromium", medium: "Gouache", series: 2, opaque: false, palette_id: palette_1.id)
Paint.create(paint_name: "Indanthrene Blue", medium: "Watercolor", series: 3, opaque: false, palette_id: palette_2.id)
Paint.create(paint_name: "Burnt Sienna", medium: "Watercolor", series: 1, opaque: false, palette_id: palette_2.id)
Paint.create(paint_name: "Payne's Gray", medium: "Watercolor", series: 1, opaque: true, palette_id: palette_2.id)
Paint.create(paint_name: "Cadmium-Free Red", medium: "Watercolor", series: 4, opaque: true, palette_id: palette_2.id)
Paint.create(paint_name: "Permanent Sap Green", medium: "Watercolor", series: 1, opaque: false, palette_id: palette_2.id)
Paint.create(paint_name: "Permanent Magenta", medium: "Watercolor", series: 3, opaque: false, palette_id: palette_2.id)
Paint.create(paint_name: "Cerulean Blue", medium: "Watercolor", series: 3, opaque: true, palette_id: palette_2.id)
Paint.create(paint_name: "Yellow Ochre", medium: "Watercolor", series: 1, opaque: true, palette_id: palette_2.id)
Paint.create(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: false, palette_id: palette_2.id)
Paint.create(paint_name: "French Ultramarine", medium: "Watercolor", series: 2, opaque: false, palette_id: palette_2.id)
