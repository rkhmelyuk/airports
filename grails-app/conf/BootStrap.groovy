import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole

class BootStrap {
    def init = { servletContext ->
        if (User.count() == 0) {
            def adminRole = new Role(name: "Administrator", authority: 'ROLE_ADMIN').save(flush: true)
            def userRole = new Role(name: "User", authority: 'ROLE_USER').save(flush: true)

            def testUser = new User(username: 'admin', enabled: true, password: '1234')
            testUser.save(flush: true)
            def testUser2 = new User(username: 'user', enabled: true, password: '1234')
            testUser2.save(flush: true)

            UserRole.create testUser, adminRole, true
            UserRole.create testUser2, userRole, true

            assert User.count() == 2
            assert Role.count() == 2
            assert UserRole.count() == 2
        }

    }

    def destroy = {
    }
}
