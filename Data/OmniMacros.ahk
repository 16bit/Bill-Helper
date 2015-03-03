!M::
SLEEP 500
IF(get("Shipper") = 1051382)
	048L()
IF(get("Shipper") = 0639678)
	048IEWC()
IF(get("Shipper") = 0994681)
	048Esab()
IF(get("Shipper") = 1070067 || IsInString("tempur","ShipperName"))
	048Tempur()
IF(get("Shipper") = 1075816 || IsInString("battery","ShipperName"))
	048ATT()
IF(get("Shipper") = 0932392)
	048Medical()
IF(get("Shipper") = 0714361 || get("Shipper") = 0396949)
	048CUI()
IF(get("Shipper") = 0235682)
	048Lindstrom()
IF(get("Shipper") = 0339128)
	048Gap()
IF(get("Shipper") = 0998714)
	048Greenfield()
IF(get("Shipper") = 0717184)
	048Maillis()


IF(get("Shipper") = 0352084)
	039TraneAberdeen()
IF(get("Shipper") = 0507919 || get("Shipper") = 1253734)
	039Ruskin()

IF(get("Shipper") = 0491541)
	100Air()
IF(get("Shipper") = 0346627)
	100Innovative()
IF(get("Shipper") = 0589057)
	100National()
IF(get("Shipper") = 0591388 || IsInString("HUSBAND","ShipperStreet1")) 
	100Stillwater()
IF(get("Shipper") = 1358514)
	100Paragon()
IF(get("Shipper") = 0347990)
	100ContinentalIindustries()
IF(get("Shipper") = 1087841 || get("Shipper") = 1087842)
	100Carlisle()

IF(IsInString("Galv","ShipperStreet1"))
	100TulsaTube()



return