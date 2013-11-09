function countItemInArray(item, array){
	if(item[0].hocPhanId == array[0][0].hocPhanId){
		if(array.length == 1)
			return 0;
		else
			return array.length;
	}
	else {
		return 0;
	}
}
			
function getNhomTuChons(item,array,index){
	var myArray = [];
	if(item == '0'){
		myArray.push(array[index]);
		return myArray;
	}
	else{
		for(var i = 0; i < array.length; i++){
			if(item == array[i][1].nhomTuChon){
				myArray.push(array[i]);
			}
		}
	}
	return myArray;
}
			
function getHocPhansByNhomKienThuc(array,group){
	var myArray = [];
	for(var i = 0; i < array.length; i++){
		if(group == array[i][1].khoiKienThuc){
			myArray.push(array[i]);
		}
	}
	return myArray;
}