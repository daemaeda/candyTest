<?php

use Candy\Base\Controller;

class AuthController extends Controller
{

    /**
     * display the admin dashboard
     */
    public function index()
    {
        $this->data['title'] = 'ログイン';
        View::display('login.twig', $this->data);
    }

    /**
     * display the login form
     */
    public function login()
    {
        $this->data['title'] = 'ログイン';
        if (isset($_SESSION['isLogin']) && $_SESSION['isLogin']) {
            Response::redirect($this->siteUrl('report'));
        } else {
            $this->data['redirect'] = (Input::get('redirect')) ? base64_decode(Input::get('redirect')) : '';
            View::display('login.twig', $this->data);
        }
    }

    /**
     * Process the login
     */
    public function doLogin()
    {
        $usMail = Input::post('usMail');
        $usPassword = Input::post('usPassword');
        $redirect = Input::post('redirect');
        $redirect = ($redirect) ? $redirect : 'report';

        try {
            $Users = new Users();
            $input = Input::post();
            $Users->load($input);
            $Users->validate();
            $Users->hasErrors();

            $loginUser = $Users::findOne('us_mail', '=', $usMail);
            if ($loginUser->us_password === $usPassword) {
                $_SESSION['isLogin'] = true;
                $_SESSION['usName'] = $loginUser->us_name;
                $_SESSION['usId'] = $loginUser->id;
                Response::redirect($this->siteUrl('login'));
            } else {
                throw new \Exception;
            }

        } catch (\Exception $e) {
            App::flash('messageError', "メールアドレスまたはパスワードに間違いがあります");
            App::flash('usMail', $usMail);
            App::flash('redirect', $redirect);
            Response::redirect($this->siteUrl('login'));
        }

    }

    /**
     * Logout the user
     */
    public function logout()
    {
        session_destroy();
        Response::redirect($this->siteUrl('login'));
    }

}