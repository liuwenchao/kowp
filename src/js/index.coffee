$ = require 'jquery'
ko = require 'knockout'

account =
  isLoggedin: ko.observable(false)
  name: ko.observable()
  logout: ->
    document.cookie = "PHPSESSID=; expires=Thu, 01 Jan 1970 00:00:01 GMT; domain=.zhaomw.cn; path=/"
    location.reload()

$.ajax
  type: 'GET'
  xhrFields:
    withCredentials: true
  url: 'http://test.account.zhaomw.cn/?_format=json'
  success: (data) ->
      account.name data.truename || data.username || data.mobile
      account.isLoggedin true

ko.applyBindings account
