package com.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class SingleImageUploader
 */
@WebServlet("/singleImageUploader.do")
public class SingleImageUploader extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SingleImageUploader() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String return1 = "";
		String return2 = "";
		String return3 = "";
		String name = "";
		
		if(ServletFileUpload.isMultipartContent(request)) {
			ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
			
			uploadHandler.setHeaderEncoding("UTF-8");
			
			List<FileItem> items = uploadHandler.parseRequest((RequestContext) request);
			
			for (FileItem item : items) {
				if(item.getFieldName().equals("callback")) {
					return1 = item.getString("UTF-8");
				} else if(item.getFieldName().equals("callback_func")) {
					return2 = "?callback_func="+item.getString("UTF-8");
				} else if(item.getFieldName().equals("Filedata")) {
					if(item.getSize() > 0) {
						name = item.getName().substring(item.getName().lastIndexOf(File.separator)+1);
						String filename_ext = name.substring(name.lastIndexOf(".")+1);
						filename_ext = filename_ext.toLowerCase();
						String[] allow_file = {"jpg", "png", "bmp", "gif"};
						int cnt = 0;
						for(int i = 0; i < allow_file.length; i++) {
							if(filename_ext.equals(allow_file[i])) {
								cnt++;
							}
						}
						if(cnt == 0) {
							return3 = "&errstr="+name;
						} else {
							//?????? ????????????
							String dftFilePath = request.getServletContext().getRealPath("/");
							//?????? ????????????_????????????
							String filePath = dftFilePath + "editor" + File.separator + "upload" + File.separator;
							
							File file = null;
							file = new File(filePath);
							if(!file.exists()) {
								file.mkdirs();
							}
							
							String realFileNm = "";
							SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
							String today = formatter.format(new java.util.Date());
							realFileNm = today+UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
							
							String rlFileNm = filePath + realFileNm;
							
							//????????? ?????? ??????
							InputStream is = item.getInputStream();
							OutputStream os = new FileOutputStream(rlFileNm);
							int numRead;
							byte b[] = new byte[(int)item.getSize()];
							while((numRead = is.read(b,0,b.length))!= -1) {
								os.write(b,0,numRead);
							}
							if(is!=null) {
								is.close();
							}
							os.flush();
							os.close();
							
							return3 += "&bNewLine=true";
							//img ????????? title ????????? ????????? ?????? ?????????
							return3 += "&sFileName="+name;
							return3 += "&sFileURL=/se2/upload/"+realFileNm; 
						}
					} else {
						return3 += "&errstr=error";
					}
				}
			}
			
		}
		response.sendRedirect(return1+return2+return3);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
