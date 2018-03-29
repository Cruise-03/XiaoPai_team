package project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.UploadHandleServlet;
import java.util.concurrent.TimeUnit;

public class sendAddressServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

	HttpSession session =request.getSession();
	String s=(String) session.getAttribute("filename");
	String message = "";
	String cmd="cmd /C start E:\\javaee_workspace\\Test_01\\WebContent\\dos.bat";
	
	System.out.println("这是"+s);
	try {
		//Runtime.getRuntime().exec(cmd);
		Runtime.getRuntime().exec(cmd);
		System.out.println("已经执行命令行");
		TimeUnit.SECONDS.sleep(33);
		message = "文件获取成功！";
		
	} catch (InterruptedException e) {
		// TODO Auto-generated catch block
		message = "文件获取失败！";
		e.printStackTrace();
		
	}
//	request.getSession().setAttribute("address", "127.0.0.1:8080/Test/download/truck.mp4");
	String path = request.getContextPath();
	request.getSession().setAttribute("address", path+"/download/truck.mp4");
	request.setAttribute("message",message);
	request.getRequestDispatcher("/message.jsp").forward(request, response);
	}
	
}
