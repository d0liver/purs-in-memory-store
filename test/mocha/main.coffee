assert   = require "assert"
storeFfi = require "../../src/InMemoryStore"

set = (key, val) -> storeFfi._set(key)(val)()
get = (key) -> storeFfi._get(key)()
exists = (key) -> storeFfi.exists(key)()
release = (key) -> storeFfi.release(key)()

describe "InMemoryStore FFI Tests", ->
	# Clear the store before running each test
	beforeEach -> storeFfi._set.store = null

	it "Should release key values", ->
		set "key", "val"
		release "key"
		assert.equal (get "key"), null

	it "Should set keys", ->
		set "key", "val"

	it "Should get keys", ->
		set "key", "val"
		assert.equal (get "key"), "val"

	it "Should determine whether keys exist", ->
		set "key", "val"
		assert.equal (exists "key"), true
		assert.equal (exists "foo"), false

	it "Should always return false for existence checks when the store is null", ->
		assert.equal (exists "flam"), false
