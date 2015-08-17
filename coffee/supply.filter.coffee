$ = require 'jquery'
ko = require 'knockout'
parameters = require 'parameters'

params = {}
for param in decodeURIComponent(location.search).substr(1).split('&')
  params[param.split('=')[0]] = param.split('=')[1]

Model =
  q: ko.observable(params.q)
  isqihuo: ko.observable(params.isqihuo || 0)
  ifsale:  ko.observable(params.ifsale  || 0)
  pinming: ko.observable(params.pinming)
  paihao:  ko.observable(params.paihao)
  company: ko.observable(params.company)
  cangku:  ko.observable(params.cangku)
  hf_value:  ko.observable(params.hf_value)
  lf_value:  ko.observable(params.lf_value)
  qsf_value:  ko.observable(params.qsf_value)
  dwfrl_u10_value:  ko.observable(params.dwfrl_u10_value)
  company_id: ko.observable(params.company_id)

Model.to_string = ->
    query = ['!ifhide', 'status:1', '!ifhide']
    zhibiao = 'OR dwfrl_u10_value:'+Model.q() if parseInt(Model.q()) > 0
    q = [
      '('
      'variety.cate_name:"'+Model.q()+'"'
      'OR jg_address_info:"'+Model.q()+'"'
      zhibiao
      ')'
    ]
    query.push q.join ' '                           if Model.q()
    query.push 'isqihuo:'+Model.isqihuo()           if Model.isqihuo()
    query.push 'is_sale:true'                       if Model.ifsale()
    query.push 'pinming_one:'+Model.pinming()       if Model.pinming()
    query.push 'paihao:'+Model.paihao()             if Model.paihao()
    query.push 'hf_value:'+Model.hf_value()         if Model.hf_value()
    query.push 'qlf_ar:'+Model.lf_value()           if Model.lf_value()
    query.push 'qsf:'+Model.qsf_value()             if Model.qsf_value()
    query.push 'dwfrl_ar:'+Model.dwfrl_ar()         if Model.dwfrl_u10_value()
    query.push 'member_info:'+Model.paihao()        if Model.company()
    query.push 'jg_address_info:'+Model.cangku()     if Model.cangku()
    query.push 'member.company_id:'+Model.company_id()   if Model.company_id()
    query.join(' AND ')

module.exports = Model
