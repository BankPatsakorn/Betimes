//================ Date Time Utils

function GetTimeDuration(date1, date2, typeName) {
	var unixtime1 = date1.getTime();
	var unixtime2 = date2.getTime();
	// get total seconds between the times
	var delta = Math.abs(unixtime2 - unixtime1) / 1000;

	// calculate (and subtract) whole days
	var days = Math.floor(delta / 86400);
	if (typeName == 'd') return days;

	delta -= days * 86400;
	// calculate (and subtract) whole hours
	var hours = Math.floor(delta / 3600) % 24;
	if (typeName == 'h') return hours;

	delta -= hours * 3600;

	// calculate (and subtract) whole minutes
	var minutes = Math.floor(delta / 60) % 60;
	if (typeName == 'm') return minutes;

	delta -= minutes * 60;

	// what's left is seconds
	var seconds = delta % 60;  // in theory the modulus is not required

	if (typeName == 's') return seconds;
}



//==================== Money to Word  Utils


//money to word
function MoneyToWord() { }

MoneyToWord.execute = function (moneyStr) {
	var money = parseFloat(moneyStr.replace(/,/g, ""));
	var result = '';
	var minus = '';

	if (money < 0) {
		minus = 'ติดลบ';
		money = money * -1;
	}

	money = parseFloat(Math.round(money * 100) / 100).toFixed(2);

	if (money == '0.00') {
		result = 'ศูนย์บาทถ้วน';
		return result;
	}

	var numbers = ['', 'หนึ่ง', 'สอง', 'สาม', 'สี่', 'ห้า', 'หก', 'เจ็ด', 'แปด', 'เก้า'];
	var positions = ['', 'สิบ', 'ร้อย', 'พัน', 'หมื่น', 'แสน'];

	var digit = money.length;
	var inputs = [];

	if (digit <= 15) {
		if (digit > 9) {
			inputs[0] = money.substr(0, digit - 9);
			inputs[1] = money.substr(inputs[0].length, 6);
		} else {
			inputs[0] = '00';
			inputs[1] = money.substr(0, money.length - 3);
		}
		inputs[2] = money.substr(money.indexOf('.') + 1, 2);
	} else {
		result = 'Error: ไม่สามารถรองรับจำนวนเงินที่เกินหลักแสนล้าน';
		return result;
	}

	for (i = 0; i < 3; i++) {
		var input = inputs[i];

		if (input != '0' && input != '00') {
			var digit = input.length;

			for (j = 0; j < digit; j++) {
				var s = input.substr(j, 1);
				var number = numbers[s];
				var position = '';

				if (number != '') {
					position = positions[digit - (j + 1)];
				}

				if ((digit - j) == 2) {
					if (s == '1') {
						number = '';
					} else if (s == '2') {
						number = 'ยี่';
					}
				} else if ((digit - j) == 1 && (digit != 1)) {
					var pre_s = '0';
					if (j > 0) {
						pre_s = input.substr(j - 1, 1);
					}

					if (i == 0) {
						if (pre_s != '0') {
							if (s == '1') {
								number = 'เอ็ด';
							}
						}
					} else {
						if (s == '1') {
							number = 'เอ็ด';
						}
					}
				}

				result = result + number + position;
			}
		}

		if (i == 0) {
			if (input != '00') {
				result = result + 'ล้าน';
			}
		} else if (i == 1) {
			if (input != '0' && input != '00') {
				result = result + 'บาท';
				if (inputs[2] == '00') {
					result = result + 'ถ้วน';
				}
			}
		} else {
			if (input != '00') {
				result = result + 'สตางค์';
			}
		}
	}

	return minus + result;
}