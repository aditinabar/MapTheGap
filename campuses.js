function getCampusesByDistrictName(){
	    var campusesByDistrictId = {};
			    var districtsById = {};
					    var campusesByDistrictName = {};
							 
							    for(var i = 0; i < camp.length; i ++){
										        campusesByDistrictId[camp[i][1]] = campusesByDistrictId[camp[i][1]] || [];
														        campusesByDistrictId[camp[i][1]].push({
																			            campusId : camp[i][0],
																			            districtId : camp[i][1],
																			            campusName : camp[i][2],
																			            districtName : camp[i][3],
																			            regionId : camp[i][4],
																			            countyName : camp[i][5]
																			        });
																		    }
									 
									    for(var i = 0; i < dist.length; i ++){
												        districtsById[dist[i][0]] = dist[i][1];
																    }
											 
											    for (var districtId in campusesByDistrictId) {
														       var campusArray = campusesByDistrictId[districtId];
																	        campusesByDistrictName[districtsById[districtId]] = campusArray;
																					    }
													 
													    return campusesByDistrictName;
}
 
var campusesByDistrictName = getCampusesByDistrictName();
