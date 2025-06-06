   import { useState } from "react";
   import { Document, Page, pdfjs } from "react-pdf";
   import "react-pdf/dist/esm/Page/AnnotationLayer.css";
   import "react-pdf/dist/esm/Page/TextLayer.css";

   pdfjs.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjs.version}/pdf.worker.min.js`;

   export default function PDFViewerScreen() {
     const [numPages, setNumPages] = useState(null);
     const [pageNumber, setPageNumber] = useState(1);

     function onDocumentLoadSuccess({ numPages }) {
       setNumPages(numPages);
       setPageNumber(1);
     }

     return (
       <div style={{ minHeight: "100vh", background: "linear-gradient(to bottom, #e1f5fe, #fce4ec)" }}>
         <div style={{ background: "#b3e5fc", color: "#fff", padding: "1rem 2rem" }}>
           <h1 style={{ fontSize: "1.25rem", fontWeight: "bold", margin: 0 }}>PDF Viewer</h1>
         </div>
         <div style={{ display: "flex", flexDirection: "column", alignItems: "center", marginTop: 40 }}>
           <Document
             file="/pdfs/sample.pdf"
             onLoadSuccess={onDocumentLoadSuccess}
             loading={<div>Loading PDF...</div>}
             error={<div>Could not load PDF. Make sure the file exists.</div>}
           >
             <Page pageNumber={pageNumber} />
           </Document>
           <div style={{ marginTop: 20 }}>
             <button onClick={() => setPageNumber(page => Math.max(page - 1, 1))} disabled={pageNumber <= 1}>
               Previous
             </button>
             <span style={{ margin: "0 10px" }}>
               Page {pageNumber} of {numPages}
             </span>
             <button onClick={() => setPageNumber(page => Math.min(page + 1, numPages))} disabled={pageNumber >= numPages}>
               Next
             </button>
           </div>
         </div>
       </div>
     );
   }