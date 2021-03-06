# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require 'jquery-1.8.3.min'
#= require 'jquery-ui-1.10.3.custom.min'
#= require 'jquery.ui.touch-punch.min'
#= require 'bootstrap.min'
#= require 'bootstrap-select'
#= require 'bootstrap-switch'
#= require 'flatui-checkbox'
#= require 'flatui-radio'
#= require 'jquery.tagsinput'
#= require 'jquery.placeholder'
#= require 'jquery.stacktable'
#= require 'jquery-minicount'
#= require 'custom'
#= require_self


$ ->
  $("select").selectpicker({style: 'btn btn-inverse', menuStyle: 'dropdown-inverse'})
  $('#translation_source').miniCount({
    countdown: true,
    max: 140
  })

