import java.io.*;
import java.util.*;
 
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

public class UploadMunicipios extends HttpServlet {
   
   private boolean isMultipart;
   private String filePath;
   //revisar estos tamanios
   private int maxFileSize = 100 * 1024;
   //puedes poner estos dos tamanios iguales para que no se salven archivos temporales
   private int maxMemSize = 4 * 1024;
   private File file ;

   public void init( ){
      // este es la ruta de los archivos temporales. si los datos son mayores a maxMemSize, se guardan aquí
      // se tiene que crear el folder WEB-INF/temp y darle permisos de escritura
      filePath = getServletContext().getRealPath(File.separator)+"WEB-INF"+File.separator+"temp";

   }
   public void doPost(HttpServletRequest request, 
               HttpServletResponse response)
              throws ServletException, java.io.IOException {
   
      // Check that we have a file upload request
      isMultipart = ServletFileUpload.isMultipartContent(request);

      if( !isMultipart ){
      	//mandar mensaje de error, debe ser multipart la forma en el html 
      	//igual esto se puede borrar
      }
      
      
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File(filePath));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );

      try{ 
      // Parse the request to get file items.
      List fileItems = upload.parseRequest(request);
	
      // Process the uploaded file items
      Iterator i = fileItems.iterator();

		//como solo va a haber un campo, este while se puede quitar
      while ( i.hasNext () ) 
      {
         FileItem fi = (FileItem)i.next();
         //este if se puede quitar, solo verifica si si es de archivo o no.
         if ( !fi.isFormField () )	
         {

            /*nada de esto es necesario pero lo dejo por si lo necesitas en algun otro proyecto
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            String contentType = fi.getContentType();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
               file = new File( filePath + 
               fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
               file = new File( filePath + 
               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }*/

            BufferedReader br = new BufferedReader(new InputStreamReader(fi.getInputStream()));
            RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
            
            //parsear y dar de alta
 			String sCurrentLine;
 			br.readLine();
 			
			while ((sCurrentLine = br.readLine()) != null) {
				String[] municipios = sCurrentLine.split(",");
				int id = Integer.parseInt(municipios[1]);
				String nombre = municipios[2];
				int idE = Integer.parseInt(municipios[0]);
				String query = "INSERT INTO Municipio(nombre, id_estado) VALUES('"+nombre+"',"+idE+")";
				dbc.executeUpdate(query);
			}

			br.close();
			disp = getServletContext().getRequestDispatcher("/municipiosCargados.jsp");
			disp.forward(request,response);
         }
      }

   }catch(Exception ex) {
       ex.printStackTrace();
   }
   }
   public void doGet(HttpServletRequest request, 
                       HttpServletResponse response)
        throws ServletException, java.io.IOException {
        
        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
   } 
}