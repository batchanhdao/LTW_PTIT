package murach.email;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.Scanner;
import murach.business.User;
import murach.data.UserDB;

public class EmailListServlet extends HttpServlet {

    // declare an instance variable for the page
//    private int globalCount; // not thread-safe
//    public void init() throws ServletException
//    {
//        globalCount = 0; // initialize the instance variable
//    }
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String custServEmail = this.getServletContext()
                .getInitParameter("custServEmail");
        String relativePath = this.getServletConfig()
                .getInitParameter("relativePathToFile");

//        globalCount++;
        String url = "/index.html";

        // get current action
        String action = request.getParameter("action");
//        nếu client chưa có request gì thì action là 'join'
        if (action == null) {
            action = "join";  // default action
        }
        // perform action and set URL to appropriate page
        if (action.equals("join")) {
            url = "/index.html";    // the "join" page
        } //        ta quy định Key 'add' là có dữ liệu gửi đến từ phía client
        else if (action.equals("add")) {
            // get parameters from the request
            String firstName;
            firstName = request.getParameter("firstName");
            String lastName;
            lastName = request.getParameter("lastName");
            String email;
            email = request.getParameter("email");
            String phoneNumber;
            phoneNumber = request.getParameter("phoneNumber");
            String gender;
            gender = request.getParameter("gender");
            String[] values = request.getParameterValues("music");
//            String music = request.getParameter("music");
            String music = "";
            try {
                for (String value : values) {
                    music = music + value + ", ";
                }
                music = music.substring(0, music.length() - 2);
                System.out.println(music);
            } catch (Exception e) {
                System.out.println(e);

            }

            String path = this.getServletContext().getRealPath(relativePath);
            System.out.println(path);

            // store data in User object and save User object in db
            User user = new User(firstName, lastName, email, phoneNumber, gender, music);
//            UserDB.insert(user, path);

            // set User object in request object and set URL
//            request.setAttribute("user", user);
//            url = "/thanks.jsp";   // the "thanks" page
            String messageEmail = "";
            String messageName = "";
            String messageHo = "";

            File file = new File(path);
            Scanner sc = new Scanner(file);
            Boolean check = false;
            while (sc.hasNextLine()) {
                String s = sc.nextLine().trim();
                if (s.equals(user.getEmail())) {
                    check = true;
                    break;
                }
            }
            url = "/index.jsp";
            if (email == null
                    || email.isEmpty()) {
                messageEmail = "Please fill text boxes email.";
            } else if (firstName == null || firstName.isEmpty()) {
                messageName = "Please fill text boxes fistrname.";
            } else if (lastName == null
                    || lastName.isEmpty()) {
                messageHo = "Please fill text boxes lastname.";
            } else if (check) {
                messageEmail = "Email already exists";
            } else {
                messageEmail = "";
                messageHo = "";
                messageName = "";
                url = "/thanks.jsp";
                UserDB.insert(user, path);
            }
            request.setAttribute("user", user);
            request.setAttribute("messageEmail", messageEmail);
            request.setAttribute("messageHo", messageHo);
            request.setAttribute("messageName", messageName);

        }
        // chuyển tiếp yêu cầu và phản hồi objects to specified URL
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

}
