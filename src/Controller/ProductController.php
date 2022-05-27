<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    /**
     * @Route("/product", name="product")
     */
    public function index(ProductRepository $productRepository): Response
    {
//        $oProduct = new Product();
//
//        $oProduct->setName('cable USB');
//        $oProduct->setPrice(123);

//        $aProducts = $productRepository->findWellRatedProduct();
         $aProducts = $productRepository->findWellRatedProduct2();
        dd($aProducts);

        return $this->render('main/home.html.twig', [
            'controller_name' => 'ProductController',
        ]);
    }
}