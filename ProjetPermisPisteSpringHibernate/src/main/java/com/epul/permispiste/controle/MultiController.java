package com.epul.permispiste.controle;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.Action;
import metier.Jeu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.epul.permispiste.dao.HibernateClient;

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
	@RequestMapping(value = "afficherJeux.htm")
	public ModelAndView afficherLesJeux(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String destinationPage;

		HibernateClient unGestClient = new HibernateClient();
		try {
			List<Jeu> mesJeux = unGestClient.getTouslesJeux();
			request.setAttribute("mesJeux", mesJeux);
		} catch (Exception e) {
			request.setAttribute("MesErreurs", e.getMessage());
		}
		destinationPage = "/ListeJeux";
		return new ModelAndView(destinationPage);
	}

	/**
	 * Affichage d'une action
	 */
	@RequestMapping(value = "afficherAction.htm")
	public ModelAndView afficherAction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String destinationPage;

		HibernateClient unGestClient = new HibernateClient();
		try {
			Action action = unGestClient.getUneAction(Integer.parseInt(request
					.getParameter("NumAction")));
			if (action != null) {
				request.setAttribute("uneAction", action);
			}
		} catch (Exception e) {
			request.setAttribute("MesErreurs", "Numéro d'action invalide !");
		}
		destinationPage = "/AfficherAction";
		return new ModelAndView(destinationPage);
	}

	/**
	 * Affichage des actions
	 */
	@RequestMapping(value = "listeActions.htm")
	public ModelAndView listeActions(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String destinationPage;
		HibernateClient unGestClient = new HibernateClient();
		try {
			List<Action> actions = unGestClient.getToutesLesActions();
			request.setAttribute("lesActions", actions);
		} catch (Exception e) {
			request.setAttribute("MesErreurs", e.getMessage());
		}
		destinationPage = "/ListeActions";
		return new ModelAndView(destinationPage);
	}
}
