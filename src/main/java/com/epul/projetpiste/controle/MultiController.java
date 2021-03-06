package com.epul.projetpiste.controle;

import com.epul.projetpiste.dao.HibernateClient;
import com.epul.projetpiste.hibernate.metier.Apprenant;
import com.epul.projetpiste.hibernate.metier.Calendrier;
import com.epul.projetpiste.hibernate.metier.Jeu;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MultiController extends MultiActionController {

    private static final Logger logger = LoggerFactory
            .getLogger(MultiController.class);
    // le format est une combinaison de MM dd yyyy avec / ou �
    // exemple dd/MM/yyyy
    public Date conversionChaineenDate(String unedate, String unformat) throws Exception {
        Date datesortie;
        // on d�finit un format de sortie
        SimpleDateFormat defFormat = new SimpleDateFormat(unformat);
        datesortie = defFormat.parse(unedate);
        return datesortie;
    }
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "Index.htm", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
                DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        model.addAttribute("serverTime", formattedDate);
        return "/Index";
    }

    /**
     * Affichage de tous les jouets
     */
    @RequestMapping(value = "ListeApprenants.htm")
    public ModelAndView afficherLesClients(HttpServletRequest request,
                                           HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        try {
            List<Apprenant> mesApprenants = unGestClient.getTouteslesLignes();
            request.setAttribute("mesapprenants", mesApprenants);
            destinationPage = "/ListeApprenants";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }
        return new ModelAndView(destinationPage);

    }

    /**
     * Ajouter un apprenant
     */
    @RequestMapping(value = "ajouterApprenant.htm")
    public ModelAndView ajouterApprenant(HttpServletRequest request,
                                         HttpServletResponse response) throws Exception {

        String destinationPage;
        try {
            HibernateClient unGestClient = new HibernateClient();
            Apprenant unApprenant = new Apprenant();
            unApprenant.setNomapprenant(request.getParameter("nom"));
            unApprenant.setPrenomapprenant(request.getParameter("prenom"));
            unApprenant.setNumapprenant(Integer.parseInt(request.getParameter("id")));
            unGestClient.ajouter(unApprenant);
            List<Apprenant> mesApprenants = unGestClient.getTouteslesLignes();
            request.setAttribute("mesapprenants", mesApprenants);
            destinationPage = "/ListeApprenants";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }
        return new ModelAndView(destinationPage);
    }

    /**
     * Page d'ajout d'un apprenant
     */
    @RequestMapping(value = "ajouterUnApprenant.htm")
    public ModelAndView ajouterUnApprenant(HttpServletRequest request,
                                         HttpServletResponse response) throws Exception {
        String destinationPage = "/AjoutApprenant";
        return new ModelAndView(destinationPage);
    }

    /**
     * Sauvegarde d'un apprenant
     */
    @RequestMapping(value = "sauverApprenants.htm")
    public ModelAndView sauverApprenant(HttpServletRequest request,
                                        HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Apprenant monApprenant = unGestClient.getUneLigne(id);
            monApprenant.setNomapprenant(request.getParameter("nom"));
            monApprenant.setPrenomapprenant(request.getParameter("prenom"));
            unGestClient.modifier(monApprenant);
            List<Apprenant> mesApprenants = unGestClient.getTouteslesLignes();
            request.setAttribute("mesapprenants", mesApprenants);
            destinationPage = "/ListeApprenants";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }
        return new ModelAndView(destinationPage);

    }

    /**
     * Modifier apprenant
     */
    @RequestMapping(value = "modifierApprenant.htm")
    public ModelAndView modifierApprenant(HttpServletRequest request,
                                          HttpServletResponse response) throws Exception {
        String destinationPage;
        try {
            HibernateClient unGestClient = new HibernateClient();
            int id = Integer.parseInt(request.getParameter("id"));
            Apprenant unApprenant = unGestClient.getUneLigne(id);
            request.setAttribute("apprenant", unApprenant);
            destinationPage = "/ModifierApprenant";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }
        return new ModelAndView(destinationPage);
    }


    /**
     * Selection d'un apprenant pour l'affichage des scores
     */
    @RequestMapping(value = "SelectApprenantScore.htm")
    public ModelAndView selectApprenantScore(HttpServletRequest request,
                                             HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        try {
            List<Apprenant> mesapprenants = unGestClient.getTouteslesLignes();
            request.setAttribute("mesapprenants", mesapprenants);
            destinationPage = "/SelectApprenantScore";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }
        return new ModelAndView(destinationPage);

    }


    /**
     * Affichage des scores
     */
    @RequestMapping(value = "Bilan.htm")
    public ModelAndView afficherLeBilan(HttpServletRequest request,
                                        HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Apprenant monapprenant = unGestClient.getUneLigne(id);
            request.setAttribute("monapprenant", monapprenant);
            request.setAttribute("messcores", monapprenant.getObtients());
            destinationPage = "/BilanApprenant";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }
        return new ModelAndView(destinationPage);

    }

    /**
     * effacer  Apprenant
     */
    @RequestMapping(value = "effacerApprenant.htm")
    public ModelAndView effacerApprenant(HttpServletRequest request) throws Exception {

        String destinationPage;
        HibernateClient unGestClient = new HibernateClient();
        try {
            // recuperation de la liste des id a effacer
            String id = request.getParameter("id");
            // effacement de la liste des id
            if (id != null) {
                System.out.println(id);
                Apprenant a = unGestClient.getUneLigne(Integer.parseInt(id));
                unGestClient.effacer(a);
                //unGestClient.effacer(id);
            }
            // preparation de la liste
            List<Apprenant> mesApprenants = unGestClient.getTouteslesLignes();
            request.setAttribute("mesapprenants", mesApprenants);
            destinationPage = "/ListeApprenants";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }
        return new ModelAndView(destinationPage);
    }


    /**
     * Envoie sur la page d'inscription
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "Inscription.htm")
    public ModelAndView inscription(HttpServletRequest request,
                                        HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        int idJeu = Integer.parseInt(request.getParameter("id"));

        try {
            Jeu unJeu = unGestClient.getUneLigneJeu(idJeu);
            List<Apprenant> mesApprenants = unGestClient.getTouteslesLignes();
            request.setAttribute("unjeu", unJeu);
            request.setAttribute("mesapprenants", mesApprenants);

        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
        }
        destinationPage = "/Inscription";

        return new ModelAndView(destinationPage);

    }

    /**
     * Finalise l'inscription d'un apprenant
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "InscriptionApprenant.htm")
    public ModelAndView inscriptionApprenant(HttpServletRequest request,
                                    HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        int idJeu = Integer.valueOf(request.getParameter("idJeu"));
        int idApprenant = Integer.valueOf(request.getParameter("idApprenant"));
        Date d = conversionChaineenDate(request.getParameter("date"), "dd/MM/yyyy");
        Apprenant monApprenant = unGestClient.getUneLigne(idApprenant);
        Jeu monJeu = unGestClient.getUneLigneJeu(idJeu);

        try {
            Calendrier c = new Calendrier(d);
            unGestClient.inscrire(monJeu, monApprenant, c);
            List<Jeu> mesJeux = unGestClient.getTouslesJeux();
            request.setAttribute("mesjeux", mesJeux);
            destinationPage = "/ListeJeux";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }

        return new ModelAndView(destinationPage);

    }

    /**
     * Affichage de tous les jouets
     */
    @RequestMapping(value = "ListeJeux.htm")
    public ModelAndView afficherLesJeux(HttpServletRequest request,
                                        HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        try {
            List<Jeu> mesJeux = unGestClient.getTouslesJeux();
            request.setAttribute("mesjeux", mesJeux);
            destinationPage = "/ListeJeux";

        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }
        return new ModelAndView(destinationPage);

    }
    /**
     * Affichage de tous les jouets
     */
    @RequestMapping(value = "DetailsJeu.htm")
    public ModelAndView detailleLesJeux(HttpServletRequest request,
                                        HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        try {
            int id = Integer.valueOf(request.getParameter("id"));
            Jeu monJeu = unGestClient.getUneLigneJeu(id);
            request.setAttribute("monjeu", monJeu);
            request.setAttribute("mesmissions", monJeu.getMissions());
            request.setAttribute("mesactions", monJeu.getActions());
            destinationPage = "/DetailsJeu";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/Erreur";
        }
        return new ModelAndView(destinationPage);

    }
}

	