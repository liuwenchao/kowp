$ = require 'jquery'
ko = require 'knockout'
parameters = require 'parameters'

params = {}
for param in decodeURIComponent(location.search).substr(1).split('&')
  params[param.split('=')[0]] = param.split('=')[1]

Model =
  q: ko.observable(params.q)
  isqihuo: ko.observable(params.isqihuo || 0)
  pinming: ko.observable(params.pinming)
  paihao:  ko.observable(params.paihao)
  company: ko.observable(params.company)
  cangku:  ko.observable(params.cangku)
  company_id: ko.observable(params.company_id)

Model.to_string = ->
    query = ['!ifhide']
    query.push '(variety.cate_name:'+Model.q()+' OR paihao:'+Model.q()+')' if Model.q()
    query.push 'isqihuo:'+Model.isqihuo()           if Model.isqihuo()
    query.push 'pinming_one:'+Model.pinming()       if Model.pinming()
    query.push 'paihao:'+Model.paihao()             if Model.paihao()
    query.push 'member_info:'+Model.paihao()        if Model.company()
    query.push 'jiaoge_address:'+Model.cangku()     if Model.cangku()
    query.push 'member.company_id:'+Model.company_id()   if Model.company_id()
    query.join(' AND ')

module.exports = Model