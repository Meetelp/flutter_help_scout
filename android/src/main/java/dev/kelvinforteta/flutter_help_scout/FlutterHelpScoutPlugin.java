package dev.kelvinforteta.flutter_help_scout;

import android.app.Activity;
import android.content.Context;

import androidx.annotation.NonNull;

import com.helpscout.beacon.Beacon;
import com.helpscout.beacon.ui.BeaconActivity;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.util.*;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;

import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterHelpScoutPlugin */
public class FlutterHelpScoutPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
	/// The MethodChannel that will the communication between Flutter and native
	/// Android
	///
	/// This local reference serves to register the plugin with the Flutter Engine
	/// and unregister it
	/// when the Flutter Engine is detached from the Activity
	private MethodChannel channel;

	Activity context;

	BeaconHelpers beaconHelpers = new BeaconHelpers();

	@Override
	public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {

		channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "kelvinforteta.dev/flutter_help_scout");
		channel.setMethodCallHandler(this);

	}

	@Override
	public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
		final Map<String, Object> arguments = call.arguments();

		// this will initialize the beacon
		if (call.method.equals("initialize")) {
			beaconHelpers.initialize((String) arguments.get("beaconId"));
			beaconHelpers.identity((String) arguments.get("email"), (String) arguments.get("name"),
					(String) arguments.get("avatar"), (String) arguments.get("company"),
					(String) arguments.get("jobTitle"));
			result.success("Beacon successfully initialized!");
		}
		// open the beacon
		else if (call.method.equals("openBeacon")) {
			beaconHelpers.openBeacon(context);
			result.success("Beacon successfully opened!");
		}

    else if (call.method.equals("openBeaconSearch")) {
			beaconHelpers.openBeaconSearch(context, (String) arguments.get("query"));
			result.success("Beacon search successfully opened!");
		}

    else if (call.method.equals("openBeaconArticle")) {
			beaconHelpers.openBeaconArticle(context, (String) arguments.get("articleId"));
			result.success("Beacon article successfully opened!");
		}

    else if (call.method.equals("openBeaconContactForm")) {
      beaconHelpers.openBeaconContactForm(context);
      result.success("Beacon contact form successfully opened!");
    }

    else if (call.method.equals("openBeaconPreviousMessages")) {
      beaconHelpers.openBeaconPreviousMessages(context);
      result.success("Beacon previous messages successfully opened!");
    }

    else if (call.method.equals("openBeaconChat")) {
      beaconHelpers.openBeaconChat(context);
      result.success("Beacon chat successfully opened!");
    }

    else if (call.method.equals("openBeaconAsk")) {
      beaconHelpers.openBeaconAsk(context);
      result.success("Beacon ask successfully opened!");
    }

		else if (call.method.equals("logoutBeacon")) {
			beaconHelpers.logout();
			result.success("Beacon successfully logged out!");
		}

		else if (call.method.equals("clearBeacon")) {
			beaconHelpers.clear();
			result.success("Beacon successfully cleared!");
		}

		else if (call.method.equals("setCustomerProperty")) {
			beaconHelpers.setCustomerProperty((String) arguments.get("key"), (String) arguments.get("value"));
			result.success("Customer propery successfully set!");
		}

		else if (call.method.equals("removeCustomerProperty")) {
			beaconHelpers.removeCustomerProperty((String) arguments.get("key"));
			result.success("Customer propery removed successfully!");
		}

		else if (call.method.equals("clearCustomerProperties")) {
			beaconHelpers.clearCustomerProperties();
			result.success("Customer properties cleared successfully!");
		}

	}

	@Override
	public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
		channel.setMethodCallHandler(null);
	}

	@Override
	public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
		this.context = binding.getActivity();
	}

	@Override
	public void onDetachedFromActivityForConfigChanges() {

	}

	@Override
	public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

	}

	@Override
	public void onDetachedFromActivity() {

	}
}
