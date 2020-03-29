assert   = require "assert"
storeFfi = require "../../src/InMemoryStore"

describe "All Tests", ->
	describe "set keys", ->
		it "Should set keys", ->
			storeFfi._set("key")("val")()

		it "Should get keys", ->
			storeFfi._set("key")("val")()
			assert.equal storeFfi._get("key")(), "val"

		it "Should error release key values", ->
			storeFfi._set("key")("val")()
			storeFfi.release("key")()
			assert.equal storeFfi._get("key")(), null
