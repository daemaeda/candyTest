<?php
$theme['pre']      = '<div class="pagination">';
$theme['first']    = array('<a href="{url}{nr}" alt="最初">最初</a> ', ' ');
$theme['previous'] = array('<a href="{url}{nr}" alt="＜">前</a> ', '＜ ');
$theme['numbers']  = array('<a href="{url}{nr}">{nr}</a> ',  '<strong>{nr}</strong> ');
$theme['next']     = array('<a href="{url}{nr}" alt="＞">Next</a> ', '＞ ');
$theme['last']     = array('<a href="{url}{nr}">最後へ</a>', '');
$theme['post']     = '</div>';

return $theme;