package com.epul.permispiste.controle;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.epul.permispiste.bean.RealisationBean;
import com.epul.permispiste.bean.RealisationsBean;
import com.epul.permispiste.bean.ScoreBean;
import com.epul.permispiste.bean.ScoresBean;
import com.epul.permispiste.dao.HibernateClient;
import com.epul.permispiste.gestiondeserreurs.ServiceHibernateException;
import com.epul.permispiste.metier.Action;
import com.epul.permispiste.metier.Apprenant;
import com.epul.permispiste.metier.Jeu;
import com.epul.permispiste.metier.Obtient;

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
	 * Affichage d'un jeu
	 */
	@RequestMapping(value = "afficherJeu.htm", method = RequestMethod.GET)
	public ModelAndView afficherJeu(HttpServletRequest request,
			HttpServletResponse response, @RequestParam Integer id)
			throws Exception {
		String destinationPage;

		HibernateClient unGestClient = new HibernateClient();
		try {
			Jeu jeu = unGestClient.getUnJeu(id);
			List<Apprenant> apprenants = unGestClient.getTouslesApprenant();
			request.setAttribute("jeu", jeu);
			request.setAttribute("apprenants", apprenants);
		} catch (Exception e) {
			request.setAttribute("MesErreurs", e.getMessage());
		}
		destinationPage = "/AfficherJeu";
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
			List<Action> actions = unGestClient.getToutesLesActions();
			request.setAttribute("actions", actions);

			int numAction = Integer.parseInt(request.getParameter("action"));
			Action action = unGestClient.getUneAction(numAction);
			if (action != null) {
				request.setAttribute("uneAction", action);
			}
		} catch (Exception e) {
			List<Action> actions = unGestClient.getToutesLesActions();
			request.setAttribute("actions", actions);
		}
		destinationPage = "/AfficherAction";
		return new ModelAndView(destinationPage);
	}

	/**
	 * Affichage d'une action
	 */
	@RequestMapping(value = "afficherMissions.htm")
	public ModelAndView afficherMissions(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String destinationPage;

		HibernateClient unGestClient = new HibernateClient();
		try {
			List<Jeu> jeux = unGestClient.getTouslesJeux();
			request.setAttribute("jeux", jeux);

			int numJeu = Integer.parseInt(request.getParameter("numJeu"));
			Jeu j = unGestClient.getUnJeu(numJeu);
			if (j != null) {
				request.setAttribute("unJeu", j);
			}
		} catch (Exception e) {
			List<Jeu> jeux = unGestClient.getTouslesJeux();
			request.setAttribute("jeux", jeux);
		}
		destinationPage = "/AfficherMissions";
		return new ModelAndView(destinationPage);
	}

	/**
	 * Affichage dun jeu
	 */
	@RequestMapping(value = "afficherLesJeux.htm")
	public ModelAndView afficherLesJeux(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String destinationPage;

		HibernateClient unGestClient = new HibernateClient();
		try {
			List<Jeu> jeux = unGestClient.getTouslesJeux();
			if (jeux != null) {
				request.setAttribute("jeux", jeux);
			}
		} catch (Exception e) {
			request.setAttribute("MesErreurs", "Num�ro d'action invalide !");
		}
		destinationPage = "/AfficherLesJeux";
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

	/**
	 * Ajout d'un apprenant
	 */
	@RequestMapping(value = "ajoutApprenant.htm")
	public ModelAndView ajouterApprenant(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String destinationPage;
		HibernateClient unGestClient = new HibernateClient();

		String att = request.getParameter("nom");
		if (att != null && !att.equals("")) {
			// on a rempli le formulaire, on va ajouter l'apprenant
			Apprenant a = new Apprenant();
			a.setNomapprenant(request.getParameter("nom"));
			a.setPrenomapprenant(request.getParameter("prenom"));
			try {
				unGestClient.sauverApprenant(a);
			} catch (Exception e) {
				request.setAttribute("MesErreurs", e.getMessage());
				request.setAttribute("messageDanger",
						"Erreur lors de l'enregistrement ...");
			}
			request.setAttribute("messageSuccess", "Apprenant enregistr� !");
		} else {
			// on n'a pas encore rempli le formulaire
			request.setAttribute("apprenant", new Apprenant());
		}

		destinationPage = "/ajoutApprenant";
		return new ModelAndView(destinationPage);
	}

	/**
	 * Modification d'un apprenant
	 */
	@RequestMapping(value = "modifierApprenant.htm")
	public ModelAndView modifierApprenant(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// String destinationPage;
		HibernateClient unGestClient = new HibernateClient();
		Apprenant a = unGestClient.getUnApprenant(new Integer(request
				.getParameter("id")));
		a.setNomapprenant(request.getParameter("nom"));
		a.setPrenomapprenant(request.getParameter("prenom"));
		try {
			unGestClient.sauverApprenant(a);
		} catch (Exception e) {
			request.setAttribute("MesErreurs", e.getMessage());
			request.setAttribute("messageDanger",
					"Erreur lors de l'enregistrement ...");
		}
		request.setAttribute("messageSuccess",
				"Apprenant modifi� avec succ�s !");

		return afficherLesApprenants(request, response);
		// destinationPage = "/afficherLesApprenants";
		// destinationPage = "redirect:/afficherLesApprenants.htm";
		// return new ModelAndView(destinationPage);
	}

	/**
	 * Suppression d'un apprenant
	 */
	@RequestMapping(value = "supprimerApprenant.htm")
	public ModelAndView supprimerApprenant(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// String destinationPage;
		HibernateClient unGestClient = new HibernateClient();
		boolean erreur = false;
		try {
			System.out.println("lala");
			unGestClient.supprimerApprenant(new Integer(request
					.getParameter("idSuppr")));
		} catch (Exception e) {
			request.setAttribute("MesErreurs", e.getMessage());
			request.setAttribute("messageDanger",
					"Erreur lors de la suppression ..." + e.getMessage());
			erreur = true;
		}
		if (!erreur) {
			request.setAttribute("messageSuccess",
					"Apprenant supprim� avec succ�s !");
		}

		return afficherLesApprenants(request, response);
		// destinationPage = "/afficherLesApprenants";
		// destinationPage = "redirect:/afficherLesApprenants.htm";
		// return new ModelAndView(destinationPage);
	}

	/**
	 * Affichage des apprenants
	 */
	@RequestMapping(value = "afficherLesApprenants.htm")
	public ModelAndView afficherLesApprenants(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String destinationPage;

		HibernateClient unGestClient = new HibernateClient();
		try {
			// TODO
			List<Apprenant> apprenants = unGestClient.getTouslesApprenant();
			request.setAttribute("apprenants", apprenants);
		} catch (Exception e) {
			request.setAttribute("MesErreurs", e.getMessage());
		}
		destinationPage = "/AfficherLesApprenants";
		return new ModelAndView(destinationPage);
	}

	/**
	 * Affichage de l'apprenant
	 */
	@RequestMapping(value = "afficherApprenant.htm", method = RequestMethod.GET)
	public @ResponseBody RealisationsBean afficherApprenant(
			HttpServletRequest request, @RequestParam Integer numApprenant)
			throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		String apprenantjson = "";
		Apprenant apprenant = null;
		List<RealisationBean> realisationsList = new ArrayList<RealisationBean>();
		HibernateClient unGestClient = new HibernateClient();
		try {
			apprenant = unGestClient.getUnApprenant(numApprenant);
			for (Obtient o : apprenant.getObtients()) {
				realisationsList.add(new RealisationBean(o));
			}
		} catch (Exception e) {
			request.setAttribute("MesErreurs", e.getMessage());
		}

		RealisationsBean actions = new RealisationsBean(apprenant,
				realisationsList);

		return actions;
	}

	/**
	 * Affichage de l'apprenant
	 */
	@RequestMapping(value = "genererScore.htm")
	public @ResponseBody int genererScore(HttpServletRequest request,
			@RequestParam String scores) {
		ObjectMapper mapper = new ObjectMapper();
		ScoresBean scores2 = null;
		boolean erreur = false;
		try {
			scores2 = mapper.readValue(scores, ScoresBean.class);
		} catch (JsonParseException e) {
			request.setAttribute("MesErreurs", e.getMessage());
			request.setAttribute("messageDanger",
					"Erreur lors de la lecture des donn�es ...");
			erreur = true;
		} catch (JsonMappingException e) {
			request.setAttribute("MesErreurs", e.getMessage());
			request.setAttribute("messageDanger",
					"Erreur lors de la lecture des donn�es ...");
			erreur = true;
		} catch (IOException e) {
			request.setAttribute("MesErreurs", e.getMessage());
			request.setAttribute("messageDanger",
					"Erreur lors de la lecture des donn�es ...");
			erreur = true;
		}

		Apprenant apprenant = null;
		List<RealisationBean> realisationsList = new ArrayList<RealisationBean>();
		HibernateClient unGestClient = new HibernateClient();
		try {
			unGestClient.sauverScores(scores2);
		} catch (ServiceHibernateException e) {
			request.setAttribute("MesErreurs", e.getMessage());
			request.setAttribute("messageDanger",
					"Erreur lors de l'enregistrement ...");
			erreur = true;
		} catch (Exception e) {
			request.setAttribute("MesErreurs", e.getMessage());
			request.setAttribute("messageDanger",
					"Erreur lors de l'enregistrement ...");
			erreur = true;
		}

		int score = 0;
		for (ScoreBean s : scores2.getScores()) {
			score += s.getScore();
		}
		if (!erreur) {
			request.setAttribute("messageSuccess", "Score envoy� !");
		}
		return score;
	}
}
