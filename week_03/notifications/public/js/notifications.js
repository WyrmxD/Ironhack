var notifications = (function(){

		var _notify = function(title, description, image) {
				var instance;

				if (Notification.permission === "granted") {
					instance = new Notification(title, {
						body: description,
						icon: image
					});
				} else {
					Notification.requestPermission(function(permission) {
						if (!("permission" in Notification)) {
							Notification.permission = permission;
						}
						instance = new Notification(title, {
							body: description,
							icon: image
						});
					});
				}
		}

		return {
			notify : _notify		
		}

})();

// notify("@soyjavi","Just a complicated human who makes stuff • CTO at @tapquo • Author • Digital Nomad • Creator of Atoms, @QuoJS & others","http://cdn.tapquo.com/photos/soyjavi.jpg");
// notify("@cataflu","Prefiero no comer antes que cocinar","http://cdn.tapquo.com/photos/cata.jpg");