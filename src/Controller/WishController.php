<?php

namespace App\Controller;

use App\Entity\Wish;
use App\Repository\WishRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class WishController extends AbstractController
{
    /**
     * @Route("/wish", name="wish_list")
    */
	public function list(WishRepository $wishRepository): Response
    {
        // findAll() => récupère tous les enregistrements d'une table
        //           => ne prend aucun argument
        //           => retourne un tableau d'objets
        //           => ou tableau vide
        // à utiliser avec parcimonie surtout s'il y a des jointures (module 7 relations)
        $aWishes = $wishRepository->findAll();
        
        // findBy() => retourne plusieurs résultats selon les critères passés
        //          => prend un tableau de critères ['colonne1' => 'valeur1', 'colonne2 => 'valeur2']

        // Les arguments (facultatifs) sont :
        // critères : tableau associatif noms de colonne/valeurs
        // order by : tableau associatif noms de colonne/`ASC` ou `DESC`
        // limit : borne de début (un entier) pour la clause SQL `LIMIT`
        // offset : borne de fin (un entier) pour la clause SQL `LIMIT`

        // Exemple 1 : wishes publiés, du plus récent au plus ancien
        // Les wishes 2 et 8 ne sont pas publiés
//        $aWishes = $wishRepository->findBy(['isPublished' => true], ['dateCreated' => 'DESC']);
//        dd($aWishes);

        // findBy() => exemple 2 : wishes de l'auteur 'Dave Loper'
        // /!\ plus de notions de publiés ou non
//         $aWishes = $wishRepository->findBy(['author' => 'Dave Loper']);
//         dd($aWishes);
//
//        $aWishes = $wishRepository->findByAuthor('Dave Loper');
        // dd($aWishes);

       

        return $this->render('wish/list.html.twig', [
             "aWishes" => $aWishes
//           "wish" => $oWish
        ]);
    } // -- list()

    /**
     * @Route("/wish/detail/{id}", name="wish_detail", requirements={"id"="\d+"} )
     */
	 
	// +++ TODO : Test ParamConverter ne fonctionne pas +++
//    public function detail(int $id, WishRepository $wishRepository): Response
     public function detail(Wish $oWish, WishRepository $wishRepository, EntityManagerInterface $em): Response
    {
        // Plus besoin avec le ParamConverter : Récupère ce wish en fonction de l'id présent dans l'URL
//        $oWish = $wishRepository->find($id);

        // dd($oWish);

         // find() => retourne un enregistrement unique (objet) selon sa clé primaire (id).
        //        => ou NULL si la clé n'existe pas.
        //        => /!\ retourne un objet, pas un tableau
        //        => impossible de mettre autre chose qu'une clé primaire (sort un NULL mais pas d'erreur)
//         $oWish = $wishRepository->find(8);
//         dd($oWish);

        // findOneBy() => retourne un seul enregistrement selon les critères passés
        //             =< findOneBy(array $criteria, array $orderBy = null)
        //             => prend en 1er argument un tableau de critères ['colonne1' => 'valeur1', 'colonne2 => 'valeur2']
        //             => prend en 2ème argument un tableau pour les conditions de tri
        //             => /!\ retourne un objet, pas un tableau
        // Exemple 1 : pas de problème, u seul wish de Mike Crosoft
//        $oWish = $wishRepository->findOneBy(['author' => 'Mike Crosoft']);

        // Exemple 2 : sort le 1er 'Dave Loper' trouvé car il y en a 2
         //$oWish = $wishRepository->findOneBy(['author' => 'Dave Loper', 'isPublished' => 1]);

        // Exemple 3 : sort le 2ème 'Dave Loper' car condition de tri 'DESC'
        // /!\ différence entre l'attribut 'dateCreated' et le nom de la colonne en base de données 'date_created'
//       $oWish = $wishRepository->findOneBy(['author' => 'Dave Loper'], ['dateCreated' => 'DESC']);
        //dd($oWish); // Exemple 3 : sort le 2ème 'Dave Loper' car condition de tri 'DESC'

        // findOneByColumn('valeur')
        // Exemple 1
        // $oWish = $wishRepository->findOneByAuthor('Mike Crosoft');
        // dd($oWish);

        // findOneByColumn('valeur') : exemple 2
        // findOneById(8) = find(8)
        // $oWish = $wishRepository->findOneById(8);
        // dd($oWish);

        // s'il n'existe pas en bdd, erreur 404
        // tester en mettant dans l'url un id qui n'existe pas
        if (!$oWish) {
            throw $this->createNotFoundException('This wish does not exists! Sorry!');
        }

        return $this->render('wish/detail.html.twig', [
            "wish" => $oWish
        ]);
    } // -- detail()

    /**
     * @Route("/wish/create", name="wish_create")
     */ 
    public function create(EntityManagerInterface $entityManager): Response
    {
         // EntityManagerInterface
		 // Méthode 1 :
		 // $entityManager = $this->getDoctrine()->getManager();
		 
		 // Méthode 2, utilisée ici : injection de dépendance = en argument de la fonction
		  
        // On instancie un objet
        $oWish = new Wish();

        // On définit des valeurs par défaut pour le formulaire (ici date du jour)
        // Dans la plupart des cas les valeurs proviendront d'un formulaire
        $oWish->setTitle("Gagner à Euromillions");
        $oWish->setDescription('100 patates ! 100 patates !');
        $oWish->setAuthor('Jeff Bezos');
        $oWish->setIsPublished(true);
        $oWish->setDateCreated(new \Datetime());

        // $entityManager = $doctrine->getManager();

        // On ajoute aux requêtes à exécuter (transaction)
		// /!\ persist() n'exécute pas de requêtes
		$entityManager->persist($oWish);

        // Enregistrement
		// flush exécute les requêtes ajoutées via persist()
        $entityManager->flush();
       
	    // Retour classique : appel d'une vue 
	    // return $this->render('wish/detail.html.twig');
	   
	    // Retourne une réponse sans vue avec un message
        // return new Response('Souhait enregistré.');
		
		// Redirection sur une route
		// avec un message 'flash' 
		// https://symfony.com/doc/current/controller.html#flash-messages
		$this->addFlash("success", "Souhait enregistré.");
				
		// https://symfony.com/doc/current/controller.html#redirecting		
		return $this->redirectToRoute('wish_list');	
    } // -- create()
	
	/**
     * @Route("/wish/edit/{id}", name="wish_edit")
     */ 
    public function edit(EntityManagerInterface $entityManager, Wish $oWish): Response
    {
        // L'objet est directement instancié (Param Converter)
		// $oWish = new Wish();
		
		// dd($oWish);

        // On change les valeurs via les setters
        $oWish->setTitle("Gagner à Euromillions");
		
		// Modifions cette valeur par exemple :
        $oWish->setDescription('200 patates !');
        $oWish->setAuthor('Jeff Bezos');
        $oWish->setIsPublished(true);
        // $oWish->setDateCreated(new \Datetime());

        // On ajoute aux requêtes à exécuter (transaction)
		// /!\ persist() n'exécute pas de requêtes
		$entityManager->persist($oWish);

        // Enregistrement
		// flush exécute les requêtes ajoutées via persist()
        $entityManager->flush();
           
		$this->addFlash("success", "Souhait modifié.");
				
		// https://symfony.com/doc/current/controller.html#redirecting		
		return $this->redirectToRoute('wish_list');	
    } // -- edit()

    /**
     * @Route("/wish/delete/{id}", name="wish_delete", requirements={"id"="\d+"})
     */ 
    public function delete(EntityManagerInterface $entityManager, Wish $oWish): Response
    { 
	    $entityManager->remove($oWish);
        $entityManager->flush();
			
		$this->addFlash("success", "Souhait supprimé.");
				
		return $this->redirectToRoute('wish_list');	
	} // -- delete()

} // -- class