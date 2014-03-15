###
  adoc
  https://github.com/jslone/adoc

  all library functions for adoc parser

  Copyright (c) 2014 Jacob M. Slone
  Licensed under the MIT license.
###

'use strict';

syntaxConfig = require '../config/syntax.js'
alphabetConfig = require '../config/alphabet.js'

parseSyntax = (syntax) ->
  syntax

parseText = (text,syntax,alphabet) ->
  if not syntax?
    syntax = syntaxConfig.default
  if not alphabet?
    alphabet = alphabetConfig.styles.c
  #use syntax api, must finish first

module.exports =
  parseText: parseText
  syntax: syntaxConfig
  alphabet: alphabetConfig
