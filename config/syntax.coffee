###
  syntax
  https://github.com/jslone/adoc

  configuration file for syntaxes

  Copyright (c) 2014 Jacob M. Slone
  Licensed under the MIT license.
###

escape = (str) ->
  str.replace /([.*+?^=!:${}()|\[\]\/\\])/g, "\\$&"

class Syntax
  constructor: (@alphabet) ->
  pre: (args,cb) ->
    @proc args,cb
  proc: (args,cb) ->
    @post args,cb
  post: (args,cb) ->
    cb args

class CSyntax extends Syntax
  pre: (args,cb) ->
    regexp = new RegExp escape(@alphabet.comment.start) + '(.|[\r\n])*?' + escape(@alphabet.comment.end), 'g'
    args.blocks = args.text.match regexp
    super args,cb
  proc: (args,cb) ->
    for block in args.blocks
      regexp = new RegExp ''

module.exports =
  Syntax: Syntax
  CSyntax: CSyntax
