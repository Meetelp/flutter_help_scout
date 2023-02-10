package dev.kelvinforteta.flutter_help_scout;

import android.content.Context;
import com.helpscout.beacon.model.BeaconScreens;
import com.helpscout.beacon.Beacon;
import com.helpscout.beacon.ui.BeaconActivity;
import java.util.ArrayList; 

class BeaconHelpers {

	// this method will initialize the beacon

	public void initialize(String beaconId) {

		new Beacon.Builder().withBeaconId(beaconId).build();
	}

	/*
	 * Once you’ve initialized Beacon, you’re ready to interact with it. Whenever
	 * you want to invoke Beacon, use the code below to display the Beacon user
	 * interface.
	 */
	public void openBeacon(Context context) {
		BeaconActivity.open(context);
	}

	/*
	 * Open Beacon with a search screen
	 */
	public void openBeaconSearch(Context context, String query) {
		ArrayList<String> searchList = new ArrayList<String>();
		searchList.add(query);
		BeaconActivity.open(context, BeaconScreens.SEARCH_SCREEN, searchList);
	}

	/*
	 * Open Beacon with a article screen
	 */
	public void openBeaconArticle(Context context, String articleId) {
		ArrayList<String> articleList = new ArrayList<String>();
		articleList.add(articleId);
		BeaconActivity.open(context, BeaconScreens.ARTICLE_SCREEN, articleList);
	}

	/*
	 * Open Beacon with a contact form screen
	 */
	public void openBeaconContactForm(Context context) {
		BeaconActivity.open(context, BeaconScreens.CONTACT_FORM_SCREEN, new ArrayList<String>());
	}

	/*
	 * Open Beacon with a previous messages screen
	 */
	public void openBeaconPreviousMessages(Context context) {
		BeaconActivity.open(context, BeaconScreens.PREVIOUS_MESSAGES, new ArrayList<String>());
	}

	/*
	 * Open Beacon with a chat screen
	 */
	public void openBeaconChat(Context context) {
		BeaconActivity.open(context, BeaconScreens.CHAT, new ArrayList<String>());
	}

	/*
	 * Open Beacon with a ask screen
	 */
	public void openBeaconAsk(Context context) {
		BeaconActivity.open(context, BeaconScreens.ASK, new ArrayList<String>());
	}

	/*
	 * Calling this method resets the current Beacon state, thereby deleting all the
	 * user data: email, name, user attributes, push token and resets the Beacon
	 * Device ID. It won’t remove the Beacon ID, or any local config overrides.
	 */
	public void logout() {
		Beacon.logout();
	}

	/*
	 * This method wipes all data from the Beacon, including the Beacon ID. This may
	 * be useful if you are using different Beacons in different parts of your app.
	 */
	public void clear() {
		Beacon.clear();
	}

	/*
	 * Set custom attributes for the current user.
	 */
	public void setCustomerProperty(String key, String value) {
		Beacon.addAttributeWithKey(key, value);
	}

	/*
	 * Remove a custom attribute for the current user.
	 */
	public void removeCustomerProperty(String key) {
		Beacon.removeAttribute(key);
	}

	/*
	 * Remove all custom attributes for the current user.
	 */
	public void clearCustomerProperties() {
		Beacon.clearAttributes();
	}

	// add some more extra attributes such as company name, job title and a url to
	// use as the customer’s avatar.
	public void identity(String email, String name, String avatar, String company, String jobTitle) {
		Beacon.identify(email, name, company, jobTitle, avatar);
	}
}
