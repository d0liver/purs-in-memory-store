_ = require "lodash"

exports._get = (key) -> ->
	exports._set.store?[key] ? null

exports._set = (key) -> (val) -> ->
	unless exports._set.store?
		exports._set.store = {}

	exports._set.store[key] = val

exports.release = (key) -> -> delete exports._set.store[key]
exports.exists = (key) -> -> key of exports._set.store
