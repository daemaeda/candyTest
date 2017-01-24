$(function(){

    $('.clipInfo').on('click', '.toggleFavorite', function(e){
        var $memberId = $(this).attr('data-member');
        var $recipeId = $(this).attr('data-recipe');
        e.preventDefault();

        $.ajax({
            url    : global+'/candy/public/user/favorite',
            method : 'PUT',
            data   : {
                member_id : $memberId,
                recipe_id : $recipeId
            },
            success : function(resp){
                if(resp.code == 200){
                    $('.toggleFavorite').toggleClass('on');
                    var $count = $('.loves').text();
                    if(resp.isCountUp) {
                        $count++;
                    } else {
                        $count--
                    }
                    $('.loves').text($count);
                }
            }
        });
    });
});
