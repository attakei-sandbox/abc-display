# Exposed libraries to global
global.Promise   = require('bluebird')
global.React     = require('react/addons')
global.Arda      = require('arda')
global.Yama      = require('yama')
global.App ?= {}

App.packageJson = require('json!./package.json')
