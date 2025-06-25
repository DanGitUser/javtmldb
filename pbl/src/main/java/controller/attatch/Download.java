package controller.attatch;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

@WebServlet("/download")
@Slf4j
public class Download extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Query String 
        // uuid, origin, path
        
        final String UPLOAD_PATH = "d:/upload/files";
        String uuid = req.getParameter("uuid");
        String origin = req.getParameter("origin");
        String path = req.getParameter("path");
        
        // change file name to origin b4 download
        log.info("{}, {}, {}", uuid, origin, path);
        
        File file = new File(UPLOAD_PATH + "/" + path, uuid);
        if (!file.exists()) {
            resp.setContentType("text/html; charset=utf-8");
            resp.getWriter().println("<h3>File doesn't exist</h3>");
            return;
        }
        resp.setContentType("application/octet-stream");
        resp.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(origin, "utf-8").replaceAll("\\+", "%20") + "\"");
        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
        BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
        
        bos.write(bis.readAllBytes());
        
        bis.close();
        bos.close();
    }
    
}
