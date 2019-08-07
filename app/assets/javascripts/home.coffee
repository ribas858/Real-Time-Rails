# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


document.addEventListener 'DOMContentLoaded', ->
  M.AutoInit()
  elem = document.querySelector('.dropdown-trigger')
  instance = M.Dropdown.init(elem, {
    closeOnClick: false,
    coverTrigger: false,
    constrainWidth: false,
    alignment: 'right',
  })
  return