$ = require 'jquery'
ko = require 'knockout'
parameters = require 'parameters'

Model = ->
  id: ko.observable()
  pingming: ko.observable()
  price: ko.observable()
  weight: ko.observable()
  rezhi: ko.observable()
  isqihuo: ko.observable()
  address: ko.observable()
  addtime: ko.observable(new Date())
  company_name: ko.observable()
  member_name: ko.observable()
  member_title: ko.observable()
  telephone: ko.observable()
  zhibiao_more: ko.observable()
  qsf_value: ko.observable()
  dwfrl_cell: ko.observable()
  dwfrl_u10_value: ko.observable()
  dwfrl_u20_value: ko.observable()
  dwfrl_unit: ko.observable()
  fyhqd_cell: ko.observable()
  fyhqd_unit: ko.observable()
  fyhqd_value: ko.observable()
  ganguo_cell: ko.observable()
  ganguo_unit: ko.observable()
  ganguo_value: ko.observable()
  gdt_cell: ko.observable()
  gdt_unit: ko.observable()
  gdt_value: ko.observable()
  gwfrl_cell: ko.observable()
  gwfrl_u10_value: ko.observable()
  gwfrl_u20_value: ko.observable()
  gwfrl_unit: ko.observable()
  hf_cell: ko.observable()
  hf_unit: ko.observable()
  hf_value: ko.observable()
  hff_cell: ko.observable()
  hff_unit: ko.observable()
  hff_value: ko.observable()
  hits: ko.observable()
  hrd_cell: ko.observable()
  hrd_unit: ko.observable()
  hrd_value: ko.observable()
  hskmzs_cell: ko.observable()
  hskmzs_unit: ko.observable()
  hskmzs_value: ko.observable()
  jiaoge_address: ko.observable()
  jiaoge_date: ko.observable()
  jiaoge_weight: ko.observable()
  jsldd_cell: ko.observable()
  jsldd_unit: ko.observable()
  jsldd_value: ko.observable()
  jtfyx_cell: ko.observable()
  jtfyx_unit: ko.observable()
  jtfyx_value: ko.observable()
  jzchd_cell: ko.observable()
  jzchd_unit: ko.observable()
  jzchd_value: ko.observable()
  jztz_cell: ko.observable()
  jztz_unit: ko.observable()
  jztz_value: ko.observable()
  ksqd_cell: ko.observable()
  ksqd_unit: ko.observable()
  ksqd_value: ko.observable()
  lidu_cell: ko.observable()
  lidu_unit: ko.observable()
  lidu_value_max: ko.observable()
  lidu_value_min: ko.observable()
  linfen_cell: ko.observable()
  linfen_unit: ko.observable()
  linfen_value: ko.observable()
  njzs_cell: ko.observable()
  njzs_unit: ko.observable()
  njzs_value: ko.observable()
  nmqd_cell: ko.observable()
  nmqd_unit: ko.observable()
  nmqd_value: ko.observable()
  ns_cell: ko.observable()
  ns_unit: ko.observable()
  ns_value: ko.observable()
  operate_staff_id: ko.observable()
  pay_address_one: ko.observable()
  pay_address_three: ko.observable()
  pay_address_two: ko.observable()
  pay_price: ko.observable()
  pay_type: ko.observable()
  pinming_one: ko.observable()
  pinming_two: ko.observable()
  qlf_cell: ko.observable()
  qlf_unit: ko.observable()
  qlf_value: ko.observable()
  qsf_cell: ko.observable()
  qsf_unit: ko.observable()
  qsf_value: ko.observable()
  order: order
  send:  send

fill = (data, model) ->
  model = new Model() if not model
  model.id  data.supply_id
  model.pingming data.variety[0]?.cate_name
  model.price data.pay_price
  model.weight data.jiaoge_weight
  model.rezhi data.dwfrl_u10_value
  model.isqihuo data.isqihuo
  model.address data.jiaoge_address || ''
  model.addtime new Date data.add_time*1000
  model.company_name data.member?.company?.company_name || ''
  model.member_name data.member?.truename
  model.member_title data.member?.job
  model.telephone data.member?.telephone
  model.zhibiao_more data.zhibiao_more
  model.dwfrl_cell data.dwfrl_cell
  model.dwfrl_u10_value data.dwfrl_u10_value
  model.dwfrl_u20_value data.dwfrl_u20_value
  model.dwfrl_unit data.dwfrl_unit
  model.fyhqd_cell data.fyhqd_cell
  model.fyhqd_unit data.fyhqd_unit
  model.fyhqd_value data.fyhqd_value
  model.ganguo_cell data.ganguo_cell
  model.ganguo_unit data.ganguo_unit
  model.ganguo_value data.ganguo_value
  model.gdt_cell data.gdt_cell
  model.gdt_unit data.gdt_unit
  model.gdt_value data.gdt_value
  model.gwfrl_cell data.gwfrl_cell
  model.gwfrl_u10_value data.gwfrl_u10_value
  model.gwfrl_u20_value data.gwfrl_u20_value
  model.gwfrl_unit data.gwfrl_unit
  model.hf_cell data.hf_cell
  model.hf_unit data.hf_unit
  model.hf_value data.hf_value
  model.hff_cell data.hff_cell
  model.hff_unit data.hff_unit
  model.hff_value data.hff_value
  model.hits data.hits
  model.hrd_cell data.hrd_cell
  model.hrd_unit data.hrd_unit
  model.hrd_value data.hrd_value
  model.hskmzs_cell data.hskmzs_cell
  model.hskmzs_unit data.hskmzs_unit
  model.hskmzs_value data.hskmzs_value
  model.jiaoge_address data.jiaoge_address
  model.jiaoge_date data.jiaoge_date
  model.jiaoge_weight data.jiaoge_weight
  model.jsldd_cell data.jsldd_cell
  model.jsldd_unit data.jsldd_unit
  model.jsldd_value data.jsldd_value
  model.jtfyx_cell data.jtfyx_cell
  model.jtfyx_unit data.jtfyx_unit
  model.jtfyx_value data.jtfyx_value
  model.jzchd_cell data.jzchd_cell
  model.jzchd_unit data.jzchd_unit
  model.jzchd_value data.jzchd_value
  model.jztz_cell data.jztz_cell
  model.jztz_unit data.jztz_unit
  model.jztz_value data.jztz_value
  model.ksqd_cell data.ksqd_cell
  model.ksqd_unit data.ksqd_unit
  model.ksqd_value data.ksqd_value
  model.lidu_cell data.lidu_cell
  model.lidu_unit data.lidu_unit
  model.lidu_value_max data.lidu_value_max
  model.lidu_value_min data.lidu_value_min
  model.linfen_cell data.linfen_cell
  model.linfen_unit data.linfen_unit
  model.linfen_value data.linfen_value
  model.njzs_cell data.njzs_cell
  model.njzs_unit data.njzs_unit
  model.njzs_value data.njzs_value
  model.nmqd_cell data.nmqd_cell
  model.nmqd_unit data.nmqd_unit
  model.nmqd_value data.nmqd_value
  model.ns_cell data.ns_cell
  model.ns_unit data.ns_unit
  model.ns_value data.ns_value
  model.operate_staff_id data.operate_staff_id
  model.pay_address_one data.pay_address_one
  model.pay_address_three data.pay_address_three
  model.pay_address_two data.pay_address_two
  model.pay_price data.pay_price
  model.pay_type data.pay_type
  model.pinming_one data.pinming_one
  model.pinming_two data.pinming_two
  model.qlf_cell data.qlf_cell
  model.qlf_unit data.qlf_unit
  model.qlf_value data.qlf_value
  model.qsf_cell data.qsf_cell
  model.qsf_unit data.qsf_unit
  model.qsf_value data.qsf_value
  model

result =
  q: ko.observable()
  size: 10
  more: ko.observable(false)
  from: ko.observable(0)
  rows: ko.observableArray()
  sort: ko.observable()
  total: ko.observable(0)
  filter: ko.observableArray(['!ifhide'])
  currentPage: ko.pureComputed -> (Math.ceil result.from()/result.size)+1
  pageCount:   ko.pureComputed -> Math.ceil result.total()/result.size
  pageUp    : -> result.from if result.from() == 0 then 0 else (result.currentPage()-2)*result.size
  pageDown  : -> result.from result.currentPage()*result.size
  pageFirst : -> result.from 0
  pageLast  : -> result.from (result.pageCount()-1)*result.size
  isFirstPage : ko.pureComputed -> result.from() <= 0
  isLastPage  : ko.pureComputed -> result.from() + result.size >= result.total()

create = (form)->
  $.ajax
    type: 'post'
    xhrFields:
      withCredentials: true
    url: parameters.api.host+'/supplies'
    data: JSON.stringify
      pinming_one: form.pinming_one.value
      pay_type: form.pay_type.value
      pay_address_one: form.pay_address_one.value
      pay_address_two: form.pay_address_two.value
      pay_price: form.pay_price.value
      pay_weight: form.pay_weight.value
    contentType: 'application/json'
    success: -> window.alert '发布成功'
    # window.location.href='index.html'

order = (id) ->
send  = (id) ->

load = (id) ->
  record = new Model()
  if id
    $.get parameters.search.host + '/supply/' + id, (data) ->
      fill data._source, record
  return record

list = ->
  q = result.q()
  $.get parameters.search.host + '/supply/_search',
    q: if q then '(variety.cate_name:'+q+' OR paihao:'+q+') AND !ifhide' else '!ifhide'
    from: result.from()
    sort: result.sort()
    size: result.size
  , (data) ->
    result.total data.hits.total
    result.rows.removeAll()# if result.from() == 0
    result.more result.from()+result.size
    for record in data.hits.hits
      result.rows.push fill record._source

listMine = (from = 0, filter)->
  $.ajax
    type: 'get'
    xhrFields:
      withCredentials: true
    url: parameters.api.host + '/supplies'
    data:
      start: from
      limit: result.size
    success: (data) ->
      result.rows.removeAll() if from == 0
      result.more from+result.size
      for record in data
        result.rows.push fill record


# conduct search when sort or from is changed
result.sort.subscribe ->
  result.from 0
  list()
result.from.subscribe -> list()
module.exports =
  result:  result
  create:  create
  list:    list
  load:    load
  listMine: listMine
