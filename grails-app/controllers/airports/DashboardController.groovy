package airports

import airport.Airport
import airport.Comment
import grails.plugins.springsecurity.Secured
import account.AccountController

class DashboardController {
    private String getIdAirport(ArrayList arrayList, int i) {
        String id = arrayList[i - 1].toString();
        int k = 0;
        char[] mas = id.toCharArray();
        for (int j = 0; j < mas.size(); j++) {
            if (mas[j] == ':') {
                k = j + 2;
            }
        }
        int d = mas.size() - k;
        char[] mas2 = new char[d]
        for (int j = 0; j < mas2.size(); j++) {
            mas2[j] = mas[j + k];
        }
        return mas2.toString()
    }

    def index() {

        def commentName = Comment.executeQuery("select a.airport from Comment a group by a.airport ")
        def commentCountForName = Comment.executeQuery("select count(a.airport) from Comment a group by a.airport ")
        int i = 0;
        ArrayList listCommenAndAirportId = new ArrayList();
        ArrayList listAirportId = new ArrayList();
        ArrayList countCommentForAirport = new ArrayList();
        for (i = 0; i < commentName.size(); i++) {
            listCommenAndAirportId.add(commentName[i])
            listCommenAndAirportId.add(commentCountForName[i])
        }

        int maxCount = 0, idAirport = 0;
        int f = 0, varResultCount = 0; boolean maxValueIs = false;
        for (int h = 0; h < commentName.size(); h++) {
            maxCount = 0;
            r: for (i = 1; i < listCommenAndAirportId.size(); i = i + 2) {
                if (countCommentForAirport[f] == null) {
                    varResultCount = -1
                } else {
                    varResultCount = (int) countCommentForAirport[f]
                }
                for (int d = 0; d < countCommentForAirport.size(); d++) {
                    if ((int) countCommentForAirport[d] == (int) listCommenAndAirportId[i]) {
                        maxValueIs = true;
                        continue r;
                    }
                }
                if (maxCount < (int) listCommenAndAirportId[i]) {
                    maxCount = (int) listCommenAndAirportId[i];
                    idAirport = Integer.parseInt(getIdAirport(listCommenAndAirportId, i));


                }
            }
            if (h > 0) {
                f++
            }
            listAirportId.add(idAirport);
            countCommentForAirport.add(maxCount)
        }
        ArrayList topAirportsInTheComments = new ArrayList()
        for (i = 0; i < listAirportId.size(); i++) {
            int airportIdInList = (int) listAirportId[i];
            topAirportsInTheComments.add(Airport.findById(airportIdInList))
        }
        def airports = topAirportsInTheComments
        def commentDateDesc = Comment.listOrderByDate(max: 10, order: "desc");
        [airports: airports, lastTenComment: commentDateDesc]
    }

}
