<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**   
* @Route("/main", name="main_")      
*/
class MainController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(): Response
    {
        return $this->render('main/home.html.twig', [
            'controller_name' => 'MainController',
        ]);
    }
	
	 /**
     * @Route("/about-us", name="about_us")
     */
    public function about()
    {
        return $this->render('main/about_us.html.twig');
    }
}
