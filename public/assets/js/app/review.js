$(function () {
    $('.contentIn').on('click', '.toggleFavorite', function (e) {
        var $memberId = $(this).attr('data-member-id');
        var $recipeId = $(this).attr('data-recipe-id');
        e.preventDefault();

        $.ajax({
            url: global + '/candy/public/user/favorite',
            method: 'PUT',
            data: {
                member_id: $memberId,
                recipe_id: $recipeId
            },
            success: function (resp) {
                if (resp.code == 200) {
                    $('.toggleFavorite').toggleClass('on');
                    var $count = $('.toggleFavorite').text();
                    if (resp.isCountUp) {
                        $count++;
                    } else {
                        $count--
                    }
                    $('.toggleFavorite').text($count);
                }
            }
        });
    });

    $('.contentIn').on('click', '.postReview', function (e) {
        var $memberId = $(this).attr('data-member-id');
        var $memberName = $(this).attr('data-member-name');
        var $recipeId = $(this).attr('data-recipe-id');
        var $comment = $('#reviewComment').val();
        e.preventDefault();

        $.ajax({
            url: global + '/candy/public/review',
            method: 'POST',
            data: {
                member_id: $memberId,
                recipe_id: $recipeId,
                comment: $comment,
            },
            success: function (resp) {
                if (resp.code == 200) {
                    $('.commentList > ul').append(reviewFormat($memberId, $memberName, $comment));
                    $('#reviewComment').val('');
                    var $count = $('.commentCount').text();
                    $count++;
                    $('.commentCount').text($count);
                }
            }
        });
    });

    function reviewFormat($memberId, $memberName, $comment) {
        var $content = '';
        $content += '<li>';
        $content += '<a href="' + global + '/candy/public/user/' + $memberId + '">';
        $content += '<div class="userIcon"><img src="img/icon.png" alt=""></div>';
        $content += '<span class="userName">' + $memberName + '</span>';
        $content += '</a>';
        $content += '<p class="comment">';
        $content += $comment;
        $content += '</p>';
        $content += '</li>'
        return $content;
    }
});
