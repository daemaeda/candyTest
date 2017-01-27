$(function () {
    $('.contents').on('click', '.addIngredient', function (e) {
        e.preventDefault();
        var $content = '';
        $content += '<dt><input type="text" name="name[]" value="" placeholder="材料"></dt>';
        $content += '<dd><input type="text" name="quantity[]" value="" placeholder="分量"></dd>';
        $('.ingredientList').append($content);
    });
});