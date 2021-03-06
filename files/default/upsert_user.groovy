import org.sonatype.nexus.security.role.NoSuchRoleException;
import org.sonatype.nexus.security.user.User;
import org.sonatype.nexus.security.user.UserManager;
import org.sonatype.nexus.security.user.UserNotFoundException;
import org.sonatype.nexus.security.SecuritySystem;

import groovy.json.JsonSlurper;

def params = new JsonSlurper().parseText(args)

// Ensure each of the roles exists, otherwise fail
// Without this check the user will be created/updated but with potentially
// a list of roles different to that passed.
authManager = security.getSecuritySystem().getAuthorizationManager(UserManager.DEFAULT_SOURCE);
params.roles.each { role ->
    try {
        authManager.getRole(role);
    } catch (NoSuchRoleException e) {
        log.error("No such role: ${role}, trying to set for ${params.username} from Chef");
        throw e
    }
}

try {
    // Update
    User user = security.securitySystem.getUser(params.username, UserManager.DEFAULT_SOURCE);

    user.setFirstName(params.first_name);
    user.setLastName(params.last_name);
    user.setEmailAddress(params.email);

    security.securitySystem.updateUser(user);
    security.securitySystem.changePassword(params.username, params.password);

    security.setUserRoles(user.getUserId(), params.roles);

    log.info("Updated information for ${params.username} from Chef");
} catch (UserNotFoundException e) {
    // Create
    security.addUser(params.username, params.first_name, params.last_name, params.email, true, params.password, params.roles);
    log.info("Created user ${params.username} from Chef");
}
