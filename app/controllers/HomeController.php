<?php

use Candy\Base\Controller;

Class HomeController extends Controller
{

    public function index()
    {
        $this->data['title'] = 'Candy Clip';
//        $input = Input::get();
//        var_dump($input['a']);
        App::render('index.twig', $this->data);
    }
}