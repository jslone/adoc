'use strict';

var adoc = require('../lib/adoc.js');

/*
  ======== A Handy Little Nodeunit Reference ========
  https://github.com/caolan/nodeunit

  Test methods:
    test.expect(numAssertions)
    test.done()
  Test assertions:
    test.ok(value, [message])
    test.equal(actual, expected, [message])
    test.notEqual(actual, expected, [message])
    test.deepEqual(actual, expected, [message])
    test.notDeepEqual(actual, expected, [message])
    test.strictEqual(actual, expected, [message])
    test.notStrictEqual(actual, expected, [message])
    test.throws(block, [error], [message])
    test.doesNotThrow(block, [error], [message])
    test.ifError(value)
*/


exports = {
  parseText: function(test) {
    test.expect(1);
    var doc =
      '/*\n' +
      ' * myName\n' +
      ' *\n' +
      ' * this is my desc\n' +
      ' * @attr1 key1\n' +
      ' * @attr2 key2 and 2\n' +
      ' * @attr3 key3\n' +
      ' * and 3\n' +
      ' */';

    console.log(adoc.parseText(doc));
  }
};
