package com.member.controller;

import com.member.action.Action;
import com.member.action.ActionForward;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String uri = request.getRequestURI();
		System.out.println("URI >>> " + uri);

		String path = request.getContextPath();
		System.out.println("Path >>> " + path);

		String command = uri.substring(path.length() + 1);
		System.out.println("Command >>> " + command);

		Action action = null;
		ActionForward forward = null;
		Properties prop = new Properties();
		FileInputStream fis = new FileInputStream(
				"C:\\Users\\ll001\\OneDrive\\문서\\GitHub\\Semi_project\\Semi_Project\\src\\main\\java\\com\\member\\controller\\mapping.properties");

		prop.load(fis);

		String value = prop.getProperty(command);
		System.out.println("value >>> " + value);

		if (value.substring(0, 7).equals("execute")) {
			StringTokenizer st = new StringTokenizer(value, "|");
			String url_1 = st.nextToken();
			String url_2 = st.nextToken();

			try {
				Class<?> url = Class.forName(url_2);

				Constructor<?> constructor = url.getConstructor();

				action = (Action) constructor.newInstance();

				forward = action.execute(request, response);

			} catch (Exception var16) {
				var16.printStackTrace();
			}
		} else {// value에 들어온 값이 "execute" 가 아닌 경우 view page로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);

		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());

				rd.forward(request, response);
			}
		}
	}
}
