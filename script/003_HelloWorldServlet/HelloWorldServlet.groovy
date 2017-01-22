import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class HelloWorldServlet extends HttpServlet {

  def message

  @Override
  void doGet(
    HttpServletRequest req,
    HttpServletResponse rep
  ) {
    def writer = rep.getWriter()
    writer.write(message)
    writer.close()
  }

  @Override
  void doPost(
    HttpServletRequest req,
    HttpServletResponse rep
  ) {
    doGet req, rep
  }

}
