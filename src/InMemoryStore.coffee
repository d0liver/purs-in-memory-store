_ = require "lodash"

exports._get = (key) -> ->
	exports._set.store?[key] ? null

exports._set = (key) -> (val) -> ->
	unless exports._set.store?
		exports._set.store = {}

	exports._set.store[key] = val

exports._reserve = (key) -> -> exports._set.store?[key]?

exports.release = (key) -> -> delete exports._set.store[key]
