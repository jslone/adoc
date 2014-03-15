#! /usr/bin/env node

'use strict';

var adoc = require('../lib/adoc.js');

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
