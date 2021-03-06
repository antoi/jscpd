if process.env['COVERAGE']
  console.log 'COVERAGE mode is on'
  sourcePath = '../.tmp/'
else
  sourcePath = '../src/'

TokenizerFactory = require "#{sourcePath}tokenizer/TokenizerFactory"
TokenizerCodeMirror = require "#{sourcePath}tokenizer/TokenizerCodeMirror"
TokenizerCoffee = require "#{sourcePath}tokenizer/TokenizerCoffee"

expect = require('chai').expect
should = require('chai').should()

describe "TokenizerFactory", ->

  it "should return tokinezer for javascript if file with extension js", ->
    TokenizerFactory::makeTokenizer('file.js', ['javascript']).should.be.an.instanceOf TokenizerCodeMirror

  it "should return tokinezer for php if file with extension php", ->
    TokenizerFactory::makeTokenizer('file.php', ['php']).should.be.an.instanceOf TokenizerCodeMirror

  it "should return tokinezer for python if file with extension py", ->
    TokenizerFactory::makeTokenizer('file.py', ['python']).should.be.an.instanceOf TokenizerCodeMirror

  it "should return tokinezer for javascript if file with extension coffee", ->
    TokenizerFactory::makeTokenizer('file.coffee', ['coffeescript']).should.be.an.instanceOf TokenizerCoffee

  it "should return false if language is not supported ", ->
    TokenizerFactory::makeTokenizer('file.coffee', ['php']).should.be.equal false