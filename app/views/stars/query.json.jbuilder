json.array @items do |item|
  json.item do
    json.id item.id
    json.label item.label
    json.x item.x
    json.y item.y
    json.z item.z
    json.lum item.lum 
    json.colorb_v item.colorb_v
    json.absmag item.absmag
    json.appmag item.appmag
    json.texnum item.texnum
    json.distly item.distly
    json.dcalc item.dcalc
    json.plx item.plx
    json.plxerr item.plxerr
    json.vx item.vx
    json.vy item.vy
    json.vz item.vz
    json.speed item.speed
    json.hipnum item.hipnum
  end
end
json.results_count @items.count
