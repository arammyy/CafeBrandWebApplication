$(document).ready(function() {
	initQty();
});
function initQty() {
	console.log("qnt.js호출")
	if ($('.product_quantity').length) {
		var qtys = $('.product_quantity');

		qtys.each(function() {
			var qty = $(this);
			var sub = qty.find('.sub_qnt');
			var sum = qty.find('.sum_qnt');
			var num = qty.find('.product_num');
			var original;
			var newValue;

			sub.on('click', function() {
				original = parseFloat(qty.find('.product_num').text());
				if (original > 1) {
					newValue = original - 1;
				}
				num.text(newValue);
				console.log(newValue);
			});

			sum.on('click', function() {
				original = parseFloat(qty.find('.product_num').text());
				newValue = original + 1;
				num.text(newValue);
				console.log(newValue);
			});
		});
	}
}