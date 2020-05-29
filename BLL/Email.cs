using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;
using System.Reflection;
using System.Reflection.Metadata;
using System.CodeDom.Compiler;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Document = iTextSharp.text.Document;

namespace BLL
{
    public class Email
    {
        public void enviar(Usuario usuario, string urlPdf)
        {
            try
            {
                MailMessage emaile = new MailMessage();


                emaile.To.Add(new MailAddress(usuario.email));
                emaile.To.Add(new MailAddress("plataformavirtualucrpacifico@gmail.com"));


                emaile.From = new MailAddress("plataformavirtualucrpacifico@gmail.com");


                emaile.Subject = "Factura de compra Distribuciones del Pacifico CR";


                String html = "Distribuciones del Pacifico CR.";
                html += "Para nosotros es un gusto servirle";
                html += "<br><b>Informe de compra De <b/>" + usuario.nombreCompleto;
                html += "<br>A continuacion se adjuntara un resivo con los detalles de su compra";
                html += "<br><b>No responda este correo porque se genera automaticamente";
                html += " por la plataforma Distribuciones del Pacifico CR<b/>";


                emaile.IsBodyHtml = true;


                emaile.Priority = MailPriority.Normal;

                Attachment item = new Attachment(urlPdf);

                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(html,
                    Encoding.UTF8, MediaTypeNames.Text.Html);

                emaile.Attachments.Add(item);


                emaile.AlternateViews.Add(htmlView);


                SmtpClient smtp = new SmtpClient();


                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("DistribuidoraQueTodoLoPuede@gmail.com",
                    "ucr2020$");


                smtp.Send(emaile);


                emaile.Dispose();
                smtp.Dispose();
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void generaPdf(Usuario u, string urlCrearPdf, String urlImagen,List<DetalleFactura> arrayProductos)
        {
            FileStream fl = new FileStream(urlCrearPdf, FileMode.Create);
            Document documento = new Document(iTextSharp.text.PageSize.LETTER, 0, 0, 0, 0);
            PdfWriter pw = PdfWriter.GetInstance(documento, fl);

            documento.Open();

            iTextSharp.text.Image image1 = iTextSharp.text.Image.GetInstance(urlImagen);
            //image1.ScalePercent(50f);
            image1.ScaleAbsoluteWidth(200);
            image1.ScaleAbsoluteHeight(200);

            image1.Alignment = iTextSharp.text.Image.ALIGN_CENTER;
            documento.Add(image1);
            Paragraph cabeza = new Paragraph("Factura");
            cabeza.Font.Size = 20;
            cabeza.Alignment = Element.ALIGN_CENTER;
            cabeza.IndentationRight = 20;
            documento.Add(cabeza);
            documento.Add(Chunk.NEWLINE);



            Paragraph pNombre = new Paragraph("Nombre: " + u.nombreCompleto);
            pNombre.Alignment = Element.ALIGN_CENTER;
            documento.Add(pNombre);
            Paragraph pCedula = new Paragraph("Cedula: " + u.cedula);
            pCedula.Alignment = Element.ALIGN_CENTER;
            documento.Add(pCedula);
            Paragraph pTelefono = new Paragraph("Telefono: " + u.telefono);
            pTelefono.Alignment = Element.ALIGN_CENTER;
            documento.Add(pTelefono);
            Paragraph pDireccion = new Paragraph("Direccion: " + u.direccion);
            pDireccion.Alignment = Element.ALIGN_CENTER;
            documento.Add(pDireccion);
            Paragraph pNumeroFactura = new Paragraph("Numero de Factura: 01");
            pNumeroFactura.Alignment = Element.ALIGN_CENTER;
            documento.Add(pNumeroFactura);

            documento.Add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(4);
            table.AddCell("Codigo de barra");
            table.AddCell("Producto");
            table.AddCell("Cantidad");
            table.AddCell("SubTotal");



            for (int i = 0; i < arrayProductos.Count; i++)
            {
                table.AddCell(arrayProductos[i].codigoDeBarra);
                table.AddCell(arrayProductos[i].descripcion);
                table.AddCell(""+arrayProductos[i].cantidad);
                table.AddCell(""+arrayProductos[i].subTotal);
                
            }
            documento.Add(table);

            documento.Add(Chunk.NEWLINE);


            Paragraph pSubTotal = new Paragraph("SubTotal: 1000000");
            pSubTotal.Alignment = Element.ALIGN_CENTER;
            documento.Add(pSubTotal);

            Paragraph pMontoImpuesto = new Paragraph("Monto impuesto: 50000");
            pMontoImpuesto.Alignment = Element.ALIGN_CENTER;

            documento.Add(pMontoImpuesto);

            Paragraph pDescuento = new Paragraph("Descuento: 10%");
            pDescuento.Alignment = Element.ALIGN_CENTER;

            documento.Add(pDescuento);

            Paragraph pNontoTotal = new Paragraph("Monto total: 123210");
            pNontoTotal.Alignment = Element.ALIGN_CENTER;
            documento.Add(pNontoTotal);

            Paragraph pTipoDePago = new Paragraph("Tipo de Pago: Efectivo");
            pTipoDePago.Alignment = Element.ALIGN_CENTER;
            documento.Add(pTipoDePago);

            documento.Add(Chunk.NEWLINE);
            Paragraph pGracias = new Paragraph("Gracias por su compra");
            pGracias.Alignment = Element.ALIGN_CENTER;
            pGracias.Font.Size = 15;
            documento.Add(pGracias);
            documento.Close();


        }

    }
}
