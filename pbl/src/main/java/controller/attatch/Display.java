package controller.attatch;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.FileStore;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

@WebServlet("/display")
@Slf4j
public class Display extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Query String 
        // uuid, origin, path
        
        final String UPLOAD_PATH = "d:/upload/files";
        String uuid = req.getParameter("uuid");
        String path = req.getParameter("path");
        
        // change file name to origin b4 download
        log.info("{}, {}", uuid, path);
        
        File file = new File(UPLOAD_PATH + "/" + path, uuid);
        if (!file.exists()) {
            resp.setContentType("text/html; charset=utf-8");
            resp.getWriter().println("<h3>File doesn't exist</h3>");
            return;
        }
        resp.setContentType(Files.probeContentType(file.toPath()));
        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
        BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
        
        bos.write(bis.readAllBytes());
        
        bis.close();
        bos.close();
    }
    
}
