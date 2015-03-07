function getCampusids(){
	var campuses = {};
	for(var i = 0; i < camp.length; i ++){
		campuses[i].push(camp[i][0]);
	};
	return campuses;
}
 
var campuses = getCampusids();
