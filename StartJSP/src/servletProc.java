

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servletProc")
public class servletProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public servletProc() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//한글이 있으면 한글로 인식해라
		response.setContentType("text/html;charset=utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String hobby[] = request.getParameterValues("hobby");
		String major = request.getParameter("major");
		String hero = request.getParameter("hero");
		
		
		PrintWriter out = response.getWriter();
		out.println("</html><head></head>");
		out.println("<title>서블릿 연습</title>");
		out.println("<body>이름 : "+ name +"<br>");
		out.println("id : "+ id +"<br>");
		out.println("pwd : "+ pwd +"<br>");
		out.println("취미 : "+ Arrays.toString(hobby) +"<br>");
		out.println("과목 : "+ major +"<br>");
		out.println("영웅 : "+ hero +"<br>");
		out.println("</body>");
		out.println("</html>");
		
		
	}

}
//서블릿 직접 만들었기 때문에 속도가 빠르고 컴파일 할 걱정 x
//서블릿을 간결하게 만들 수 있다.
//단점은 어렵다.
//JSP로 만들면 쉽지만 컴파일로 인해 느리다.
