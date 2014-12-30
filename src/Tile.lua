--[[
This code falls under the terms of the MIT license.
The full license can be found in "license.txt".

Copyright (c) 2013-2014 Minh Ngo
]]

local MODULE_PATH  = (...):match('^.+[%.\\/]')
local Class        = require(MODULE_PATH .. 'Class')

local draw = love.graphics.drawq or love.graphics.draw

-- -= Tile =-

-- Setup
local Tile = Class 'Tile' {}

-- Creates a new tile and returns it.
function Tile:init(tileset,id,quadOrImage,properties,terrain)
	self.tileset = tileset
	self.id      = id
	self.quad    = quadOrImage:typeOf('Quad') and quadOrImage
	self.image   = quadOrImage:typeOf('Image') and quadOrImage
	
	-- optional
	self.properties = properties or {}
	self.terrain    = terrain
end

-- Draws the tile at the given location 
function Tile:draw(...)
	if self.image then love.graphics.draw(self.image,...) return end
	draw(self.tileset.image,self.quad,...)
end

-- Return the Tile class
return Tile