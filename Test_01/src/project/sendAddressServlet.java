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
	
	System.out.println("����"+s);
	try {
		//Runtime.getRuntime().exec(cmd);
		Runtime.getRuntime().exec(cmd);
		System.out.println("�Ѿ�ִ��������");
		TimeUnit.SECONDS.sleep(33);
		message = "�ļ���ȡ�ɹ���";
		
	} catch (InterruptedException e) {
		// TODO Auto-generated catch block
		message = "�ļ���ȡʧ�ܣ�";
		e.printStackTrace();
		
	}
//	request.getSession().setAttribute("address", "127.0.0.1:8080/Test/download/truck.mp4");
	String path = request.getContextPath();
	request.getSession().setAttribute("address", path+"/download/truck.mp4");
	request.setAttribute("message",message);
	request.getRequestDispatcher("/message.jsp").forward(request, response);
	}
	
}
