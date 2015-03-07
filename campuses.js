function getCampusids(){
	var campuses = {};
	for(var i = 0; i < camp.length; i ++){
		campuses[camp[i][1]]
		campuses[camp[i][1]].push(camp[i][0]);
	};
	return campuses;
}
 
var campuses = getCampusids();
