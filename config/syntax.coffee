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
  fromText: (text,cb) ->
    cb text

class CSyntax extends Syntax
  sanitize: (str) ->
    console.log 'unsanitized:\n' + str
    noNoise = str.replace (new RegExp '^\\s*' + (escape @alphabet.comment.noise), 'gm'), ''
    console.log 'no noise:\n' + noNoise
    normWhite = noNoise.replace /\s+/, ' '
    console.log 'norm whitespace:\n' + normWhite
    normWhite

  fromText: (args,cb) ->
    regexp = new RegExp escape(@alphabet.comment.start) + '(.|[\\r\\n])*?' + escape(@alphabet.comment.end), 'g'
    args.blocks = args.text.match regexp
    @fromBlocks args,cb

  fromBlocks: (args,cb) ->
    regexp = new RegExp (
      escape(@alphabet.comment.start) +
      '[' + @alphabet.comment.noise + '\\s\\r\\n]*' +
      '(\\w*)' +
      '[' + @alphabet.comment.noise + '\\s\\r\\n]*' +
      '([^' + @alphabet.attr.sign + ']*)' +
      '([^]*)' +
      escape(@alphabet.comment.end))

    if not args.parent?
      [junk,name,desc,attrBlob] = args.blocks[0].match regexp
      attrs = @attrsFromBlob attrBlob
      attrs.name = @sanitize name
      if desc
        attrs.description = @sanitize desc
      args.parent = attrs
      args.blocks.shift()

    for block in args.blocks
      [junk,name,desc,attrBlob] = block.match regexp
      attrs = @attrsFromBlob attrBlob
      if desc
        attrs.description = @sanitize desc
      args.parent[@sanitize name] = attrs
    cb args.parent


  attrsFromBlob: (attrBlob) ->
    alphabet = @alphabet
    attrPairs = attrBlob.match new RegExp @alphabet.attr.sign + '[^' + @alphabet.attr.sign + ']*', 'g'
    attrArray = attrPairs?.map (attr) ->
      attr.match new RegExp alphabet.attr.sign + '(\\w*)' + '([^' + alphabet.attr.sign + '*])'
    attrObj = {}
    for attr in attrArray?
      attrObj[@sanitize attr[0]] = @sanitize attr[1]
    attrObj

module.exports =
  Syntax: Syntax
  CSyntax: CSyntax
