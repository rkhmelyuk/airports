import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole

class BootStrap {
    def init = { servletContext ->
        if (User.count() == 0) {
            def adminRole = new Role(name: "Admin", authority: 'ROLE_ADMIN').save(flush: true)
            def userRole = new Role(name: "User", authority: 'ROLE_USER').save(flush: true)

            def testUser = new User(username: 'admin', enabled: true, password: '1234')
            testUser.save(flush: true)

            def testUser2 = new User(username: 'user2', enabled: true, password: '1234')
            testUser2.save(flush: true)
            def testUser3 = new User(username: 'user3', enabled: true, password: '1234')
            testUser3.save(flush: true)
            def testUser4 = new User(username: 'user4', enabled: true, password: '1234')
            testUser4.save(flush: true)
            def testUser5 = new User(username: 'user5', enabled: true, password: '1234')
            testUser5.save(flush: true)
            def testUser6 = new User(username: 'user6', enabled: true, password: '1234')
            testUser6.save(flush: true)
            def testUser7 = new User(username: 'user7', enabled: true, password: '1234')
            testUser7.save(flush: true)
            def testUser8 = new User(username: 'user8', enabled: true, password: '1234')
            testUser8.save(flush: true)
            def testUser9 = new User(username: 'user9', enabled: true, password: '1234')
            testUser9.save(flush: true)
            def testUser10 = new User(username: 'user10', enabled: true, password: '1234')
            testUser10.save(flush: true)
            def testUser11 = new User(username: 'user11', enabled: true, password: '1234')
            testUser11.save(flush: true)
            def testUser12 = new User(username: 'user12', enabled: true, password: '1234')
            testUser12.save(flush: true)

            UserRole.create testUser, adminRole, true
            UserRole.create testUser2, userRole, true
            UserRole.create testUser3, userRole, true
            UserRole.create testUser4, userRole, true
            UserRole.create testUser5, userRole, true
            UserRole.create testUser6, userRole, true
            UserRole.create testUser7, userRole, true
            UserRole.create testUser8, userRole, true
            UserRole.create testUser9, userRole, true
            UserRole.create testUser10, userRole, true
            UserRole.create testUser11, userRole, true
            UserRole.create testUser12, userRole, true

            assert User.count() == 12
            assert Role.count() == 2
            assert UserRole.count() == 12
        }

    }

    def destroy = {
    }
}
