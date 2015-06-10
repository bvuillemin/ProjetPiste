package com.epul.cerisaie.controle;

import com.epul.cerisaie.dao.HibernateClient;


import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.epul.cerisaie.hibernate.metier.Apprenant;
import com.epul.cerisaie.hibernate.metier.Mission;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

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


	@RequestMapping(value = "index.htm", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "/index";
	}

	/**
	 * Affichage de tous les jouets
	 */
@RequestMapping(value = "afficherClients.htm")
public ModelAndView afficherLesClients(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			String destinationPage;	

				HibernateClient  unGestClient = new HibernateClient ();
				try {
					List<Apprenant> mesApprenants =unGestClient.getTouteslesLignes();
					request.setAttribute("mesapprenants",mesApprenants);

				} catch (Exception e) {
					request.setAttribute("MesErreurs", e.getMessage());
				}
				destinationPage = "/ListeApprenants";
				
				return new ModelAndView(destinationPage);
				
			}
	
}

	