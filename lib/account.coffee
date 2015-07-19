$ = require 'jquery'
ko = require 'knockout'
parameters = require 'parameters'
address = require 'address'

profile =
  member_id: ko.observable()
  username: ko.observable()
  truename: ko.observable()
  mobile: ko.observable()
  purpose_company: ko.observable()
  telephone: ko.observable()
  fax: ko.observable()
  qq: ko.observable()
  email: ko.observable()
  purpose_company_type: ko.observable()
  area: ko.observable()
  city: ko.observable()
  city_name: ko.observable()
  address: ko.observable()
  isLoggedin: ko.observable(false)
  name: ko.pureComputed ->
    profile.truename() || profile.username() || profile.mobile()

fillProfile = (data)->
  profile.member_id data.memberId
  profile.username data.username
  profile.truename data.truename
  profile.mobile data.mobile
  profile.purpose_company data.purposeCompany
  profile.telephone data.telephone
  profile.fax data.fax
  profile.qq data.qq
  profile.email data.email
  profile.purpose_company_type data.purposeCompanyType
  profile.city data.cityName
  profile.city_name data.cityName
  profile.address data.address
  if data.cityName
    $.get parameters.search.host+'/city/_search?size=1&q=city_name:'+data.cityName, (found)->
      if found.hits.hits.length > 0
        address.area found.hits.hits[0]._source.parent_id

load = (callback, errorCallback)->
  $.ajax
    type: 'GET'
    xhrFields:
      withCredentials: true
    url: parameters.account.host+'/?_format=json'
    success: (data) ->
      fillProfile data
      profile.isLoggedin true
      callback() if callback
    error: ->
      errorCallback() if errorCallback

save = (form)->
  profile.city_name form.city_name.selectedOptions[0].text
  $.ajax
    type: 'PUT'
    xhrFields:
      withCredentials: true
    url: parameters.api.host+'/members/'+profile.member_id()
    data: JSON.stringify
      username: profile.username()
      truename: profile.truename()
      mobile: profile.mobile()
      purpose_company: profile.purpose_company()
      telephone: profile.telephone()
      fax: profile.fax()
      qq: profile.qq()
      email: profile.email()
      purpose_company_type: profile.purpose_company_type()
      city_name: profile.city_name()
      address: profile.address()
    contentType: 'application/json'
    success: -> window.alert '保存成功'
    error:   -> window.location.href='index.html'

login = (form) ->
  $.ajax
    type: 'post'
    xhrFields:
      withCredentials: true
    url: parameters.account.host+'/login'
    data:
      _username: form.username.value
      _password: form.password.value
      _format: 'json'
    success: -> window.location.href='/'
    error:   -> window.alert '用户名或者密码错误！'

logout = ->
  profile.isLoggedin false
  document.cookie = "PHPSESSID=; expires=Thu, 01 Jan 1970 00:00:01 GMT; domain=.zhaomw.cn; path=/"
  window.location.href = '/'

register = (form) ->
  if form.password.value == form.repasswd.value
    $.ajax
      type: 'post'
      xhrFields:
        withCredentials: true
      contentType: 'application/json'
      url: parameters.api.host+'/members.json'
      data: JSON.stringify
        username: form.username.value
        mobile:   form.mobile.value
        sms:      form.sms.value
        password: form.password.value
      success: -> window.location.href='register_ok.html'
      error: (error) ->
        switch error.status
          when 400 then window.alert '验证码错误或者已经过期！'
          when 409 then window.alert '手机号码已经注册，请直接登录或者找回密码！'
          when 500 then window.alert '注册失败，请联系我们！'
          else
            window.alert error.statusText
  else
    window.alert '两次密码不一样！'

verify = (mobile) ->
  if mobile and mobile.length == 11
    $.ajax
      type: 'post'
      xhrFields:
        withCredentials: true
      url: parameters.api.host+'/messages.json'
      data:
        mobile: mobile
        tpl: 'mcode'
      success: -> window.alert '验证码已经发送您的手机，请查收！'
      # success: (data) -> window.alert data.content
  else
    window.alert '请输入正确的手机号码！'

module.exports =
  profile: profile
  address: address
  load: load
  save: save
  login: login
  logout: logout
  register: register
  verify: verify