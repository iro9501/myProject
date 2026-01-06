function check(){
	let ProIn = document.productInsert;
	let pname = ProIn.pname;
	let price = ProIn.price;
	let author = ProIn.author;
	let publisher = ProIn.publisher;
	let releasedate = ProIn.releasedate;
	let description = ProIn.description;
	let category = ProIn.category;
	let stock = ProIn.stock;
	let file = ProIn.file;
	let originname = ProIn.originname;
	
	let reg_num = /^\d+$/;
	let reg_releasedate = /^\d{4}\/(0[1-9]|1[0-2])\/(0[1-9]|[12]\d|3[01])$/;
	
	if (pname.value == ""){
		alert("도서명 입력 필요");
		pname.select();
		return false;
	}
	
	if (!price.value.match(reg_num)){
		alert("가격을 숫자로 입력");
		price.select();
		return false;
	}
	
	if (author.value == ""){
		alert("저자명 입력 필요");
		author.select();
		return false;
	}
	
	if (publisher.value == ""){
		alert("출판사명 입력 필요");
		publisher.select();
		return false;
	}
	
	if (!releasedate.value.match(reg_releasedate)){
		alert("출판일을 (yyyy/MM/dd)의 형식으로 입력");
		releasedate.select();
		return false;
	}
	const releasedateA = releasedate.value.split('/');
	const year = parseInt(releasedateA[0], 10);
    // Date 객체는 월을 0(1월)부터 11(12월)까지 사용하므로 1을 빼준다.
    const month = parseInt(releasedateA[1], 10) - 1; 
    const day = parseInt(releasedateA[2], 10);
    
    const date = new Date(year, month, day);
    
    if (date.getFullYear() != year || date.getMonth() != month || date.getDate() != day){
    	alert("잘못된 연,월,일");
    	releasedate.select();
    	return false;
    }
    
	
	if (description.value.length < 60){
		alert("도서설명 60자 이상 입력");
		description.select();
		return false;
	}
	
	if (category.value == ""){
		alert("분류 입력 필요");
		category.select();
		return false;
	}
	
	if (!stock.value.match(reg_num)){
		alert("재고수를 숫자로 입력");
		stock.select();
		return false;
	}
	if (originname == ""){
		if (file.value.length == 0){
			alert("파일 업로드 필요");
			return false;
		}
	}
}