package controller.attatch;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import domain.Attach;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/upload")
@MultipartConfig(location = "d:/upload/tmp", 
    maxRequestSize = 50 * 1024 * 1024, // file size per request
    maxFileSize = 10 * 1024 * 1024, // max size per file
    fileSizeThreshold = 1 * 1024 * 1024) // if size is over max, puts it into buffer.
@Slf4j
public class UploadFile extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/uploadForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Collection<Part> parts = req.getParts();
        final String UPLOAD_PATH = "d:/upload/files";
        List<Attach> attachs = new ArrayList<>();
        
        int odr = 0;
        for (Part part : parts) {
            if (part.getSize() == 0) {
                continue;
            }
            Long fileSize = part.getSize();
            String origin = part.getSubmittedFileName();
            String contentType = part.getHeader("content-type");
            
            int idx = origin.lastIndexOf(".");
            String ext = "";
            if (idx >= 0) {
                ext = origin.substring(idx); 
            }

            UUID uuid = UUID.randomUUID();
            String fileName = uuid + ext;
            
            boolean image = contentType.startsWith("image");
            String path = genPath();
            
            String realPath = UPLOAD_PATH + "/" + path + "/";
            
            File file = new File(realPath);
            if (!file.exists()) {
                file.mkdirs();
            }
            
            part.write(realPath + fileName);
            if (image) {
                try {
                    Thumbnails.of(new File(realPath + fileName)).size(150, 150).toFile(realPath + "t_" + fileName);                    
                } catch (Exception e) {
                    image = false;
                }
            }
            
            log.info("{} :: {} :: {} :: {}", fileSize, origin, contentType, ext);
            attachs.add(Attach.builder()
                    .uuid(fileName)
                    .origin(origin)
                    .image(image)
                    .path(path)
                    .odr(odr++)
                    .build());
        }
        resp.setContentType("application/json; charset=utf-8");
        resp.getWriter().print(new Gson().toJson(attachs));
//        resp.sendRedirect("upload");
    }
    
    private String genPath() {
        return new SimpleDateFormat("yyyy/MM/dd").format(new Date());
    }
    
}
