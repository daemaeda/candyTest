$(function () {
    $('.ingredient').on('click', '.addIngredient', function (e) {
        e.preventDefault();
        var $content = '';
		$content += '<tr>';
		$content += '<th><input type="text" name="name[]" value="" placeholder="材料"></th>';
		$content += '<td><input type="text" name="quantity[]" value="" placeholder="分量"></td>';
		$content += '</tr>';
        $('.ingredientList').append($content);
    });
});