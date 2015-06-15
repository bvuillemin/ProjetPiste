package com.epul.cerisaie.controle;

import com.epul.cerisaie.dao.HibernateClient;
import com.epul.cerisaie.hibernate.metier.Apprenant;
import com.epul.cerisaie.hibernate.metier.Jeu;
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
import javax.xml.bind.SchemaOutputResolver;
import java.text.DateFormat;
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

        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
        }
        destinationPage = "/ListeApprenants";

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

        String destinationPage = "Erreur";
        try {
            HibernateClient unGestClient = new HibernateClient();
            int id = Integer.parseInt(request.getParameter("id"));

            if (unGestClient != null) {
                Apprenant unApprenant = unGestClient.getUneLigne(id);
                request.setAttribute("apprenant", unApprenant);
                destinationPage = "/ModifierApprenant";
            }

        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
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
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
        }
        destinationPage = "/SelectApprenantScore";

        return new ModelAndView(destinationPage);

    }

    /**
     * Affichage des scores
     */
    @RequestMapping(value = "ListeScores.htm")
    public ModelAndView afficherLesScores(HttpServletRequest request,
                                          HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        try {
            Apprenant monapprenant = unGestClient.getUneLigne(0);
            request.setAttribute("monapprenant", monapprenant);
            request.setAttribute("messcores", monapprenant.getObtients());

        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
        }
        destinationPage = "/ListeScores";

        return new ModelAndView(destinationPage);

    }

    /**
     * Selection d'un apprenant pour l'affichage des scores
     */
    @RequestMapping(value = "SelectApprenantBilan.htm")
    public ModelAndView selectApprenantBilan(HttpServletRequest request,
                                             HttpServletResponse response) throws Exception {
        String destinationPage;

        HibernateClient unGestClient = new HibernateClient();
        try {
            List<Apprenant> mesapprenants = unGestClient.getTouteslesLignes();
            request.setAttribute("mesapprenants", mesapprenants);
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
        }
        destinationPage = "/SelectApprenantBilan";

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
            Apprenant monapprenant = unGestClient.getUneLigne(0);
            request.setAttribute("monapprenant", monapprenant);
            request.setAttribute("messcores", monapprenant.getObtients());

        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
        }
        destinationPage = "/Bilan";

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
            System.out.println(mesJeux.toString());

        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
        }
        destinationPage = "/ListeJeux";

        return new ModelAndView(destinationPage);

    }
}

	