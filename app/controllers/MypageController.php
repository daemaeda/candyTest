<?php

use Candy\Base\Controller;

Class MypageController extends Controller
{

    public function index()
    {
        $this->data['title'] = 'Mypage';
        
        App::render('index.twig', $this->data);
    }
}