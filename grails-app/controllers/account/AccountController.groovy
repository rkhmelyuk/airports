package account

import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole
import grails.plugins.springsecurity.Secured
import airport.Comment

class AccountController {

    static final int COUNT_RECORD = 10;

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
        def page = params.int('page') ?: 1
        print(page)
        String query = params.name?.trim() ?: ''
        int countRecord = User.createCriteria().count {
            or {
                like("username", "%${query}%")
            }
        }
        def res = User.createCriteria().list {
            or {
                like("username", "%${query}%")
            }
            maxResults COUNT_RECORD
            firstResult((page - 1) * COUNT_RECORD)
        }
        boolean hasNextPage = ((page * COUNT_RECORD) < countRecord);

        [userList: res, currentUsername: principal.username,
                page: page, query: query, linkNextIsThere: hasNextPage, countRecord: countRecord]
    }

    @Secured("ROLE_ADMIN")
    def findUsers() {
        render template: "userList", model: userPage()
    }

}
