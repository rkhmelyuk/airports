package account

import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole
import grails.plugins.springsecurity.Secured

class AccountController {

    @Secured("ROLE_ADMIN")
    def account() {
        def user = new User();
        if (request.method == "POST") {
            user.username = params.username?.trim()
            user.password = params.password?.trim()
            user.enabled = true;
            if (user.save(flush: true)) {
                def userRole = Role.findByAuthority('ROLE_USER')
                UserRole.create(user, userRole, true)
                redirect action: 'userPage'
            }
        }
        [user: user]
    }

    @Secured("ROLE_ADMIN")
    def deleteUser() {
        def user = User.get(params.long('id'))
        if (!user) {
            response.sendError 404
            return
        }
        UserRole.removeAll(user)
        user.delete(flush: true)
        redirect(action: "userPage")
    }

    @Secured("ROLE_ADMIN")
    def userPage() {
        [userList: User.findAll(), currentUsername: principal.username]
    }

}
