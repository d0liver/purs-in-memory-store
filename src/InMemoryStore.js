// Generated by CoffeeScript 2.5.1
var _;

_ = require("lodash");

exports._get = function(key) {
  return function() {
    var ref, ref1;
    return (ref = (ref1 = exports._set.store) != null ? ref1[key] : void 0) != null ? ref : null;
  };
};

exports._set = function(key) {
  return function(val) {
    return function() {
      if (exports._set.store == null) {
        exports._set.store = {};
      }
      return exports._set.store[key] = val;
    };
  };
};

exports.release = function(key) {
  return function() {
    return delete exports._set.store[key];
  };
};

exports.exists = function(key) {
  return function() {
    var ref;
    return key in ((ref = exports._set.store) != null ? ref : {});
  };
};
